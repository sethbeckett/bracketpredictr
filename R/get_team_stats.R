stats <- names(cbb)

get_team_stats <- function(team, stats=names(cbb), year=seq(2013, 2019)) {
  if (length(stats) != length(names(cbb))) {
    stats <- c("TEAM", stats, "YEAR")
  }
    filter(cbb, TEAM == team & YEAR %in% year) |>
         select(stats)
}
