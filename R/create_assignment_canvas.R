#' Create a new assignment on Canvas
#'
#' Internal function. Creates a new assignment for the course on Canvas.
#'
#' @param name Assignment name as a character string.
create_assignment_canvas <- function(name) {
  token <- get_canvas_token()
  course_id <- get_course_id()
  url <- get_API_URL()
  assignment_url <- paste0(get_site_url(), "/assignments")


  description <- paste0("<p><iframe style=\"overflow: hidden;\" src=\"", assignment_url, "\" width=\"600\" height=\"2400\"></iframe></p>")
  py_code <- paste0("from canvasapi import Canvas
token = '", token, "'
url = '", url, "'
connection = Canvas(url, token)
course = connection.get_course(", course_id, ")

assignment = course.create_assignment({
  'name': '", name, "',
  'description': '", description, "'
})
")
  reticulate::py_run_string(py_code)
}
