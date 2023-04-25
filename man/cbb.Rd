\name{cbb}
\alias{cbb}
\docType{data}
\title{
Divison I College Baskeball Stats
}
\description{
A dataset containing the stats of Division I college baseball teams, between the years 2013 and 2019.
}
\usage{data("cbb")}
\format{
  A data frame with 2455 rows and 24 columns.
}
\details{
The variables are as follows:

\itemize{
  \item RK (Only in cbb20):  The ranking of the team at the end of the regular season according to barttorvik
  \item TEAM: The Division I college basketball school.
  \item CONF: The Athletic Conference in which the school participates in (A10 = Atlantic 10, ACC = Atlantic Coast Conference, AE = America East, Amer = American, ASun = ASUN, B10 = Big Ten, B12 = Big 12, BE = Big East, BSky = Big Sky, BSth = Big South, BW = Big West, CAA = Colonial Athletic Association, CUSA = Conference USA, Horz = Horizon League, Ivy = Ivy League, MAAC = Metro Atlantic Athletic Conference, MAC = Mid-American Conference, MEAC = Mid-Eastern Athletic Conference, MVC = Missouri Valley Conference, MWC = Mountain West, NEC = Northeast Conference, OVC = Ohio Valley Conference, P12 = Pac-12, Pat = Patriot League, SB = Sun Belt, SC = Southern Conference, SEC = South Eastern Conference, Slnd = Southland Conference, Sum = Summit League, SWAC = Southwestern Athletic Conference, WAC = Western Athletic Conference, WCC = West Coast Conference)
  \item G: Number of games played
  \item W: Number of games won
  \item ADJOE: Adjusted Offensive Efficiency (An estimate of the offensive efficiency (points scored per 100 possessions) a team would have against the average Division I defense)
  \item ADJDE: Adjusted Defensive Efficiency (An estimate of the defensive efficiency (points allowed per 100 possessions) a team would have against the average Division I offense)
  \item BARTHAG: Power Rating (Chance of beating an average Division I team)
  \item EFG_O: Effective Field Goal Percentage Shot
  \item EFG_D: Effective Field Goal Percentage Allowed
  \item TOR: Turnover Percentage Allowed (Turnover Rate)
  \item TORD: Turnover Percentage Committed (Steal Rate)
  \item ORB: Offensive Rebound Rate
  \item DRB: Offensive Rebound Rate Allowed
  \item FTR : Free Throw Rate (How often the given team shoots Free Throws)
  \item FTRD: Free Throw Rate Allowed
  \item 2P_O: Two-Point Shooting Percentage
  \item 2P_D: Two-Point Shooting Percentage Allowed
  \item 3P_O: Three-Point Shooting Percentage
  \item 3P_D: Three-Point Shooting Percentage Allowed
  \item ADJ_T: Adjusted Tempo (An estimate of the tempo (possessions per 40 minutes) a team would have against the team that wants to play at an average Division I tempo)
  \item WAB: Wins Above Bubble (The bubble refers to the cut off between making the NCAA March Madness Tournament and not making it)
  \item POSTSEASON: Round where the given team was eliminated or where their season ended (R68 = First Four, R64 = Round of 64, R32 = Round of 32, S16 = Sweet Sixteen, E8 = Elite Eight, F4 = Final Four, 2ND = Runner-up, Champion = Winner of the NCAA March Madness Tournament for that given year)
  \item SEED: Seed in the NCAA March Madness Tournament
  \item YEAR: Season
 }
}
\source{
Andrew Sundberg. (3/15/2021). College Basketball Dataset, Version 4. Retrieved 3/31/2023 from https://www.kaggle.com/datasets/andrewsundberg/college-basketball-dataset
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(cbb)
}
\keyword{datasets}
