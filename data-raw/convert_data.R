library(purrr)

data_files <- list.files("data-raw", ".xl", full.names = TRUE)
data_names <- c("no_qualifications", "sas_simd_domains", "sas_weights", "simd16_indicators", "simd16_domains")
sheets <- c(1, 1, 1, 3, 2)

excelToRds <- function(file, sheet) { readxl::read_excel(file, sheet = sheet) }
data_tables <- map2(data_files, sheets, excelToRds)
names(data_tables) <- data_names

no_qualifications <- data_tables[[1]]
sas_simd_domains <- data_tables[[2]]
sas_weights <- data_tables[[3]]
simd16_indicators <- data_tables[[4]]
simd16_domains <- data_tables[[5]]

for(i in seq_along(data_files)) {
  save(list = c(data_names[i]), file = paste0("data/", data_names[i], ".RData"))
}

