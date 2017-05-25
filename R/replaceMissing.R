#' replaceMissing
#'
#' Replace missing values in normalised indicators.
#' This is a simple wrapper around replace and should be called after \code{normalScores}.
#' Note that \code{normalScores} will show a warning when NA values are present in the data.
#' This function is designed to assign the missing values to the centre of the normalised distribution (0).
#'
#' @param v a numeric vector as the input variable
#'
#' @keywords SIMD, openSIMD, simdr
#'
#' @examples
#' replaceMissing(c(1, 2, 3, NA))
#'
#' @export
replaceMissing <- function(v) replace(v, is.na(v) | v == Inf | v == -Inf, 0)

