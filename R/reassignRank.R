#' reassignRank
#'
#' A function to make manual reassignments of ranks to individual data zones, can
#' be used when there are strange exceptions such as empty data zones. The function
#' needs a data.frame of ranks containing a column named 'data_zone'. The function
#' will take that data.frame change the rank of the indicator in question (with an
#' optional offset) and then re-rank.
#' The function returns the corrected data.frame.
#'
#' @param data data.frame containing the data zone called 'data_zone'
#'             and domain ranks.
#' @param domain a character value, the collumn name of the domain in which a rank
#'               should be reassigned.
#' @param data_zone a character value, the name of the data zone whose rank should
#'                  be changed.
#' @param end character value, one of either "max" or "min". To wich end should the
#'            data zone be moved? "max" to give this data zone the largest numerical
#'            value in rank and "min" to give it the lowest numerical value in rank
#'            default value is "max".
#' @param offset an positive integer value specifying the number of ranks by which to offset
#'               the reassignment, if for example you want a data zone to be the least
#'               but one deprived for a particular domain. Default value is 0.
#'
#' @keywords SIMD, openSIMD, simdr
#'
#' @export
reassignRank <- function(data, domain, data_zone, end = "max", offset = 0) {

  if(end == "max") {
    data[data$data_zone == data_zone, domain] <-
      max(data[, domain], na.rm = TRUE) - (offset - 0.1)
  }else
    if(end == "min") {
      data[data$data_zone == data_zone, domain] <-
        min(data[, domain], na.rm = TRUE) + (offset + 0.1)
    }

  data[, domain] <- rank(data[, domain])

  return(data)
}
