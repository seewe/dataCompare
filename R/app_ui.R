
app_ui <- function() {
  tagList(
    golem_add_external_resources()
  )
  dashboardPage(
    header(),
    sidebar(),
    body(),
    footer = footer(),
    scrollToTop = TRUE,
    title = "dfComparator"
  )
}
