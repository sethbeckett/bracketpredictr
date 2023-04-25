#' Validate inputs
#'
#' @param teams The college basketball team you want to find the stats of
#' @param stats Different statistics provided about the basketball team entered
#' @param years The year that corrisponds with the season you want to know the
#' stats of for the specific team
#'
#' @return If the validate function is called and its not valid it will return
#' a stop message
#' @export
#'
validate_inputs <- function(teams, stats, years) {
  if (!all(teams %in% cbb$TEAM)){
   stop("The team you entered is not in the data, call 'get_team_names()' to
        find the team you are looking for")
  }
  #stats
  if (!all(stats %in% names(cbb))){
    stop("This is a not a stat we have for basketball")
  }
  #years
  if (!is.integer(years)){
    stop("enter in valid year")
  }
  if (2013 <= years && years <= 2019) {
      return(TRUE)
  }
}
