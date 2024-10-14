#' Skim a dataset and return only numeric variables characteristics
#' @param the_data Data on which the skim function will apply the description on numeric variables
#' @returns a data.frame object containing description of all numeric (doucle or integer) variable in the input data.
#' @examples
#' skim_num(iris)
#' skim_num(mtcars)
#' 
#' @export

skim_num <- function(the_data){
  out <- skimr::skim(the_data) %>% 
    as.data.frame() %>% 
    filter(!is.na(`numeric.mean`))
  
  if(nrow(out)>0){
    out <- out %>% 
      select(Variable = skim_variable, Type = skim_type, complete_rate, Distribution = numeric.hist)
  }else{
    out <- data.frame()
  }
    
  return(out)
}

#' Skim a dataset and return only characters variables characteristics
#' @param the_data Data on which the skim function will apply the description on character variables
#' @returns a data.frame object containing description of all character (factor, character or date) variable in the input data.
#' @examples
#' skim_char(iris)
#' skim_char(mtcars)
#' 
#' @export

skim_char <- function(the_data){
  out <- skimr::skim(the_data) %>% 
    as.data.frame() %>% 
    filter(is.na(`numeric.mean`))
  
  if(nrow(out)>0){
    out <- out %>% 
      select(Variable = skim_variable, Type = skim_type, complete_rate, ends_with(".n_unique"))
  }else{
    out <- data.frame()
  }
  return(out)
}


#' Detect common variables in two dataset
#' @param df1 the first dataset to use
#' @param df2 The second dataset to use
#' @returns a Character vector containing all variables names in both df1 and df2
#' @examples 
#' same_variables(iris, iris)
#' same_variables(mtcars, mtcars)
#' @export

same_variables <- function(df1, df2){
  
  num_var_df1 <- skim_num(df1)
  num_var_df2 <- skim_num(df2)
  char_var_df1 <- skim_char(df1)
  char_var_df2 <- skim_char(df2)
  
  if(ncol(num_var_df1)>0 & ncol(num_var_df2)>0){
    # All same numeric variables
    num_var_df1 <- skim_num(df1) %>% select(Variable, Type) %>% ungroup()
    num_var_df2 <- skim_num(df2) %>% select(Variable, Type) %>% ungroup()
    all_num <- num_var_df1 %>% 
      inner_join(num_var_df2, by = c("Variable", "Type")) %>% 
      select(Variable)
  }else{
    all_num <- data.frame()
  }
  
  if(ncol(char_var_df1)>0 & ncol(char_var_df2)>0){
    # All same character variables
    char_var_df1 <- skim_char(df1) %>% select(Variable, Type)
    char_var_df2 <- skim_char(df2) %>% select(Variable, Type)
    all_char <- char_var_df1 %>% 
      inner_join(char_var_df2, by = c("Variable", "Type")) %>% 
      select(Variable)
  }else{
    all_char <- data.frame()
  }
  
  if(ncol(all_num)>0 | ncol(all_char)>0){
    all_variables <- all_num %>% rbind.data.frame(all_char)
    out <- all_variables$Variable
  }else{
    out <- c("")
  }
  return(out)
}


#' read data loaded from an input file
#' @param input_file_data the link of the data to load
#' @param file_sep the separator used to read the csv data. Possible values are :
#'                 semi column";", comma"," or column":"
#' @return An object of 'data.frame' class read from user input or a validation message

read_loaded_df <- function(input_file_data, file_sep = ";"){
  ext <- tools::file_ext(input_file_data$name)
  switch(ext,
         rds = readRDS(input_file_data$datapath),
         csv = read.csv2(input_file_data$datapath, sep = file_sep),
         tsv = read.table(input_file_data$datapath, sep = "\t", header = TRUE),
         validate("Invalid file; Please upload a .rds, .csv or .tsv file")
         )
}


#' Datatable formatter, to print on the screen
#' @param df dataframe to format
#' @param n_page number of rows to display per page
#' @return An object of class "htmlwidget" containing a formated data.frame to print on app UI
#' @examples 
#' data_table_formatter(iris, 10)
#' @export

data_table_formatter <- function(df, n_page = 5){
  out <- df %>% 
    datatable(., 
              rownames = FALSE, 
              extensions = list('Responsive', 'Buttons'), 
              options = list(
                dom = 'ftp',
                pageLength = n_page,
                initComplete = JS(
                  "function(settings, json) {",
                  "$(this.api().table().header()).css({'background-color': '#649191', 'color': '#000'});",
                  "}"))
    )
  
  return(out)
}


#' Function which perform the comparison of dataframe
#' @param df1 The first dataframe of the comparison
#' @param df2 The second dataframe of the comparison
#' @param id_var Tve vector of id variable to identify the observations in df1 and df2
#' @return An object of class "comparedf" as made by the 'comparedf' S3 method is returned.
#' @examples 
#' library(dplyr)
#' compare_data_frame_object(
#'      iris %>% dplyr::mutate(ID = row_number()), 
#'      iris %>% dplyr::mutate(ID = row_number()), 
#'      'ID')
#' @export

compare_data_frame_object <- function(df1, df2, id_var){
  
  if( length(id_var) > 0 ){
    out <- arsenal::comparedf(df1, df2, by = id_var) %>%
      summary()
    
    dfrt <- out$comparison.summary.table %>% 
      dplyr::filter(statistic == "Number of values unequal") %>% 
      select(value) %>% as.numeric()
    var_cmp <- out$comparison.summary.table %>% 
      filter(statistic == "Number of variables compared") %>% 
      select(value) %>% as.numeric()
    obs_cmp <- out$comparison.summary.table %>% 
      filter(statistic == "Number of observations in common") %>% 
      select(value) %>% as.numeric()
    
    out$diff_percentage <- round( dfrt*100/(var_cmp*obs_cmp), 0)
    
  }else{
    out <- list()
    out$diff_percentage <- NA_integer_
  }
  
  return(out)
}



