% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_load_data_fct_display.R
\name{data_table_formatter}
\alias{data_table_formatter}
\title{Datatable formatter, to print on the screen}
\usage{
data_table_formatter(df, n_page = 5)
}
\arguments{
\item{df}{dataframe to format}

\item{n_page}{number of rows to display per page}
}
\value{
An object of class "htmlwidget" containing a formated data.frame to print on app UI
}
\description{
Datatable formatter, to print on the screen
}
\examples{
data_table_formatter(iris, 10)
}
