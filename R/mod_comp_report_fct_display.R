#' run the rmarkdown report of the data comparison and save it in an external directory
#' @param df1 The first dataframe of the comparison
#' @param df2 The second dataframe of the comparison
#' @param ids The character vector containing id variables which identify the observations in dataframe `df1` and datafram `df2`
#' @param report_title A character string which contains the title of the report
#' @param report_author A character string which contains the name of the report author
#' @param report_context A character string containing the context of the report
#' @returns null.
#' @examples
#' library(dplyr)
#' compare_data_frame_object_report(
#'      df1 = iris %>% dplyr::mutate(ID = row_number()), 
#'      df2 = iris %>% dplyr::mutate(ID = row_number()), 
#'      ids = 'ID',
#'      report_title = "Iris data Comparator report",
#'      report_author = "Sergio Ewane",
#'      report_context = "i'm checking if the two dataframe contains the same values"
#'      )
#' 
#' @export

compare_data_frame_object_report <- function(df1, 
                                             df2, 
                                             ids, 
                                             report_title = "Comparator report",
                                             report_author = "Author name here",
                                             report_context = "Add a small text here to explain the context."
){
  report_template <- template_content
  template_temp_report <- tempfile(fileext = ".Rmd")
  writeLines(report_template, template_temp_report)
  
  output_temp_file <- tempfile(fileext = ".html")
  
  params <- list(df1_input = df1,
                 df2_input = df2,
                 id_input = ids,
                 title_input = report_title,
                 author_input = report_author,
                 context_input = report_context)
  rmarkdown::render(input = template_temp_report, 
                    output_file = output_temp_file, 
                    params = params,
                    quiet = FALSE,
                    envir = new.env(parent = globalenv()))
  
  # clean the temporary file
  unlink(c(template_temp_report))
  return(output_temp_file)
}
