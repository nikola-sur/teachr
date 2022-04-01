#' Link to a Canvas course
#'
#' Establish a connection with the Canvas Instructure LMS API. Doing so allows
#' for automatic updates to the Canvas course. This only needs to be performed once.
#'
#' @param token_path Path to where the Canvas API token number is stored. This
#' should be stored in a file of type '.txt'. The Canvas token can be obtained in
#' Settings > Approved Integrations > New Access Token.
#' @param course_id Canvas course number as an integer.
#'
#' @export
link_canvas <- function(token_path, course_id) {
  token <- as.character(utils::read.table(file = token_path))
  if (!dir.exists("meta/")) dir.create("meta/")
  utils::write.table(token_path, file = "meta/token_path.txt", row.names = FALSE,
                     col.names = FALSE)
  utils::write.table(course_id, file = "meta/course_id.txt", row.names = FALSE,
                     col.names = FALSE)
}
