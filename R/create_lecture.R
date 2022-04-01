#' Create a new lecture
#'
#' Creates a new lecture for the course and automatically updates the course website,
#' GitHub repositories, and Canvas.
#'
#' @param name Lecture name as a character string. Example: 'Linear Regression: The Basics'
#' @param week Lecture week as an integer value.
#' @param day Day/lecture number as an integer value. For example, for courses
#' with lectures on M/W/F, each new week would be a new module and day = 1, 2, 3
#' for M, W, F, respectively.
#'
#' @export
create_lecture <- function(name, week, day) {
  create_lecture_lectures(name = name, week = week, day = day)
  create_lecture_canvas(name = name, week = week, day = day)
}
