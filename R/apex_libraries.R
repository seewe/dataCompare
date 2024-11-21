
pkgs <- c(
  "devtools",
  "dplyr",
  "golem",
  "shiny",
  "shinyWidgets",
  "shinydashboard",
  "shinydashboardPlus",
  "skimr",
  "DT",
  "data.table",
  "arsenal",
  "utils",
  "explore",
  "shinycssloaders",
  "htmltools"
)

for (i in pkgs) {
  library(i, character.only = TRUE)
}
