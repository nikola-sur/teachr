#' Create a new assignment on Canvas
#'
#' Internal function. Creates a new assignment for the course on Canvas.
#'
#' @param name Assignment name as a character string.
create_assignment_canvas <- function(name) {
  assignment_url <- paste0(get_site_url(), "/assignments")
  description <- paste0("<p><iframe style=\"overflow: hidden;\" src=\"", assignment_url, "\" width=\"600\" height=\"2400\"></iframe></p>")

  py_code <- paste0(get_canvas_py_code_header(), "
assignment = course.create_assignment({
  'name': '", name, "',
  'description': '", description, "'
})")
  reticulate::py_run_string(py_code)
}
