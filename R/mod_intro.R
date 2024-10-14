# Module UI
 
#' @title mod_intro_ui and mod_intro_server
#' @description A shiny module.
#' @param id an id
#' @returns No return value
 
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
			         p("This tab allows the user to load data and perform comparison of loaded data.", br(),
			           strong("INPUTS : "),"Upload inputs help to load data into the application. The extensions accepted here are :", br(),
			           strong(".csv, .tsv and .rds"), br(),
			           "After the user has loaded the data, he can press the '>COMPARE' button to perform the comparison. ", br(),
			           "The value box below the input box will show the percentage of difference and will be coloured according to the value.", br(),
			           strong("OUTPUTS : "),"A high level description of the data loaded by the uploader. Here the user can find:", br(),
			           "variable names, variable types, the complete set, the distribution or the number of unique values.", br()
			           )
			       ),
			       box(
			         title = "Description of Comparison section", 
			         width = NULL, 
			         background = "black",
			         collapsible = TRUE,
			         p("This tab allows the user to read the first results of the comparison.", br(),
			           strong("OUTPUTS : "),"Several tables are displayed here:", br(),
			           " -> Input data dimension table, which shows the number of rows and columns of data to be compared", br(),
			           " -> Comparison summary table, which shows the values of the comparison indicator", br(),
			           "Number of differences by variable table, which shows the number of differences by variables in the data", br(),
			           "table of variables not compared, which shows the variables of each input data that are not compared with others", br()
			         )
			       ),
			       box(
			         title = "Differences details section", 
			         width = NULL, 
			         background = "black",
			         collapsible = TRUE,
			         p("This tab allows the user to read the differences between the input data, cell by cell.", br(),
			           strong("OUTPUTS : "),"Several tables are shown here:", br(),
			           " -> Table of attributes showing the non-identical attributes between the two data", br(),
			           " -> table showing the variables present on X but not on Y and on Y but not on X", br(),
			           " -> Non-shared observations table, showing the observations not shared between the two data", br(),
			           " -> detected differences table, showing all differences in the data row by row", br()
			         )
			       ),
			       box(
			         title = "More ressources ...", 
			         width = NULL, 
			         background = "black",
			         collapsible = TRUE,
			         tags$a("'dataCompare' github repository", target = "_blank", href = "https://github.com/seewe/dataCompare/tree/main"), br(),
			         tags$a("'comparedf' function from 'arsenal' package", target = "_blank", href = "https://mayoverse.github.io/arsenal/articles/comparedf.html"), br(),
			         tags$a("'arsenal' package page", target = "_blank", href = "https://mayoverse.github.io/arsenal/index.html"), br(),
			         tags$a("'skimr' package page", target = "_blank", href = "https://cran.r-project.org/web/packages/skimr/vignettes/skimr.html"), br(),
			         tags$a("'golemverse' main page", target = "_blank", href = "https://golemverse.org/"), br(),
			         tags$a("'golem' book", target = "_blank", href = "https://engineering-shiny.org/"), br(),
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
 
