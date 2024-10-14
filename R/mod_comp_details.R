# Module UI
 
#' @title mod_comp_details_ui and mod_comp_details_server
#' @description A shiny module.
#' @param id an id
#' @returns No return value
 
mod_comp_details_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "comp_details",
		column(4,
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
		       
		),
		column(8,
		       box(title = "Differences detected", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("diffs_table")))
		)
	)
}
 
# Module Server
 
mod_comp_details_server <- function(input, output, session, RV = rv) {
	ns <- session$ns
	
	output$diffs_table <- DT::renderDT({
	  RV()$comparison_summary_object$diffs_table %>% data_table_formatter(., n_page = 20)
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
# mod_comp_details_ui("comp_details_ui_1")
 
## copy to app_server.R
# callModule(mod_comp_details_server, "comp_details_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "comp_details",icon = icon("user"))
 
