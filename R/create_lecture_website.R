#' Create a new lecture in the website repository
#'
#' Updates lecture information in the website repository for the corresponding module.
#' Needs to be run from the website repository.
#'
#' @param name See create_lecture()
#' @param week See create_lecture()
#' @param day See create_lecture()
#'
#' @export
create_lecture_website <- function(name, week, day) {
  title <- paste0("Week ", week, ", Day ", day, ": ", name)
  file_name <- paste0("week-", week)
  slug <- paste0("w", week, "-l", day)
  lecture_link <- paste0(get_site_url(), "/lectures/", file_name, "/", slug, "/", slug)
  new_text <- paste0("- [Slides for ", title, "](", lecture_link, ")")
  write(x = new_text, file = paste0("_posts/", file_name, "/", file_name, ".Rmd"), append = TRUE)
}
