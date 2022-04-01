#' Retrieve the header Python code for sending commands to Canvas
#'
#' Internal function. Retrieves the header Python code for sending commands to Canvas.
get_canvas_py_code_header <- function() {
  token <- get_canvas_token()
  course_id <- get_course_id()
  url <- get_API_URL()

  paste0("from canvasapi import Canvas
token = '", token, "'
url = '", url, "'
connection = Canvas(url, token)
course = connection.get_course(", course_id, ")")
}
