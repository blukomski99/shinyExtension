library(devtools)
library(roxygen2)
library(usethis)
library(testthat)

#Packages
packageAvailable <- function(name){
  pkgs <- available.packages(filters = c("CRAN","duplicates"))[,"Package"]
  if(name %in% pkgs) return(FALSE) else
    return(TRUE)
}
loadPackage <- function(){
  devtools::load_all()
}
documentPackage <- function(){
  devtools::document()
}
checkPackage <- function(){
  devtools::check()
}
packageWorkflow <- function(){
  loadPackage()
  documentPackage()
  checkPackage()
}













