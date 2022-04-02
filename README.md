
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
usethis::use_github()
```

to prepare the folders for use with Git.
