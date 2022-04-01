#' Create a new assignment on Canvas
#'
#' Internal function. Creates a new assignment for the course on Canvas.
#'
#' @param name Assignment name as a character string. If left blank, assignments
#' are titled as 'Assignment (number)'
#' @param number Assignment number as an integer value.
#' @param week Week/module number for the assignment. The assignment is then
#' automatically placed in the correct location on the course website.
create_assignment_canvas <- function(name, number, week) {
  token <- get_canvas_token()
  course_id <- get_course_id()
  return(0)
}
