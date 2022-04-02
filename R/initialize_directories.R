#' Initialize directories for 'teachr' course
#'
#' Internal function. Creates the appropriate directories at 'path'.
#'
#' @param name See create_course()
#' @param organization See create_course()
#' @param path See create_course()
initialize_directories <- function(name, organization, path) {
  repos <- c("lectures", "assignments", paste0(organization, ".github.io"))
  org_path <- paste0(path, "/", organization)

  # Create organization folder
  dir.create(path = org_path, showWarnings = TRUE)
  usethis::create_project(path = org_path, open = FALSE)
  renv::init()

  # Create repo folders
  for (repo in repos) {
    repo_path <- paste0(org_path, "/", repo)
    dir.create(path = repo_path, showWarnings = TRUE)
    usethis::create_project(path = repo_path, open = FALSE)
  }

  # Add meta files
  utils::write.table(organization, file = "meta/organization.txt", row.names = FALSE,
                     col.names = FALSE)
}
