#' Initialize website for 'teachr' course
#'
#' Internal function. Creates the website. Only run this function once.
#'
#' @param name See create_course()
#'
#' @keywords internal
initialize_website <- function(name) {
  distill::create_website(dir = getwd(), title = name, gh_pages = TRUE)

  # Create pages for website
  site_path <- get_site_path()
  site_files <- list.files(path = site_path)
  for (file in site_files) {
    file_path <- paste0(site_path, "/", file)
    file.copy(from = file_path, to = getwd(), overwrite = TRUE)
  }

  rmarkdown::render_site()
}
