library(devtools)
library(roxygen2)
library(usethis)
library(testthat)

packageAvailable <- function(name){
  pkgs <- available.packages(filters = c("CRAN","duplicates"))[,"Package"]
  if(name %in% pkgs) return(FALSE) else
    return(TRUE)
}
loadPackage <- function(){
  devtools::load_all()
}
checkPackage <- function(){
  devtools::check()
}
packageWorkflow <- function(){
  loadPackage()
  checkPackage()
}













