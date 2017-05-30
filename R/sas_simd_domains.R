#' Domain rankings for SIMD 16 derived from SAS proceedure
#'
#' The published ranks of the individual domains and the overall SIMD rank for 2016 calculated in SAS.
#' The highest ranked data zones are the most deprived geographic areas.
#' We include this data for the purposes of measuring the correspondence of ranks calculated in R with ranks calculated in SAS.
#'
#' Please see the technical notes \url{http://www.gov.scot/Resource/0050/00504822.pdf} for full information on all of the data in SIMD.
#'
#' @format A data frame with 6976 rows and 13 variables:
#' \describe{
#'   \item{DZ}{Data Zone}
#'   \item{IZ}{}
#'   \item{LA}{Local Authority}
#'   \item{pop}{Population}
#'   \item{wapop}{Working age Population}
#'   \item{incrnk}{Income Domain Rank}
#'   \item{emprnk}{Employment Domain Rank}
#'   \item{hearnk}{Health Domain Rank}
#'   \item{edurnk}{Education Domain Rank}
#'   \item{accrnk}{Access Domain Rank}
#'   \item{crirnk}{Crime Domain Rank}
#'   \item{hournk}{Housing Domain Rank}
#'   \item{SIMD}{Overall SIMD Rank}
#'   ...
#' }
#' @source \url{http://www.gov.scot/Topics/Statistics/SIMD}
"sas_simd_domains"
