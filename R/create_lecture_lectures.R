#' Create a new lecture in the 'lectures' repository
#'
#' Internal function. Creates a new lecture in the 'lectures' repository.
#'
#' @param name See create_lecture()
#' @param week See create_lecture()
#' @param day See create_lecture()
#'
#' @keywords internal
create_lecture_lectures <- function(name, week, day) {
  # Create new folders
  dir_name <- paste0("w", week, "-l", day)
  path <- paste0("lectures/week-", week, "/", dir_name)
  if (!dir.exists(path)) dir.create(path)

  # Create empty lecture slides from template
  site_path <- get_site_path()
  file_path <- paste0(site_path, "/new_lecture.Rmd")
  file.copy(from = file_path, to = paste0(path, "/", dir_name, ".Rmd"))
}
