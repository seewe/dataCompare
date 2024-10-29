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
		       box(title = "Description of difference by variable", width = 12,
		           background = "black",
		           collapsible = TRUE,
		           DT::DTOutput(ns("diffs_byvar_table")))
		),
		column(8,
		       box(title = "Description of differences cell by cell", width = 12,
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
	
	output$diffs_byvar_table <- DT::renderDT({
	  RV()$comparison_summary_object$diffs_byvar_table %>% data_table_formatter(., n_page = 15)
	})
	
}
 
## copy to body.R
# mod_comp_details_ui("comp_details_ui_1")
 
## copy to app_server.R
# callModule(mod_comp_details_server, "comp_details_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "comp_details",icon = icon("user"))
 
