#' Five Number Summary
#'
#' @param vals A numeric vector
#'
#' @return A list of the five number summary, outliers, and warnings
#'
#' @examples
#' fns(c(1,2,3,4,5))
#' @export
fns <- function(vals){
  x <- TRUE
  fns <- data.frame(
    Min = NA,
    Q1 = NA,
    Mean = NA,
    Med = NA,
    Q3 = NA,
    Max = NA
  )
  outliers <- c()
  vals <- as.numeric(vals)

  while(x)
  {
    vals <- sort(vals)
    fns$Min <- min(vals,na.rm=TRUE)
    fns$Max <- max(vals,na.rm=TRUE)
    fns$Med <- median(vals,na.rm=TRUE)
    fns$Mean <- mean(vals,na.rm=TRUE)

    if(length(vals)%%2==0)
    {
      fns$Q1 <- median(vals[1:(length(vals)/2)],na.rm=TRUE)
      fns$Q3 <- median(vals[((length(vals)/2)+1):length(vals)],na.rm=TRUE)
    }else
    {
      fns$Q1 <- median(vals[1:floor(length(vals)/2)],na.rm=TRUE)
      fns$Q3 <- median(vals[((ceiling(length(vals)/2))+1):length(vals)],na.rm=TRUE)
    }

    high <- fns$Q3 + 1.5*(fns$Q3-fns$Q1)
    low <- fns$Q1 - 1.5*(fns$Q3-fns$Q1)

    if((any(vals > high) | any(vals < low)) & (high != low))
    {
      outliers <- c(outliers,vals[vals >= high],vals[vals <= low])
      vals <- vals[vals < high]
      vals <- vals[vals > low]
    }else if(high == low)
    {
      warning <- "Outlier limits converged. Summary may be unreliable."
      x <- FALSE
    }else
    {
      warning <- "No warnings available."
      x <- FALSE
    }
  }

  output <- list(
    fns = fns,
    outliers = sort(outliers),
    warning = warning
  )

  return(output)
}

#' Test Function
#'
#' @param a A number
#'
#' @return Twice the inputted number
#'
#' @examples
#' testFunction(4)
#' @export
testFunction <- function(a){
  return(a*2)
}
