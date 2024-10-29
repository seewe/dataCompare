# Module UI
 
#' @title mod_comp_desc_ui and mod_comp_desc_server
#' @description A shiny module.
#' @param id an id
#' @returns No return value
 
mod_comp_desc_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "comp_desc",
		column(6,
		       box(title = "Dimension of tables to compare", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("frame_summary_table"))),
		       box(title = "Comparison summary table", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("comparison_summary_table")))
		       ),
		column(6,
		       box(title = "Variables not compared", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("vars_nc_table"))),
		       br(),
		       box(title = "Non-identical attributes", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("attrs_table"))),
		       br(),
		       box(title = "Variable not shared", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("vars_ns_table"))),
		       br(),
		       box(title = "Observations not shared", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("obs_table")))
		       )
	)
}
 
# Module Server
 
mod_comp_desc_server <- function(input, output, session, RV = rv) {
	ns <- session$ns
	
  output$frame_summary_table <- DT::renderDT({
    RV()$comparison_summary_object$frame_summary_table %>% data_table_formatter(.)
  })
  
  output$comparison_summary_table <- DT::renderDT({
    RV()$comparison_summary_object$comparison_summary_table %>% data_table_formatter(., n_page = 15)
  })
  
  output$vars_nc_table <- DT::renderDT({
    RV()$comparison_summary_object$vars_nc_table %>% data_table_formatter(.)
  })
  
  output$attrs_table <- DT::renderDT({
    RV()$comparison_summary_object$attrs_table %>% data_table_formatter(.)
  })
  
  output$vars_ns_table <- DT::renderDT({
    RV()$comparison_summary_object$vars_ns_table %>% data_table_formatter(.)
  })
  
  output$obs_table <- DT::renderDT({
    RV()$comparison_summary_object$obs_table %>% data_table_formatter(.)
  })
	
}
 
## copy to body.R
# mod_comp_desc_ui("comp_desc_ui_1")
 
## copy to app_server.R
# callModule(mod_comp_desc_server, "comp_desc_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "comp_desc",icon = icon("user"))
 
