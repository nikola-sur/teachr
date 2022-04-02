#' Retrieve the site URL.
#'
#' Internal function. Retrieves the site URL.
#'
#' @keywords internal
get_site_url <- function() {
  return(paste0("https://", get_organization(), ".github.io"))
}
