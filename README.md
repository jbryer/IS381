
## IS381 Statistics and Probability with R

### Instructions for setting up the course site for a new semester

1.  Clone this repository. I suggest cloning it into a repository with
    the following format: `IS381-YEAR-SEMESTER`

2.  Update [\_quarto.yml](_quarto.yml) website configuration file.

3.  Update [config.R](config.R) configuration file.

4.  Update the [schedule](Schedule.xlsx).

5.  Create a course logo.

``` r
library(hexSticker)
source('config.R')
sticker(
    subplot = 'images/CUNY_SPS_Logo.png',
    package = paste0(course, ' ', semester, ' ', year),
    filename = 'course_logo.png',
    p_x = 1, p_y = 1.45, p_size = 12, p_color = cuny_colors[1], 
    s_x = 1, s_y = .85, s_width=0.8, s_height = 0.8,
    h_color = cuny_colors[1],
    h_fill = 'white',# cuny_colors[4],
    spotlight = FALSE,
    url = course_link,
    u_size = 4.9,
    u_color = cuny_colors[2],
    white_around_sticker = FALSE
)
```

5.  If you are new instructor (i.e. not Jason) then you need to update
    the email address in [`_quarto.yml`](_quarto.yml) as well as
    [`instructor.qmd`](instructor.qmd).

6.  Update welcome announcement:
    [`posts/00-Welcome.qmd`](posts/00-Welcome.qmd)

7.  

``` bash
quarto render
```

### Useful links

- [CUNY branding
  guidelines](https://www.cuny.edu/wp-content/uploads/sites/4/page-assets/about/administration/offices/communications-marketing/university-identity/campus-logos/28283961_2-CUNY-SPS-Style-guide_110221_onepgr-2.pdf)

- [Building a portolio site
  talk](https://bryer.org/posts/2025-02-19-Github_Portfolio.html) - This
  recording and supporting materials serve as the basis for how this
  course website was created.
