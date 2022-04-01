#' Retrieve the Canvas course ID
#'
#' Internal function. Retrieves the Canvas course ID.
get_course_id <- function() {
  return(as.numeric(utils::read.table("meta/course_id.txt")))
}
