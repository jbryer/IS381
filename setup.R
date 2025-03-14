# This script is used for the Github action for building the course site. However, it is useful
# for install the required R packages for this course locally as well.

pkgs <- c(
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
)

github_pkgs <- c(
	'jbryer/VisualStats'
)

for(i in pkgs) {
	if(!require(i)) {
		install.packages(i)
	}
}

# for(i in github_pkgs) {
# 	pkg <- strsplit(i, '/')[[1]][2]
# 	if(!require(pkg)) {
# 		remotes::install_github(i)
# 	}
# }
