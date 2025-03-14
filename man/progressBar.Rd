% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ShinyUIFunctions.R
\name{progressBar}
\alias{progressBar}
\title{Progress Bar}
\usage{
progressBar(total, text = "")
}
\arguments{
\item{total}{Total count of the progress bar}

\item{text}{Text to display as the progress bar updates}
}
\value{
Progress bar
}
\description{
Progress Bar
}
\examples{
pb <- progressBar(100,"Function executing")
for(i in 1:100) pb$tick()
}
