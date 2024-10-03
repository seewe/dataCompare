body <- function() {
  th_m <- if( between(hour(Sys.time()), 6, 19)){
    # theme_function(primary = "#6D6855", accent = "#B2AF98", secondary = "#BD8301")
    theme_function(primary = "#649191", accent = "#B2AF98", secondary = "#658ccf", dark_theme = TRUE) 
  }else{
    theme_function(primary = "#649191", accent = "#B2AF98", secondary = "#658ccf", dark_theme = TRUE) 
  }
  dashboardBody(
    th_m,
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "www/body.css"),
      tags$script(src = "custom.js")
    ),
    tabItems(
      mod_intro_ui("intro_ui_1"),
      mod_load_data_ui("load_data_ui_1"),
      mod_comp_desc_ui("comp_desc_ui_1"),
      mod_comp_details_ui("comp_details_ui_1")
    )
  )
}
