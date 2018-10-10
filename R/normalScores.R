#' normalScores
#'
#' Convert the raw indicators into normalised indicators using the inverse cumulative normal (probit) function.
#' The resulting variables should appear normally distributed.
#' In SIMD this function is used to transform indicators before combining them.
#' The function will take a numeric vector as input and return a numeric vector of equal length with the transformation applied.
#'
#' @param v a numeric vector as the input variable
#' @param ties how to deal with ties, passed to ties.method argument in \code{\link[base]{rank}}
#' @param forwards lowest numerical value on left of the distribution?
#'                 i.e. the lowest number in input data is also the lowest number in the output data
#'                 default is TRUE
#'
#' @keywords SIMD, openSIMD, simdr
#'
#' @details This function calculates the normal scores for each indicator. The normal score is defined as follows:
#'
#' \deqn{yi = inverse_probit ( ri / (n + 1) ) }
#'
#' where: inverse_probit is the inverse cumulative normal (probit) function,
#' ri is the rank of the i'th observation and n is the number of non-missing observations for the ranking variable.
#'
#' This is the inverse cumulative normal probability density of proportional ranks.
#' The resulting variable should appear normally distributed regardless of the input data.
#' We translated this approach using the \href{http://support.sas.com/documentation/cdl/en/proc/61895/HTML/default/viewer.htm#a000146840.htm}{SAS documentation}
#' as a guide.
#'
#' @examples
#' # (not run)
#' # PUT SOME CODE HERE
#'
#' @importFrom stats na.omit qnorm
#'
#' @export

normalScores <- function(
  v,
  ties = "average",
  forwards = TRUE
) {

  r <- rank(v, ties.method = ties)
  n <- length(na.omit(v))

  rn <- r / (n + 1)

  y <- qnorm(rn, mean = 0, sd = 1, lower.tail = forwards)

  return(y)

}
