## 1.1 Add dependencies

pkgs <- c(
  'devtools',
  'pins',
  "dplyr",
  "lubridate",
  "golem",
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
  "config",
  "utils",
  "htmltools"
)

for (i in pkgs) {
  usethis::use_package(i)
}

## 1.2 add app.R file for publishing (be sure to enter 1 in the console prompt)

golem::add_rstudioconnect_file(open = FALSE)

## 1.3 add manifest for CI/CD

rsconnect::writeManifest()

## 1.4 go to run_dev.R and ensure the empty dashboard loads

rstudioapi::navigateToFile("dev/run_dev.R")

## 1.5 Add modules in console

# graveler::level_up(name = "my_first_module") # Name of the module
graveler::level_up(name = "intro")
graveler::level_up(name = "load_data")
graveler::level_up(name = "comp_desc")
graveler::level_up(name = "comp_details")
graveler::level_up(name = "comp_report")

## 1.6 fill the description file

golem::fill_desc(
  pkg_name = "dataCompare",
  pkg_title = "A 'shiny' App to Compare Two Data Frames",
  pkg_description = "A tool developed with the 'Golem' framework which provides 
                     an easier way to check cells differences between two data 
                     frames. The user provides two data frames for comparison, 
                     selects IDs variables identifying each row of input data, 
                     then clicks a button to perform the comparison. Several 
                     'R' package functions are used to describe the data 
                     and perform the comparison in the server of the 
                     application. The main ones are comparedf() from 'arsenal' 
                     and skim() from 'skimr'. For more details see the 
                     description of comparedf() from the 'arsenal' package and 
                     that of skim() from the 'skimr' package.",
  pkg_version = '1.0.1',
  authors = person(given = 'Sergio', 
                   family = 'Ewane Ebouele',
                   email = 'info@dataforknow.com',
                   role = c("aut", "cre") ),
  repo_url = "https://github.com/seewe/dataCompare",
  )

## 1.7 fill the licence
usethis::use_mit_license()

## 1.8 import specifics functions
# 
# usethis::use_import_from("rlang", "::")
# usethis::use_import_from("rlang", ":::")

## 1.9 import some function from others library
usethis::use_pipe()

## 1.10 remove non standard packages
usethis::use_pkgdown()

## 1.11 add global variable

usethis::use_import_from("shinydashboard",
                         c("tabItems", "tabItem", "dashboardBody", "box", "renderValueBox", "valueBox", "valueBoxOutput",
                           "sidebarMenu", "menuItem"))
usethis::use_import_from("shinydashboardPlus",
                         c("dashboardPage", "dashboardFooter", "dashboardHeader", "dashboardSidebar"))
usethis::use_import_from("shinycssloaders", c("withSpinner", "showPageSpinner", "hidePageSpinner"))
usethis::use_import_from("dplyr", c("between", "select", "filter", "case_when", "ungroup", "inner_join", "ends_with"))
usethis::use_import_from("DT", c("datatable", "JS"))
usethis::use_import_from("utils", c("read.csv2", "read.table"))
usethis::use_import_from("skimr", c("skim"))
usethis::use_import_from("data.table", c("month"))
usethis::use_import_from("devtools", c("document"))
usethis::use_import_from("shinyWidgets", c("actionBttn", "radioGroupButtons"))

usethis::use_import_from("shiny", c("callModule", "reactiveValues", "observeEvent", "req", "reactive", "span", "validate", 
                                    "NS", "column", "fluidRow", "renderUI", "icon", "fileInput", "uiOutput", "actionButton", "shinyApp"))
usethis::use_import_from("htmltools", c("tagList", "tags", "a", "img", "br", "p", "strong"))
usethis::use_import_from("explore", c("describe"))
usethis::use_import_from("golem", c("add_resource_path"))

utils::globalVariables(".")

## 1.12 add vignette

usethis::use_vignette("dataCompare")
build_vignettes()

## 1.13 test 
usethis::use_testthat(3)




