#' Create a new assignment on Canvas
#'
#' Internal function. Creates a new assignment for the course on Canvas.
#'
#' @param name See create_assignment()
#' @param number See create_assignment()
#' @param week See create_assignment()
#'
#' @keywords internal
create_assignment_canvas <- function(name, number, week) {
  slug <- paste0("hw-", number)
  assignment_url <- paste0(get_site_url(), "/assignments/", slug, "/", slug)
  description <- paste0("<p><iframe style=\"overflow: hidden;\" src=\"", assignment_url, "\" width=\"1024\" height=\"728\"></iframe></p>")

  py_code <- paste0(get_canvas_py_code_header(), "
assignment = course.create_assignment({
  'name': '", name, "',
  'description': '", description, "'
})")
  reticulate::py_run_string(py_code)
}
