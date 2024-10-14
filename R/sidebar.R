sidebar <- function() {
  dashboardSidebar(
    sidebarMenu(
      menuItem("read Me",tabName = "intro",icon = icon("info-sign", lib = "glyphicon")),
      menuItem(" Load data",tabName = "load_data",icon = icon("cloud-upload", lib = "glyphicon")),
      menuItem(" Description of Comparison", tabName = "comp_desc", icon = icon("duplicate", lib = "glyphicon")),
      menuItem(" Differences details", tabName = "comp_details", icon = icon("book", lib = "glyphicon"))
    )
  )
}
