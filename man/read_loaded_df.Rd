% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_load_data_fct_display.R
\name{read_loaded_df}
\alias{read_loaded_df}
\title{read data loaded from an input file}
\usage{
read_loaded_df(input_file_data, file_sep = ";")
}
\arguments{
\item{input_file_data}{the link of the data to load}

\item{file_sep}{the separator used to read the csv data. Possible values are :
semi column";", comma"," or column":"}
}
\value{
a dataframe read from user input or a validation message
}
\description{
read data loaded from an input file
}
