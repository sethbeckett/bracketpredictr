#' Get the primary and secondary color for a team from the NCAA Colors data
#'
#' @param team_name The name of the team to look up in the NCAA Colors data
#' @return A vector containing the primary and secondary colors for the team
#' @references
#' The NCAA colors dataset used in this function was originally created by Luke
#' Benz for the ncaahoopsR package (https://github.com/lbenz730/ncaahoopsR).
#'
#' @import dplyr
#' @import ncaahoopsR
#' @examples
#' get_team_color("Utah St.")
get_team_color <- function(team_name) {
  color_row <- ncaa_colors %>%
    filter(ncaa_name == team_name)
  primary_color <- color_row$primary_color
  secondary_color <- color_row$secondary_color
  return(c(primary_color, secondary_color))
}

#' Plot the desired statistics for two college basketball teams over time
#'
#' @param team1 The name of the first team
#' @param team2 The name of the second team
#' @param stat A vector of the statistics to plot for the teams
#' (e.g., c("W", "EFG_O", "EFG_D"))
#' @return A ggplot object showing the statistics over time for the two teams
#' @references
#' The NCAA colors dataset used in this function was originally created by Luke
#' Benz for the ncaahoopsR package (https://github.com/lbenz730/ncaahoopsR).
#'
#' @importFrom scales scale_x_continuous
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import ncaahoopsR
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

  team_stat_long <- gather(team_stat,
    key = "stat", value = "value", -c(TEAM, YEAR))
  print(team_stat_long)
  # Get the color of each team for plotting
  primary_1 <- get_team_color(team1)[1]
  primary_2 <- get_team_color(team2)[1]
  secondary_1 <- get_team_color(team1)[2]
  secondary_2 <- get_team_color(team2)[2]

  if (primary_1 != primary_2) {
    team_colors <- c(primary_1, primary_2)
  } else if (secondary_1 != secondary_2) {
    team_colors <- c(secondary_1, secondary_2)
  } else {
    team_colors <- c(primary_1, secondary_2)
  }

  print(team_colors)
  # Plot the team statistics over time
  ggplot(team_stat_long,
         aes(x = YEAR, y = value, color = as.factor(TEAM), linetype = stat)) +
    geom_line() +
    labs(x = "Year", y = "Statistic Value",
         color = "Team", linetype = "Statistic") +
    scale_color_manual(values = team_colors) +
    scale_linetype_manual(values = c(
      "solid", "dashed", "dotted",
      "dotdash", "longdash", "twodash"
    )) +
    theme_classic() +
    scale_x_continuous(breaks = seq(
      min(team_stat_long$YEAR),
      max(team_stat_long$YEAR), 1
    ))
}
