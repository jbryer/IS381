source('config.R')

slides_dir <- 'slides'
posts_dir <- 'posts'
schedule_file <- 'Schedule.xlsx'

meetups <- readxl::read_excel(schedule_file, sheet = 'Schedule')
for(i in 1:nrow(meetups)) {
	if(!is.na(meetups[i,]$Slides) | !is.na(meetups[i,]$Video)) {
		blogfile <- paste0(posts_dir, '/', stringr::str_pad(meetups[i,]$Week, 2, pad = "0"), '-',
						   gsub(' ', '_', meetups[i,]$Topic),
						   '.qmd')

		if(file.info(blogfile)$mtime < file.info(schedule_file)$mtime) {
			blogcontent <- ''
			if(!is.na(meetups[i,]$Slides)) {
				blogcontent <- paste0(blogcontent, '[Click here](/', slides_dir, '/', meetups[i,]$Slides, '.html#1) to open the slides')
				pdf_slide <- paste0(slides_dir, '/', meetups[i,]$Slides)
				if(file.exists(pdf_slide)) {
					blogcontent <- paste0(blogcontent, '([PDF](/', slides_dir, '/', meetups[i,]$Slides, '.pdf))')
				}
				blogcontent <- paste0(blogcontent, '.\n\n')
			}
			if(!is.na(meetups[i,]$Video)) {
				blogcontent <- paste0(
					blogcontent,
					'<iframe width="560" height="315" src="https://www.youtube.com/embed/',
					meetups[i,]$Video,
					'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
			}
			# else if(!is.na(meetups[i,]$Slides)) {
			# 	blogcontent <- paste0(
			# 		blogcontent,
			# 		'{{< html /"', slides_dir, '/', meetups[i,]$Slides, '.html" height="450px" >}}'
			# 	)
			# }

			additionalcontent <- ''
			if(!is.na(meetups[i,]$Resources)) {
				additionalcontent <- meetups[i,]$Resources
			}

			pubdate <- as.character(min(as.Date(meetups[i,]$Meetup), Sys.Date(), na.rm = TRUE))

			meetup_image(
				title = meetups[i,]$Topic,
				date = format(as.Date(pubdate), '%B %d, %Y'),
				out_file = paste0('posts/', tools::file_path_sans_ext(basename(blogfile)), '.png')
			)

			cat('---', '\n',
				'title: "', meetups[i,]$Topic, '"\n',
				# 'author: "Jason Bryer"', '\n',
				'date: ', pubdate, '\n',
				'draft: false', '\n',
				'description: "Slides and recording for the *', meetups[i,]$Topic, '* meetup."\n',
				'categories: ["Meetups"]', '\n',
				'image: "', tools::file_path_sans_ext(basename(blogfile)), '.png"\n',
				'---', '\n\n\n',
				blogcontent, '\n\n',
				additionalcontent, '\n\n',
				sep  = '',
				file = blogfile)
		}
	}
}
