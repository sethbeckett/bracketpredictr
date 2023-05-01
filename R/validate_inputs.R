utils::globalVariables(c("cbb"))

#' Validate inputs
#'
#' Validates inputs to make sure other functions are using correct arguments.
#'
#' @param teams The college basketball team you want to find the stats of
#' @param stats Different statistics provided about the basketball team entered
#' @param years The year that corresponds with the season you want to know the
#' stats of for the specific team
#'
#' @return If the validate function is called and its not valid it will return
#' a stop message
#'
validate_inputs <- function(teams, stats, years) {
  if (!all(teams %in% cbb$TEAM)) {
   stop("The team you entered is not in the data, call 'get_team_names()' to
        find the team you are looking for")
  }
  #stats
  if (!all(stats %in% names(cbb))) {
    stop("This is a not a stat we have for basketball, try calling
         'get_stats_names' to find the stat you're looking for")
  }
  #years
  if (!is.numeric(years) || !all(2013 <= years & years <= 2019)) {
    stop("enter in year as a number or numeric vector of years between '13-'19")
  }
}
