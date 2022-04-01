#' Create a new assignment
#'
#' Creates a new assignment for the course and automatically updates the course website,
#' GitHub repositories, and Canvas.
#'
#' @param name Assignment name as a character string. If left blank, assignments
#' are titled as 'Assignment (number)'
#' @param number Assignment number as an integer value.
#' @param week Week/module number for the assignment. The assignment is then
#' automatically placed in the correct location on the course website.
#'
#' @export
create_assignment <- function(number, week, name = NULL) {
  if (is.null(name)) name <- paste0("Assignment ", number)
  create_assignment_canvas(name = name)
}
