
# Test on skim_num function

test_that("skim_num on iris data: is a dataframe", {
  ooo <- skim_num(iris)
  expect_true(is.data.frame(ooo))
})

test_that("skim_num on iris data: check dimension", {
  ooo <- skim_num(iris)
  expect_true(ncol(ooo) == 4)
  expect_true(nrow(ooo) == 4)
})

test_that("skim_num on iris data: variables names", {
  ooo <- skim_num(iris)
  expect_equal(ooo$Variable, c("Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width"))
})

test_that("skim_num on iris data: check variables type", {
  ooo <- skim_num(iris)
  expect_true(unique(ooo$Type) %in% c("numeric", "double", "integer"))
})

# Test on skim_char function

test_that("skim_char on iris data: is a dataframe", {
  ooo <- skim_char(iris)
  expect_true(is.data.frame(ooo))
})

test_that("skim_char on iris data: check dimension", {
  ooo <- skim_char(iris)
  expect_true(ncol(ooo) == 4)
  expect_true(nrow(ooo) == 1)
})

test_that("skim_char on iris data: variables names", {
  ooo <- skim_char(iris)
  expect_equal(ooo$Variable, c("Species"))
})

test_that("skim_char on iris data: check variables type", {
  ooo <- skim_char(iris)
  expect_true(unique(ooo$Type) %in% c("factor", "character"))
})


# Check of same_variables

test_that("List of same variables between iris and mtcars", {
  ooo <- same_variables(iris, mtcars)
  expect_true(length(ooo) == 0)
})


test_that("List of same variables between df1 and df1", {
  df1 <- iris[,1:4]
  df2 <- iris[,3:5]
  ooo <- same_variables(df1, df2)
  expect_true(sum(ooo == c("Petal.Length", "Petal.Width" )) == 2)
})


# Check the compare dataframe function

test_that("The comparison function works well", {
  df1 <- iris[,1:4] %>% dplyr::mutate(ID = dplyr::row_number())
  df2 <- iris[,3:5] %>% dplyr::mutate(ID = dplyr::row_number())
  dfComp <- compare_data_frame_object(df1, df2, "ID")
  
  Number_of_observations_in_common <- dfComp$comparison.summary.table %>% 
    dplyr::filter(statistic=="Number of observations in common") %>% 
    dplyr::select(value) %>% 
    as.numeric()
  
  Number_of_observations_with_all_compared_variables_equal <- dfComp$comparison.summary.table %>% 
    dplyr::filter(statistic=="Number of observations with all compared variables equal") %>% 
    dplyr::select(value) %>% 
    as.numeric()
  
  Number_of_variables_compared_with_all_values_equal <- dfComp$comparison.summary.table %>% 
    dplyr::filter(statistic=="Number of variables compared with all values equal") %>% 
    dplyr::select(value) %>% 
    as.numeric()
  
  Number_of_variables_compared <- dfComp$comparison.summary.table %>% 
    dplyr::filter(statistic=="Number of variables compared") %>% 
    dplyr::select(value) %>% 
    as.numeric()
  
  expect_true(Number_of_observations_in_common == 150)
  expect_true(Number_of_observations_with_all_compared_variables_equal == 150)
  expect_true(Number_of_variables_compared_with_all_values_equal == 2)
  expect_true(Number_of_variables_compared == 2)
})
