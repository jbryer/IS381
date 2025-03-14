# This script is used for the Github action for building the course site. However, it is useful
# for install the required R packages for this course.

install.packages(c(
	'cowplot',
	'devtools',
	'knitr',
	'latex2exp',
	'pagedown',
	'psych',
	'qrcode',
	'rcmdcheck',
	'RColorBrewer',
	'readxl',
	'remotes',
	'reshape2',
	'rmarkdown',
	'tidyverse',
	'wordcloud'
))

remotes::install_github('jbryer/VisualStats')
