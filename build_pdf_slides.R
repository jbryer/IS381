slides_dir <- 'slides'

tocopy <- c(list.files(slides_dir, pattern = '.html'),
			list.dirs(slides_dir, recursive = FALSE, full.names = FALSE))
ignore <- c('draft')
for(i in tocopy) {
	from <- paste0(slides_dir, '/', i)

	if(tolower(tools::file_ext(from)) == 'html') {
		pdf <- paste0(tools::file_path_sans_ext(from), '.pdf')

		build_pdf <- !file.exists(pdf) | file.info(from)$mtime > file.info(pdf)$mtime

		if(build_pdf) {
			# wd <- setwd('Slides/')
			tryCatch({
				# renderthis::to_pdf(i,
				# 				   complex_slides = TRUE,
				# 				   partial_slides = FALSE)
				pagedown::chrome_print(paste0(slides_dir, '/', i),
									   paste0(slides_dir, '/', basename(pdf)),
									   timeout = 120)
			}, error = function(e) {
				cat(paste0('Error generating PDF from ', from))
				print(e)
			}, finally = {
				# setwd(wd)
			})
		}
	}
}
