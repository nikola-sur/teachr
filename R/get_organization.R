#' Retrieve the Canvas token
#'
#' Internal function. Retrieves the Canvas token.
get_organization <- function() {
  path <- "meta/organization.txt"
  if (!dir.exists("meta")) {
    path <- paste0("../", path)
  }
  return(as.character(utils::read.table(path)))
}
