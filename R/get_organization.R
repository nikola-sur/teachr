#' Retrieve the Canvas token
#'
#' Internal function. Retrieves the Canvas token.
get_organization <- function() {
  return(as.character(utils::read.table("meta/organization.txt")))
}
