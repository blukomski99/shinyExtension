#' Test Function
#'
#' @param a A number
#'
#' @return Twice the inputted number
#' @export
#'
#' @examples
#' testFunction(4)
testFunction <- function(a){
  return(a*2)
}

#' Progress Bar
#'
#' @param total Total count of the progress bar
#' @param text Text to display as the progress bar updates
#'
#' @return Progress bar
#' @export
#'
#' @importFrom progress progress_bar
#'
#' @examples
#' pb <- progressBar(100,"Function executing")
#' for(i in 1:100) pb$tick()
progressBar <- function(total,text=""){
  pb <- progress_bar$new(
    format=paste0(":bar ",text," :current/:total - :percent"),
    total=total)
  return(pb)
} #Generates progress bar - use in conjunction with pb$tick within loop
