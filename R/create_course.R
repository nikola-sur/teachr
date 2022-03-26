#' Create a new course
#'
#' Creates a new GitHub organization for a course along with several repositories in the GitHub organization.
#'
#' @param name Course title as a character string. Example: 'DSCI 100 - Introduction to Data Science'
#' @param organization Name of the organization as a character string with no spaces.
#' This name must be available on GitHub, otherwise an error will be returned.
#' Example: 'dsci-100-2022'
#' @param path Path to the directory where to create the organization. If left
#' blank, defaults to the current working directory.
#'
#' @return
#' @export
create_course <- function(name, organization, path = ".") {
  initialize_directories(name = name, organization = organization, path = path)
  initialize_website(name = name, organization = organization, path = path)
  initialize_canvas(name = name, organization = organization, path = path)
}
