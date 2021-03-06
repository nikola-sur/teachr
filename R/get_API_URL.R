#' Retrieve the Canvas API URL
#'
#' Internal function. Retrieves the Canvas API URL
#' @keywords internal
get_API_URL <- function() {
  return(as.character(utils::read.table("meta/API_URL.txt")))
}
