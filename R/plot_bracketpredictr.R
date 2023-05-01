#' @importFrom dplyr filter
utils::globalVariables(c("ncaa_name", "TEAM", "YEAR", "value", "color"))

#' Get the primary and secondary color for a team from the NCAA Colors data
#'
#' This function retrieves the primary and secondary colors for a specified team
#' from the NCAA Colors data.
#'
#' @param team_name The name of the team to look up in the NCAA Colors data
#' @return A vector containing the primary and secondary colors for the team
#' @references
#' The NCAA colors dataset used in this function was originally created by Luke
#' Benz for the ncaahoopsR package (https://github.com/lbenz730/ncaahoopR).
#'
#' @import dplyr
#' @export
#' @examples
#' get_team_color("Utah St.")
get_team_color <- function(team_name) {
  color_row <- dplyr::filter(ncaa_colors, ncaa_name == team_name)
  primary_color <- color_row$primary_color
  secondary_color <- color_row$secondary_color
  return(c(primary_color, secondary_color))
}

#' Plot the desired statistics for two college basketball teams over time
#'
#' This function creates a ggplot object to visualize the specified statistics
#' for two college basketball teams over time.
#'
#' @param team1 The name of the first team
#' @param team2 The name of the second team
#' @param stat A vector of the statistics to plot for the teams
#' (e.g., c("W", "EFG_O", "EFG_D"))
#' @return A ggplot object showing the statistics over time for the two teams
#' @references
#' The NCAA colors dataset used in this function was originally created by Luke
#' Benz for the ncaahoopsR package (https://github.com/lbenz730/ncaahoopR).
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @export
#' @examples
#' plot_stats("Utah", "Utah St.", c("W", "EFG_O", "EFG_D"))
plot_stats <- function(team1, team2, stat) {
  # Get the desired stats
  team_1_stat <- get_team_stats(team1, stats = stat)
  team_2_stat <- get_team_stats(team2, stats = stat)

  # Combine the two data frames
  team_stat <- rbind(team_1_stat, team_2_stat)

  # Reshape the data into long format
  team_stat_long <- tidyr::gather(team_stat,
                                  key = "stat", value = "value", -c(TEAM, YEAR))

  # Get the color of each team for plotting
  primary_1 <- get_team_color(team1)[1]
  primary_2 <- get_team_color(team2)[1]

  # Add a new column to the data frame for the colors
  team_stat_long$color <- ifelse(team_stat_long$TEAM == team1, primary_1, primary_2)

  # Create a data frame for team names and their corresponding colors
  team_color_df <- data.frame(
    team = c(team1, team2),
    color = c(primary_1, primary_2)
  )

  # Plot the team statistics over time
  ggplot2::ggplot(team_stat_long,
                  ggplot2::aes(x = YEAR, y = value, color = color, linetype = stat, group = interaction(TEAM, stat))) +
    ggplot2::geom_line() +
    ggplot2::labs(x = "Year", y = "Statistic Value",
                  color = "Team", linetype = "Statistic") +
    ggplot2::scale_color_identity(guide = "legend",
                                  breaks = team_color_df$color,
                                  labels = team_color_df$team) +
    ggplot2::scale_linetype_manual(values = c(
      "solid", "dashed", "dotted",
      "dotdash", "longdash", "twodash"
    )) +
    ggplot2::theme_classic() +
    ggplot2::scale_x_continuous(breaks = seq(
      min(team_stat_long$YEAR),
      max(team_stat_long$YEAR), 1
    ))
}

