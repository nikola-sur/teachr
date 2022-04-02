#' Create a new module in the 'lectures' repository
#'
#' Internal function. Creates a new module in the 'lectures' repository.
#' @param week See create_module()
#'
#' @keywords internal
create_module_lectures <- function(week) {
  dir_name <- paste0("week-", week)
  path <- paste0("lectures/", dir_name)
  if (!dir.exists(path)) dir.create(path)
}
