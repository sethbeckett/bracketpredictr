utils::globalVariables(c("cbb", "TEAM", "YEAR"))

#' Get Team Names
#'
#' @return the names of all possible teams to use in analysis
#' @export
#'
#' @examples
#' get_team_names()
get_team_names <- function() {
 sort(unique(cbb$TEAM))
}
