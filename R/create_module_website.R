#' Create a new module on the course website
#'
#' Creates a new module on the course website. Note that this function needs to
#' be run from the "(organization).github.io" repository.
#'
#' @param name See create_module()
#' @param week See create_module()
#'
#' @export
create_module_website <- function(name, week) {
  post_title <- paste0("Week ", week, ": ", name)
  slug <- paste0("week-", week)
  distill::create_post(post_title, slug = slug, date_prefix = NULL)

  # Overwrite post content with default 'new_module' content
  site_path <- get_site_path()
  file_path <- paste0(site_path, "/new_module.RMD")
  file.copy(from = file_path, to = paste0("_posts/", slug, "/", slug, ".Rmd"),
            overwrite = TRUE)
  print(file_path)
  print(paste0("_posts/", slug, "/", slug, ".Rmd"))
  rmarkdown::render_site()
}
