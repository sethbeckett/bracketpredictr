#' predict_winner
#'
#' @param team1 The first team playing in the game to be predicted
#' @param team2 The second team playing in the game to be predicted
#' @param stats The specific statistics the user would like to be compared
#' between the two teams. Defaults to all available statistics.
#' @param year The year of stats the user desires to be compared, defaults to
#' 2019 which is the most recent year.
#' @param show_stats If true will return the table with the stats for the user
#' to view
#'
#' @return a print statement with a predicted winner, and stats if requested
#' @export
#'
#' @examples
#' predict_winner("Utah St.", "Utah Valley")
#' predict_winner("Utah St.", "Utah", c("G", "W", "ADJOE", "ADJDE",
#' "3P_O", "3P_D", "ORB"))
predict_winner <- function(team1, team2, stats = names(cbb), year = "2019",
                           show_stats = FALSE) {

  #Get team stats
  team_1_stats <- get_teams_stats(team1, stats, year = "2019")
  team_2_stats <- get_teams_stats(team2, stats, year = "2019")

  #Remove stats that will not help the prediction
  stats_to_ignore <- c("TEAM", "CONF", "G", "POSTSEASON", "SEED","YEAR")
  stats_df <- rbind(team_1_stats, team_2_stats)
  compare_df <- stats_df %>%
    select(-any_of(stats_to_ignore))

  # Keep track of how many "points" each team receives from comparing stats
  team_1_points <- 0
  team_2_points <- 0

  for (stat in colnames(compare_df)) {

    # Check if either value is missing
    if (is.na(compare_df[1, stat]) || is.na(compare_df[2, stat])) {
      next # skip the comparison for this column
    }

    # Compare the values for the current column between the two teams
    if (compare_df[1, stat] > compare_df[2, stat]) {
      # Team 1 has a higher value, so give them a point
      team_1_points <- team_1_points + 1
    } else if (compare_df[2, stat] > compare_df[1, stat]) {
      # Team 2 has a higher value, so give them a point
      team_2_points <- team_2_points + 1
    }
  }

  # Determine the winning team based on the points
  if (team_1_points > team_2_points) {
    winner <- team1
  } else if (team_2_points > team_1_points) {
    winner <- team2
  } else {
    winner <- "Tie"
  }

  # Optionally show the stats for each team
  if (show_stats) {
    print(stats_df)
  }
  print(compare_df)
  # Return the winning team
  print(paste("After comparing the stats we believe that ", winner,
              " has a higher chance of winning the game."))

}
