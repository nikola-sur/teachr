#' Create a new module
#'
#' Creates a new module for the course and automatically updates the course website,
#' GitHub repositories, and Canvas.
#'
#' @param name Module name as a character string. Example: 'Linear Regression'
#' @param week Module/week number as an integer value. Note that in this package
#' module number = week number as these are assumed to be the same.
#'
#' @export
create_module <- function(name, week) {
  create_module_lectures(week = week)
  create_module_canvas(name = name, week = week)
}
