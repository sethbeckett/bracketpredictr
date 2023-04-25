utils::globalVariables(c("cbb", "TEAM", "YEAR"))

#' Get Names of Statistics
#'
#' @return a list of all the possible statistics in the dataset
#' @export
#'
#' @examples
#' get_stats_names()
get_stats_names <- function() {
  print(names(cbb)[-c(1, 24)])
  print(cat("For more information on specific statistics,
        see the cbb documentation by running '?cbb'."))
}
