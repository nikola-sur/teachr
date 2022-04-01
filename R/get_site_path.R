#' Retrieve the path to the "inst/site" folder
#'
#' Internal function. Retrieves the path to the "inst/site" folder.
get_site_path <- function() {
  return(system.file("site", package = "teachr"))
}
