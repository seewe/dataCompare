header <- function() {
	dashboardHeader(
		title = tagList(
			span(class = 'logo-lg',
			     a("df Comparator", style="color:white !important", 
			       href='https://cran.r-project.org/web/packages/arsenal/vignettes/comparedf.html')),
			a(style = "margin: -15px", 
			  href='https://cran.r-project.org/web/packages/arsenal/vignettes/comparedf.html', 
			  img(src = "www/dfComparator.png", width="225%"))
		),
		controlbarIcon = "gear"
	)
}
