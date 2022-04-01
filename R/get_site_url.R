#' Retrieve the site URL.
#'
#' Internal function. Retrieves the site URL.
get_site_url <- function() {
  return(paste0("https://", get_organization(), ".github.io"))
}
