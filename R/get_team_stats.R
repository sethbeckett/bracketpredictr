utils::globalVariables(c("cbb", "TEAM", "YEAR"))

#' The Function to Get Team Stats
#'
#' Returns a dataframe containing one or two teams stats. Which stats are
#' returned is specified by stats, and which year(s) they are returned for is
#' specified by the years parameter.
#'
#' @param teams team or vector of two teams to get stats on
#' @param stats the specific statistics to be returned, default is all stats
#' @param years the year/years to return data for the teams
#'
#' @return a dataframe containing the stats for the team or teams, within the
#' year range specified
#' @export
#'
#' @examples
#' get_team_stats("UCLA")
#' get_team_stats(c("Utah St.", "UNLV"),
#'   stats=c("CONF", "G", "W", "ADJOE"), years = 2017)
get_team_stats <- function(teams, stats = names(cbb), years = seq(2013, 2019)) {

  # error check
  validate_inputs(teams, stats, years)

  # shows the team and year even if they aren't specified by the user in stats
  if (length(stats) != length(names(cbb))) {
    stats <- c("TEAM", stats, "YEAR")
  }

  # filter the dataset and return the specified teams, stats, and year
  dplyr::filter(cbb, TEAM %in% teams & YEAR %in% years) |>
    dplyr::select(stats) |>
    dplyr::arrange(YEAR)
}
