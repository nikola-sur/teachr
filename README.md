
<!-- README.md is generated from README.Rmd. Please edit that file -->

# teachr

<!-- badges: start -->
<!-- badges: end -->

Teach reproducible data science by making your course material
reproducible. The ‘teachr’ package helps instructors:

1.  Maintain a course website
2.  Keep Canvas up-to-date with minimal effort by linking content to the
    course website
3.  Teach students about R Markdown, Git, and other data science tools

This is all achieved while making the course materials reproducible so
that instructors can teach reproducible data science by setting a good
example.

Visit the website for this package:
<https://nikola-sur.github.io/teachr/>

## Installation

You can install the development version of teachr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("nikola-sur/teachr")
```

## Prerequisites

This package assumes that you have the following installed on your
system:

-   [Git](https://git-scm.com/downloads)
-   [Python](https://www.python.org/)
-   [Google Chrome](https://www.google.com/intl/en_ca/chrome/) —
    Optional, but useful for converting HTML files to PDF using
    `teachr::create_lecture_pdf()`

and are moderately familiar with:

-   [GitHub](https://github.com/)
-   [R Markdown](https://rmarkdown.rstudio.com/)

## Usage

### First steps

The philosophy of the ‘teachr’ library is that a course should be
organized as a GitHub organization with separate repositories for course
lecture slides, assignments, and for the course website. We will
recreate the website <https://dsci-123-sp2022.github.io/> as an example.

Therefore, the first step is to come up with a GitHub “handle” for your
course. For example, “dsci-123-sp2022” could work for a course called
“DSCI 123 - Introduction to Data Science” taught in Spring 2022. Create
a [new (free) GitHub
organization](https://github.com/account/organizations/new?coupon=&plan=team_free)
and name it according to your chosen course handle.

Run the following code chunk to load the ‘teachr’ library and set up a
folder for your course in the current working directory.

``` r
library(teachr)
teachr::create_course(name = "DSCI 123 - Introduction to Data Science (Spring 2022)",
                      organization = "dsci-123-sp2022")
```

You should now see a new folder called “dsci-123-sp2022” and three
subfolders: “lectures”, “assignments”, and “dsci-123-sp2022.github.io”.
These three folders will contain lecture slides, assignments, and files
for the course website.

Create a GitHub token by running

``` r
usethis::gh_token_help()
usethis::create_github_token()
```

and complete the GitHub token setup. Then, in each of the three
subfolders (“lectures”, “assignments”, and “dsci-123-sp2022.github.io”)
run

``` r
usethis::use_git()
```

to prepare the folders for use with Git. Then, add these repositories to
your GitHub organization and name them “lectures”, “assignments”, and
“dsci-123-sp2022.github.io”. This can be done from GitHub desktop by
clicking `Add > Add existing repository...`. Make sure that the
repositories are all listed as public.

From here, we need to obtain a Canvas API token by visiting
`Account > Settings > Approved Integrations`. Create a new access token
and note it down in an empty “.txt” file on your computer (but don’t
store it in your course repository!). Create a new Canvas course if you
don’t have one for your class already, and note the course ID, which is
visible in the URL for the course. Then, open the organization
repository and run

``` r
teachr::link_canvas(token_path = "../Canvas token.txt", course_id = 1234567,
                    API_URL = "https://canvas.instructure.com/")
```

The `token_path` is the location where your Canvas API token is stored,
relative to the organization repository. The `API_URL` might differ if
you are using Canvas through your institution. For example, it may look
like <https://canvas.ubc.ca/>, instead. If you encounter trouble reading
the token, you might need to add an empty new line in your “.txt” file.

Finally, we head over to the website repository and run

``` r
teachr::initialize_website()
```

This creates a first version of your course website! To make it public,
commit and push the changes in the website repository and in
`Settings > Pages` on GitHub for the repository, set the source to
Branch: main, Folder: /docs. A first version of the site should now be
live!

Also, because the `teachr` package uses the R `reticulate` package to
run Python code, it might be necessary to install the `canvasapi`
package by running

``` r
reticulate::py_install(packages = "canvasapi", pip = TRUE)
```

### Main workflow

Having setup the Canvas and GitHub tokens, we are now ready to use the
`teachr` package! With `teachr`, courses are designed to follow a
certain structure. In particular, course material is grouped into
**modules** with one module per week. Within each module there can be
several **lectures**, one for each lecture in the day of the week.

#### New module

Let’s create our first module by running

``` r
teachr::create_module(name = "First module", week = 1)
```

This automatically

1.  Creates a new subdirectory in the “lectures” repository called
    “week-1”
2.  Creates a new module on Canvas

To create a new module on the course website that is linked with Canvas,
use

``` r
teachr::create_module_website(name = "First module", week = 1)
```

The new module will now be visible at
<https://dsci-123-sp2022.github.io/lectures>. **Note:** Functions ending
in `_website()` must be run from the website repository. The course site
is built using the R `distill` package and it seems that building the
site cannot be done outside of the website project. Feel free to let me
know if you know of a way to do this :)

#### New lecture

Next, we create a new lecture for the corresponding module. We do this
by running in the organization repo

``` r
teachr::create_lecture(name = "Introductory lecture", week = 1, day = 1)
```

Then, from the website repo run

``` r
teachr::create_lecture_website(name = "Introductory lecture", week = 1, day = 1)
```

This will automatically

1.  Add a new subfolder in the “lectures” repository with templates for
    the course slides using Xaringan (more details below)
2.  Add appropriate links to the lectures part of the course website
3.  Create a new Canvas page for the lecture with an iframe that links
    to the appropriate lecture link

[Xaringan](https://bookdown.org/yihui/rmarkdown/xaringan.html) is used
for the lecture slides. A small template for a new set of lecture slides
is included whenever the function `teachr::create_lecture()` is run.
Note that you will need to build the slides from the .Rmd file.

To make the course material publicly available, we need to set up the
“lectures” and “assignments” repositories as GitHub pages. To do this,
go to `Settings > Pages` in each of the repos and use the main branch as
the source.

#### New assignment

Finally, we can create a new assignment using the functions

``` r
teachr::create_assignment(number = 1, week = 1, name = "Linear regression")
```

from the organization repo and

``` r
teachr::create_assignment_website(number = 1, week = 1, name = "Linear regression")
```

in the website repo. If `name` is left blank, it defaults to a naming
system of “Assignment (number)”.

These two functions will

1.  Create a new folder in your “assignments” repo and initialize a .Rmd
    template for the assignment
2.  Update the course website with new assignment materials in the
    appropriate modules
3.  Create a new assignment on Canvas that includes an iframe to the
    assignment on the course website

#### Computational environments

Because the aim of the `teachr` package is to teach reproducibility, the
organization repo is initialized with a `renv.lock` file generated by
the R `renv` package. This lock file can be generated in the other R
projects (“lectures” and “assignments”) by running

``` r
renv::init()
```

After installing packages, the instructor can store their list of
installed packages by running

``` r
renv::snapshot()
```

and then sharing their `renv.lock` file with students. Students can then
use the

``` r
renv::restore()
```

function to ensure that the same packages are loaded as the instructor.
