
pkgs <- c(
  "dashboardthemes",
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
  "arsenal"
)

for (i in pkgs) {
  library(i, character.only = TRUE)
}
