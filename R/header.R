header <- function() {
	dashboardHeader(
		title = tagList(
			span(class = 'logo-lg',
			     a("df Comparator", style="color:white !important", 
			       href='https://cran.r-project.org/web/packages/dataCompare/vignettes/dataCompare.html')),
			a(style = "margin: -15px", 
			  href='https://github.com/seewe/dataCompare', 
			  img(src = "www/dfComparator.png", width="225%"))
		),
		controlbarIcon = "gear"
	)
}
