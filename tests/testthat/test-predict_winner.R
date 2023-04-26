test_that("predict winner works", {
  expect_equal(predict_winner("Utah St.", "UNLV",
                              c("ADJOE", "ADJDE", "BARTHAG", "ORB", "DRB"),
                              years = 2018), "Utah St.")
})
