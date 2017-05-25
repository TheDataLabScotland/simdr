#' replaceMissing
#'
#' This function performs factor analysis and returns the proportional scores or
#' weights for each variable on the first factor. This becomes the weight for
#' combining the normalised indicator scores.
#' The function takes a data frame, assumes that all variables are being processed
#' in factor analysis and returns a list where each element is a numeric value,
#' the weight corresponding to that column in the data. Factor analysis is performed
#' by \code{\link[psych]{fa}}
#'
#' @param dat a data frame containing the normalised indicator variables that need
#'            to be weighted, and nothing else.
#' @param ... Other arguments to be passed to \code{\link[psych]{fa}}
#'
#' @keywords SIMD, openSIMD, simdr
#'
#' @export
getFAWeights <- function(dat, ...) {

  fact <- psych::fa(dat, nfactors = 1, fm = "ml", rotate = "none", ...)

  f1_scores <- as.data.frame(fact$weights) %>% select(ML1)

  f1_weights <- f1_scores / sum(f1_scores)

  # This is just to make each weight an individual element of a list
  # For compatibility with purrr::map2() in the next step, combineWeightsAndNorms()
  return(lapply(seq_along(f1_weights$ML1), function(i) f1_weights$ML1[i]))

}
