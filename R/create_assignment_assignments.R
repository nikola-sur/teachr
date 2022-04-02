#' Create a new assignment in the 'assignments' repository
#'
#' Internal function. Creates a new assignment in the 'assignments' repository.
#'
#' @param name See create_assignment()
#' @param number See create_assignment()
#' @param week See create_assignment()
create_assignment_assignments <- function(name, number, week) {
  # Create new folders
  dir_name <- paste0("hw-", number)
  path <- paste0("assignments/", dir_name)
  if (!dir.exists(path)) dir.create(path)

  # Create empty lecture slides from template
  site_path <- get_site_path()
  file_path <- paste0(site_path, "/new_assignment.Rmd")
  file.copy(from = file_path, to = paste0(path, "/", dir_name, ".Rmd"))
}
