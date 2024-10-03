sidebar <- function() {
  dashboardSidebar(
    sidebarMenu(
      menuItem("read Me",tabName = "intro",icon = icon("info-sign", lib = "glyphicon")),
      menuItem(" Load data",tabName = "load_data",icon = icon("cloud-upload", lib = "glyphicon")),
      menuItem(" Comparison description", tabName = "comp_desc", icon = icon("duplicate", lib = "glyphicon")),
      menuItem(" Details on difference", tabName = "comp_details", icon = icon("book", lib = "glyphicon"))
    )
  )
}
