#' Retrieve the Canvas token
#'
#' Internal function. Retrieves the Canvas token.
#'
#' @keywords internal
get_canvas_token <- function() {
  path <- as.character(utils::read.table("meta/token_path.txt"))
  return(as.character(utils::read.table(path)))
}
