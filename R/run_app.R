#' Run the dataCompare Shiny Application
#' 
#' @param ... list of arguments
#' @returns No return value, launch the app
#'
#' @export
#' @importFrom shiny runApp
#' @importFrom golem with_golem_options
run_data_compare_app <- function(...) {
  with_golem_options(
    app = shinyApp(ui = app_ui, server = app_server), 
    golem_opts = list(...)
  )
}
