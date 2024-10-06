
pkgs <- c(
  "devtools",
  "dplyr",
  "lubridate",
  "golem",
  "pins",
  "shiny",
  "shinyjs",
  "shinyWidgets",
  "shinydashboard",
  "shinydashboardPlus",
  "skimr",
  "vroom",
  "DT",
  "data.table",
  "arsenal",
  "utils",
  "htmltools"
)

for (i in pkgs) {
  library(i, character.only = TRUE)
}
