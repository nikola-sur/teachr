#' Create PDF out of lecture notes
#'
#' Creates a PDF out of the lecture notes HTML file. Google Chrome must be installed
#' in order to use this funciton.
#'
#' @param week See create_lecture()
#' @param day See create_lecture
#'
#' @export
create_lecture_pdf <- function(week, day) {
  pdf_name <- paste0("w", week, "-l", day)
  pagedown::chrome_print(paste0("lectures/week-", week, "/", pdf_name, "/", pdf_name,
                                ".html"), format='pdf')
}
