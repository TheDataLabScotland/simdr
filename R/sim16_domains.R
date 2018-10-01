#' Domain ranks from published SIMD 2016
#'
#' We include the domain ranks from the 2016 SIMD for purposes of evaluating the correspondence between the SAS and R methodologies.
#' To see our quality control analysis see [quality assurance section of the openSIMD documentation](https://thedatalabscotland.github.io/openSIMD_site/QA.html)
#'
#' Please see the technical notes \url{http://www.gov.scot/Resource/0050/00504822.pdf} for full information on all of the data in SIMD.
#'
#' @format A data frame with 6976 rows and 13 variables:
#' \describe{
#'   \item{Data_Zone}{}
#'   \item{Intermediate_Zone}{}
#'   \item{Council_area}{}
#'   \item{Total_population}{}
#'   \item{Working_age_population_revised}{}
#'   \item{Overall_SIMD16_rank}{}
#'   \item{Income_domain_2016_rank}{}
#'   \item{Employment_domain_2016_rank}{}
#'   \item{Health_domain_2016_rank}{}
#'   \item{Education_domain_2016_rank}{}
#'   \item{Housing_domain_2016_rank}{}
#'   \item{Access_domain_2016_rank}{}
#'   \item{Crime_domain_2016_rank}{}
#'   ...
#' }
#' @source \url{http://www.gov.scot/Topics/Statistics/SIMD}
"simd16_domains"
