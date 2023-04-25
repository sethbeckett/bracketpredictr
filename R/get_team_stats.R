get_teams_stats <- function(teams, stats=names(cbb), years=seq(2013, 2019)) {

  # error check
  validate_inputs(teams, stats, years)

  if (length(stats) != length(names(cbb))) {
    stats <- c("TEAM", stats, "YEAR")
  }
    filter(cbb, TEAM %in% teams & YEAR %in% years) |>
      select(stats) |>
      arrange(YEAR)
}
