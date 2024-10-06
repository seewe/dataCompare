# Module UI
 
#' @title mod_intro_ui and mod_intro_server
#' @description A shiny module.
#' @param id an id
 
mod_intro_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "intro",
		fluidRow(
			column(width = 6,
			       img(src = "www/dfComparator_vignette.png", width="100%")
			       ),
			column(width = 6,
			       box(
			         title = "Load data section", 
			         width = NULL, 
			         background = "black",
			         collapsible = TRUE,
			         p("This tab allows user to load data and run the comparison of loaded data.", br(),
			           strong("INPUTS : "),"Upload inputs help to load data in the app. The extensions accepted here are :", br(),
			           strong(".csv, .tsv and .rds"), br(),
			           "After the user load the data, he can heat on '>COMPARE' button to run the comparison. ", br(),
			           "The value box bellow the input box will shows the percentage of difference and will be colored acording to the value.", br(),
			           strong("OUTPUTS : "),"A high level description of data loaded through the uploader. Here, user may find :", br(),
			           "variables names, variables types, the complete rate, the distribution or the number of unique values.", br()
			           )
			       ),
			       box(
			         title = "Comparison description", 
			         width = NULL, 
			         background = "black",
			         collapsible = TRUE,
			         p("This tab allows user to read the first results of the comparison.", br(),
			           strong("OUTPUTS : "),"several tables are diplayed here :", br(),
			           " -> table of input data dimension, which shows the number of rows and columns of data to compare", br(),
			           " -> table of comparison summary, which shows values of comparison indicator", br(),
			           " -> table of number of difference by variable, which shows the number of difference by variables in data", br(),
			           " -> table of variables not compared, which shows the variables of each input data which are not compare to others.", br()
			         )
			       ),
			       box(
			         title = "Details on difference", 
			         width = NULL, 
			         background = "black",
			         collapsible = TRUE,
			         p("This tab allows user to read the differences between input data cell by cell.", br(),
			           strong("OUTPUTS : "),"several tables are diplayed here :", br(),
			           " -> table of attributs, which shows non identical attributs between the two data", br(),
			           " -> table of not shared variables, which shows variables in X but not in Y and present in Y but not in X", br(),
			           " -> table of not shared observations, which shows the observations not shared between the two data", br(),
			           " -> table of detected diferences, which shows all the diferences in the data row by row.", br()
			         )
			       )
			       
			       )
		)
	)
}
 
# Module Server
 
mod_intro_server <- function(input, output, session) {
	ns <- session$ns
}
 
## copy to body.R
# mod_intro_ui("intro_ui_1")
 
## copy to app_server.R
# callModule(mod_intro_server, "intro_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "intro",icon = icon("user"))
 
