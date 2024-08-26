`foo` <- function(m, data = NULL) {
  # get the model frame from the model
  mf <- m$model
  # if data is not supplied try to recreate it from call
  if (is.null(data)) {
    data <- eval(m$call$data, parent.frame())
  }
  # if still NULL, put model frame in data
  if (is.null(data)) {
    data <- mf
  }
  # get call as we want to apply subset etc to data
  mod_call <- m$call
  # which bits of the call do we want
  take <- match(c("formula", "data", "subset", "weights", "na.action",
        "offset", "drop.unused.levels"), names(mod_call), 0L)
  mod_call <- mod_call[c(1L, take)]
  mod_call[[1L]] <- quote(stats::model.frame)
  mod_call[["formula"]] <- m$pred.formula # clean formula
  data <- eval(mod_call, parent.frame())
  data
}

`bar` <- function(m, data = NULL) {
  foo(m, data = data)
}
