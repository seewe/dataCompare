# Module UI

mod_comp_report_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "comp_report",
    fluidRow(
      column(
        width = 3,
        box(title = "HTML REPORT", 
            width = 12,
            background = "black",
            collapsible = TRUE, 
            br(),
            shiny::textInput(ns("report_title"), "Enter the title of the report", placeholder = "Comparator report", value = "title"),
            br(),
            shiny::textInput(ns("report_author"), "Enter the author name of the report", placeholder = "Enter your name here", value = "author name"),
            br(),
            shiny::textAreaInput(ns("report_context"), "Enter a text to describe the context", placeholder = "Please enter at least one sentence here !", value = "Context here"),
            br(), 
            shiny::inputPanel( 
              shiny::actionButton(ns("run_report"), "RUN", icon = icon("play"))
            ),
            br(),
            shiny::htmlOutput(ns("downloadUI")),
            br(),
            img(src = "www/printer.png", width="100%")
            
        )
      ),
      column(9,
             img(src = "www/report.png", width="5%"),
             br(),
             shiny::htmlOutput(ns("html_report"))
      )
    )
  )
}
 
# Module Server
 
mod_comp_report_server <- function(input, output, session, RV = rv) {
  ns <- session$ns
  
  # Run the report
  
  observeEvent(input$run_report, {
    
    shinycssloaders::showPageSpinner()
    
    params <- list(df1_input = RV()$df1,
                   df2_input = RV()$df2,
                   id_input = RV()$ids,
                   title_input = input$report_title,
                   author_input = input$report_author,
                   context_input = input$report_context)
    rmarkdown::render(system.file("app", "www", "Comparison_report.Rmd", package = "dataCompare"), 
                      output_file = paste0("Comparison_report.html"), 
                      params = params,
                      envir = new.env(parent = globalenv())
    )
    
    # Print report in shiny
    
    output$html_report <- renderUI({
      tags$iframe(seamless="seamless",
                  src = paste0("www/Comparison_report.html"),
                  width = "80%",
                  height = 850,
                  frameborder = "no"
      )
    })
    
    # print download button 
    
    output$downloadUI <- renderUI({
      shiny::inputPanel(
        shiny::downloadButton(ns("download_report"), "DOWNLOAD", icon = icon("download"))
      )
    })
    
    shinycssloaders::hidePageSpinner()
    
  })
  
  # download the report
  
  output$download_report <- shiny::downloadHandler(
    
    filename <- paste0("Comparison_report_",round(as.numeric(Sys.Date())),".html"),
    
    content = function(file) {
      tempReport <- system.file("app", "www", "Comparison_report.Rmd", package = "dataCompare")
      params <- list(df1_input = RV()$df1,
                     df2_input = RV()$df2,
                     id_input = RV()$ids,
                     title_input = input$report_title,
                     author_input = input$report_author,
                     context_input = input$report_context)
      rmarkdown::render(tempReport, 
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
      )
    }
    
  )
  
}

## copy to body.R
# mod_comp_report_ui("comp_report_ui_1")
 
## copy to app_server.R
# callModule(mod_comp_report_server, "comp_report_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "comp_report",icon = icon("user"))
 
