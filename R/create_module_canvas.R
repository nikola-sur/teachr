#' Create a new module on Canvas
#'
#' Internal function. Creates a new module on Canvas.
#'
#' @param name See create_module()
#' @param week See create_module()
create_module_canvas <- function(name, week) {
  post_title <- paste0("Week ", week, ": ", name)
  slug <- paste0("week-", week)
  distill::create_post(post_title, slug = slug, date_prefix = NULL)

  # Overwrite post content with default 'new_module' content
  site_path <- get_site_path()
  file_path <- paste0(site_path, "/new_module.RMD")
  file.copy(from = file_path, to = paste0("_posts/", slug, "/", slug, ".RMD"))
  rmarkdown::render_site()
}
