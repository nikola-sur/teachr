#' Create a new module on Canvas
#'
#' Internal function. Creates a new module on Canvas.
#'
#' @param name See create_module()
#' @param week See create_module()
create_module_canvas <- function(name, week) {
  module_name <- paste0("Week ", week, ": ", name)
  py_code <- paste0(get_canvas_py_code_header(), "
module = course.create_module({
  'name': '", module_name, "'
})")
  reticulate::py_run_string(py_code)
}
