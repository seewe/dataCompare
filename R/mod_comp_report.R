# Module UI

mod_comp_report_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "comp_report",
    fluidRow(
      column(width = 4,
             img(src = "www/context.png", width="100%")
      ),
      column(
        width = 4,
        box(title = "HTML REPORT INPUTS", 
            width = 12,
            background = "black",
            collapsible = TRUE, 
            br(),
            shiny::textInput(ns("report_title"), 
                             label = "Enter the title of the report", 
                             placeholder = "Comparator report", 
                             value = "title"),
            br(),
            shiny::textInput(ns("report_author"), 
                             label = "Enter the author name of the report", 
                             placeholder = "Enter your name here", 
                             value = "author name"),
            br(),
            shiny::textAreaInput(ns("report_context"), 
                                 label = "Enter a text to describe the context (resize verticaly if needed)",
                                 placeholder = "Please enter at least one 
                                 sentence here !",
                                 value = "Context here",
                                 resize = "vertical"),
            br(),  
            htmltools::h3("Click on the 'RUN' button to build the html report"),
            br(), 
            htmltools::div(
              style = "text-align: center;",
              shiny::inputPanel(
                shiny::actionButton(ns("run_report"), 
                                    label = "RUN", 
                                    icon = icon("play"))
              )
            )
        )
      ),
      column(4,
             shiny::uiOutput(ns("downloadUI"))
      )
    )
  )
}
 
# Module Server
 
mod_comp_report_server <- function(input, output, session, RV = rv) {
  ns <- session$ns
  
  # Reactive value to store the report path
  rv_temp_file <- shiny::reactiveValues(report_path = NULL)
  
  # Run the report
  
  observeEvent(input$run_report, {
    
    shinycssloaders::showPageSpinner()
    
    rv_temp_file$report_path <- compare_data_frame_object_report(
      RV()$df1,
      RV()$df2,
      RV()$ids,
      input$report_title,
      input$report_author,
      input$report_context
    )
    
    # Run the report
    
    output$downloadUI <- renderUI({
      box(title = "DOWNLOAD REPORT", 
          width = 12,
          background = "black",
          collapsible = TRUE, 
          htmltools::h3("Click on the 'DOWNLOAD' button to save the html report"),
          br(),  
          htmltools::div(
            style = "text-align: center;",
            shiny::inputPanel( 
              shiny::downloadButton(ns("download_report"), 
                                    label = "DOWNLOAD", 
                                    icon = icon("download"))
            ),
            br(),
            img(src = "www/printer.png", width="50%")
          )
      )
    })
    
    shinycssloaders::hidePageSpinner()
    
  })
  
  # download the report
  
  output$download_report <- shiny::downloadHandler(

    filename <- paste0("Comparison_report_",
                       round(as.numeric(Sys.time())),
                       ".html"),

    content = function(file) {
      file.copy(
        rv_temp_file$report_path,
        file
        )
      # Cleanup temporary files when the session ends
      unlink(rv_temp_file$report_path, recursive = TRUE, force = TRUE)
    }
  )
  
  # Cleanup temporary files when the session ends
  session$onSessionEnded(function() {
    if(!is.null(shiny::isolate(rv_temp_file$report_path))){
      unlink(shiny::isolate(rv_temp_file$report_path), recursive = TRUE, force = TRUE)
    }
  })
  
  
}

## copy to body.R
# mod_comp_report_ui("comp_report_ui_1")
 
## copy to app_server.R
# callModule(mod_comp_report_server, "comp_report_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "comp_report",icon = icon("user"))
 
