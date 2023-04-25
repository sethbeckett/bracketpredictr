validate_inputs <- function(teams, stats, years) {
  if (!all(teams %in% cbb$TEAMS)){
   stop("The team you entered is not in the data, call 'get_team_names()' to find the team you are looking for")
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
