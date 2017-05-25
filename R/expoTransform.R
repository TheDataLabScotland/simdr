#' combineWeightsAndNorms
#'
#' This function recapitulates the exponential transformation used in SIMD to
#' transform the weighted domain ranks before combining domains.
#' The function takes an numeric vector (of the ranks) and returns a numeric vector
#' of equal length containing the transformed values.
#'
#' @param ranks a numeric or integer vector of domain ranks.
#'
#' @keywords SIMD, openSIMD, simdr
#'
#' @export
expoTransform <- function(ranks) {

  prop_ranks <- ranks / max(ranks)

  expo <- -23 * log(1 - prop_ranks * (1 - exp( -100 / 23)))

  return(expo)
}
