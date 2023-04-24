get_stats_names <- function() {
  print(names(cbb)[-c(1,24)])
  print(cat("For more information on specific statistics,
        see the cbb documentation by running '?cbb'."))
}
