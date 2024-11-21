# Module UI
 
mod_load_data_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "load_data",
		
		
		fluidRow(
		  column(3,
		         box(title = "Panel for input data (.rds, .csv or .tsv)", 
		             width = 12,
		             background = "black",
		             collapsible = TRUE, 
		             br(),
		             radioGroupButtons(
		               inputId = ns("file_separ"),
		               label = "Input file separator (csv) :",
		               choices = c("semi column (;)"= ";", "comma (,)" = ",", "column (:)" = ":"),
		               size = "sm",
		               checkIcon = list(
		                 yes = tags$i(class = "fa fa-check-square"),
		                 no = tags$i(class = "fa fa-square-o"))
		             ),
		             br(),
		             fileInput(inputId = ns("upload_data_1"), 
		                       label = "Upload the first data for the comparison (size <= 30 Mb)",
		                       buttonLabel = "Upload...", 
		                       accept = c(".rds, ", ".csv", ".tsv")),
		             br(),
		             fileInput(inputId = ns("upload_data_2"), 
		                       label = "Upload the second data for the comparison (size <= 30 Mb)", 
		                       buttonLabel = "Upload...", 
		                       accept = c(".rds, ", ".csv", ".tsv")),
		             br(),
		             uiOutput(ns("idSelectInput")),
		             br(),
		             actionButton(ns("run_comparison"), "COMPARE", icon = icon("play"))
		             ),
		           valueBoxOutput(ns("comparatorBox"), width = 12)
		         ),
		  column(9,
		         fluidRow(
		            box(title = "Numeric variables in data 1", 
		                                width = 6,
		                                background = "black",
		                                collapsible = TRUE,
		               DT::DTOutput(ns("upload_data_1_num")) %>% 
		                 shinycssloaders::withSpinner(.)
		           ),
		           box(title = "Numeric variables in data 2", 
		               width = 6,
		               background = "black",
		               collapsible = TRUE,
		               DT::DTOutput(ns("upload_data_2_num")) %>% 
		                 shinycssloaders::withSpinner(.)
		           )
		         ),
		         fluidRow(
		           box(title = "Character variables in data 1", width = 6,
		               background = "black",
		               collapsible = TRUE,
		               DT::DTOutput(ns("upload_data_1_char")) %>% 
		                 shinycssloaders::withSpinner(.)
		           ),
		           box(title = "Character variables in data 2", width = 6,
		               background = "black",
		               collapsible = TRUE,
		               DT::DTOutput(ns("upload_data_2_char")) %>% 
		                 shinycssloaders::withSpinner(.)
		           )
		         )
		)
		)
	)
}
 
# Module Server
 
mod_load_data_server <- function(input, output, session) {
	ns <- session$ns
	rv_loaded_data <- reactiveValues(
	  comparison_summary_object = list(diff_percentage = NA_real_),
	  click_on_run = 0,
	  df1 = data.frame(),
	  df2 = data.frame(),
	  ids = "ID"
	)
	
	# Define constants
	comp_ind_value <- sample(x = c(NA_real_, 0,90), size = 1, replace = FALSE)
	id_variable_list <- reactive({ 
	  same_variables(upload_data_1(), upload_data_2())
	})
	
	# Define reactive input for IDs variables
	output$idSelectInput <- renderUI({
	  shiny::selectInput(
	    inputId = ns("idVariables"), 
	    label = "Define Id variable for the comparison", 
	    choices = id_variable_list(),
	    multiple = TRUE
	    )
	})
	
	# Loaded data 1
	upload_data_1 <- reactive({
	  req(input$upload_data_1)
	  req(input$file_separ)
	  read_loaded_df(input_file_data = input$upload_data_1, file_sep = input$file_separ)
	})
	
	# Loaded data 2
	upload_data_2 <- reactive({
	  req(input$upload_data_2)
	  req(input$file_separ)
	  read_loaded_df(input_file_data = input$upload_data_2, file_sep = input$file_separ)
	})
	
	# Comparison summary object
	
	observeEvent(input$run_comparison, {
	 shinycssloaders::showPageSpinner()
	  rv_loaded_data$comparison_summary_object <- compare_data_frame_object( upload_data_1(), upload_data_2(), input$idVariables )
	  rv_loaded_data$click_on_run <- rv_loaded_data$click_on_run + 1
	  rv_loaded_data$df1 = upload_data_1()
	  rv_loaded_data$df2 = upload_data_2()
	  rv_loaded_data$ids = input$idVariables
	  shinycssloaders::hidePageSpinner()
	})
	
	# Indicator on dataframe comparison
	output$comparatorBox <- renderValueBox({
	  
	  val_box_col <- case_when(is.na(rv_loaded_data$comparison_summary_object$diff_percentage)~ "black", 
	                           rv_loaded_data$comparison_summary_object$diff_percentage>0 ~ "fuchsia", 
	                           .default = "green")
	  val_box_ico <- case_when(is.na(rv_loaded_data$comparison_summary_object$diff_percentage)~ "minus", 
	                           rv_loaded_data$comparison_summary_object$diff_percentage>0 ~ "remove", 
	                           .default = "ok")
	  
	  valueBox(
	    ifelse( is.na(rv_loaded_data$comparison_summary_object$diff_percentage), 
	            "No comparison", 
	            paste0(rv_loaded_data$comparison_summary_object$diff_percentage, "%")  ),
	    ifelse( is.na(rv_loaded_data$comparison_summary_object$diff_percentage), 
	            "indicator of diference is Not Available. 
	             Please load data first, select IDs variables,
	             then click on 'COMPARE' button to perform 
	             the comparison.", 
	            "Of cells are diferent. Please open the 
	             two nexts tabs to read more details on 
	             this differences percentage. open the fourth tab and
	             click on 'RUN' to build the html report  
	             then on 'SAVE' to download the html report"),
	    icon = icon(val_box_ico, lib = "glyphicon"),
	    color = val_box_col
	  )
	})
	
	# render numeric Skim on the first loaded data
	output$upload_data_1_num <- DT::renderDT({
	  upload_data_1() %>% 
	    explore::describe()  %>% 
	    filter(!is.na(`mean`)) %>% 
	    data_table_formatter(.)
	})
	
	# render character Skim on the first loaded data
	output$upload_data_1_char <- DT::renderDT({
	   upload_data_1() %>% 
	    explore::describe() %>% 
	    filter(is.na(`mean`)) %>% 
	    select(-c(min, mean, max)) %>% 
	    data_table_formatter(.)
	})
	
	# render numeric Skim on the second loaded data
	output$upload_data_2_num <- DT::renderDT({
	  upload_data_2() %>% 
	    explore::describe() %>%
	    filter(!is.na(`mean`)) %>% 
	    data_table_formatter(.)
	})
	
	# render character Skim on the second loaded data
	output$upload_data_2_char <- DT::renderDT({
	  upload_data_2() %>% 
	    explore::describe() %>% 
	    filter(is.na(`mean`)) %>% 
	    select(-c(min, mean, max)) %>% 
	    data_table_formatter(.)
	})
	
	return(rv_loaded_data)
	
}
 
## copy to body.R
# mod_load_data_ui("load_data_ui_1")
 
## copy to app_server.R
# callModule(mod_load_data_server, "load_data_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "load_data",icon = icon("user"))
 
