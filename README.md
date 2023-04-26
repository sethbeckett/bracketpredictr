
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bracketpredictr

<!-- badges: start -->

[![R-CMD-check](https://github.com/sethbeckett/bracketpredictr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sethbeckett/bracketpredictr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Introduction

The `bracketpredictr` package provides a set of functions for analyzing
Division I college basketball stats, from 2013 to 2019. With this
package, you can easily retrieve team and game stats for a given season
(or multiple), predict winners of upcoming games, and more.
**[Here](https://github.com/sethbeckett/bracketpredictr)** is a link to
our gitHub repo.

## Installation

To install `bracketpredictr`, you can use the following commands, for
installing from github or locally:

``` r
library(devtools)
install_github("sethbeckett/bracketpredictr")
install.packages("bracketpredictr")
```

## Data - `cbb.csv` (College Basketball Dataset)

This is a combined dataset of Division I basketball teams, across 6
seasons, and 22 variable stats.

## Example usage

Here are some examples of how to use the functions provided by the
`bracketpredictr` package:

### Retrieving team stats

To retrieve the names of all available team stats, you can use the
`get_stats_names()` function:

``` r
library(bracketpredictr)
get_stats_names()
#>  [1] "CONF"       "G"          "W"          "ADJOE"      "ADJDE"     
#>  [6] "BARTHAG"    "EFG_O"      "EFG_D"      "TOR"        "TORD"      
#> [11] "ORB"        "DRB"        "FTR"        "FTRD"       "X2P_O"     
#> [16] "X2P_D"      "X3P_O"      "X3P_D"      "ADJ_T"      "WAB"       
#> [21] "POSTSEASON" "SEED"      
#> For more information on specific statistics,
#>         see the cbb documentation by running '?cbb'.NULL
```

This will output a list of all available teams, sorted alphabetically.

To retrieve team stats for one or more teams, you can use the
`get_team_stats()` function:

``` r
teams <- c("Duke", "North Carolina", "Kentucky")
stats <- c("TEAM", "W", "ADJOE", "ADJDE")
years <- seq(2013, 2019)

get_team_stats(teams, stats, years)
#>              TEAM  W ADJOE ADJDE YEAR
#> 1            Duke 30 118.4  91.5 2013
#> 2        Kentucky 21 109.7  96.7 2013
#> 3  North Carolina 24 111.6  93.0 2013
#> 4        Kentucky 29 117.2  96.2 2014
#> 5  North Carolina 24 113.4  94.7 2014
#> 6            Duke 26 125.9  98.6 2014
#> 7            Duke 35 125.2  90.6 2015
#> 8        Kentucky 38 120.3  84.0 2015
#> 9  North Carolina 26 119.6  92.5 2015
#> 10 North Carolina 33 123.3  94.9 2016
#> 11       Kentucky 27 123.2  95.1 2016
#> 12           Duke 25 121.2  98.9 2016
#> 13 North Carolina 33 121.0  91.5 2017
#> 14       Kentucky 32 118.3  91.3 2017
#> 15           Duke 28 122.1  95.6 2017
#> 16           Duke 29 122.3  92.9 2018
#> 17 North Carolina 26 120.7  97.1 2018
#> 18       Kentucky 26 115.8  95.6 2018
#> 19           Duke 32 118.9  89.2 2019
#> 20       Kentucky 30 117.5  89.8 2019
#> 21 North Carolina 29 120.1  91.4 2019
```

This will output a table showing the requested stats for the specified
teams and years. If only wanting one team, stat, or year, you can input
just that individual item instead of a vector.

### Predicting game winners

To predict the winner of a game between two teams, you can use the
`predict_winner()` function:

``` r
team1 <- "Duke"
team2 <- "North Carolina"
stats <- c("ADJOE", "ADJDE")
year <- 2019

predict_winner(team1, team2, stats, year)
#> [1] "After comparing the stats we believe that  North Carolina  has a higher chance of winning the game."
```

This will output the predicted winner of the game based on the specified
stats and year.

## Conclusion

The bracketpredictr package provides a convenient set of functions for
analyzing college basketball stats.
