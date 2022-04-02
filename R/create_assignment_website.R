#' Create a new assignment in the website repository
#'
#' Updates assignment information in the website repository for the corresponding
#' module. Needs to be run from the website repository.
#'
#' @param name See create_assignment()
#' @param number See create_assignment()
#' @param week See create_assignment()
#'
#' @export
create_assignment_website <- function(name, number, week) {
  slug <- paste0("hw-", number)
  assignment_url <- paste0(get_site_url(), "/assignments/", slug, "/", slug)
  folder_name <- paste0("week-", week)
  new_text <- paste0("- [Homework ", number, "](", assignment_url, ")")
  write(x = new_text, file = paste0("_posts/", folder_name, "/", folder_name, ".Rmd"), append = TRUE)
}
