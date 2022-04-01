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
  url <- get_API_URL()

  description <- "<p><iframe style=\"overflow: hidden;\" src=\"https://ubc-dsci.github.io/dsci-100-student/\" width=\"800\" height=\"3200\"></iframe></p>"
  py_code <- paste0("from canvasapi import Canvas
token = '", token, "'
url = '", url, "'
connection = Canvas(url, token)
course = connection.get_course(", course_id, ")

assignment = course.create_assignment({
  'name': 'Assignment 23',
  'description': '", description, "'
})
")
  reticulate::py_run_string(py_code)
}
