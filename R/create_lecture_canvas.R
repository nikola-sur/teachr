#' Create a new lecture on Canvas
#'
#' Internal function. Creates a new lecture on Canvas.
#'
#' @param name See create_lecture()
#' @param week See create_lecture()
#' @param day See create_lecture()
#'
#' @keywords internal
create_lecture_canvas <- function(name, week, day) {
  lecture_name <- paste0("Week ", week, " Day ", day, ": ", name)
  file_name <- paste0("week-", week)
  slug <- paste0("w", week, "-l", day)
  lecture_url <- paste0(get_site_url(), "/lectures/", file_name, "/", slug, "/", slug)
  body <- paste0("<p><iframe style=\"overflow: hidden;\" src=\"", lecture_url, "\" width=\"1024\" height=\"728\"></iframe></p>")

  # Create new page
  py_code <- paste0(get_canvas_py_code_header(), "
page = course.create_page({
  'title': '", lecture_name, "',
  'body': '", body, "'
})")
  reticulate::py_run_string(py_code)
  # TODO: Link page to appropriate module
}
