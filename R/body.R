body <- function() {
  th_m <- if( TRUE ){
    theme_function(primary = "#649191", dark_theme = TRUE) 
  }else{
    theme_function(primary = "#649191", dark_theme = FALSE) 
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
      mod_comp_details_ui("comp_details_ui_1"),
      mod_comp_report_ui("comp_report_ui_1")
    )
  )
}
