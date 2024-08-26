test_that("bar() works with setup model and data", {
  expect_silent(out <- bar(my_gam, data = my_data))
})

test_that("bar() works with local model and data", {
  new_data <- withr::with_seed(321, gamSim())
  new_gam <- gam(y ~ x0 + s(x1) + s(x2) + s(x3), data = new_data, method = "REML")

  expect_silent(out <- bar(new_gam, data = new_data))
})

test_that("bar() works with local model and setup data", {
  new_data <- withr::with_seed(321, gamSim())
  new_gam <- gam(y ~ x0 + s(x1) + s(x2) + s(x3), data = new_data, method = "REML")

  expect_silent(out <- bar(new_gam, data = my_data))
})

test_that("bar() works with setup model and local data", {
  new_data <- withr::with_seed(321, gamSim())

  expect_silent(out <- bar(my_gam, data = new_data))
})
