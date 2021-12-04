
report: Final_Report.Rmd  output/wordfrequencies.png
	Rscript -e "rmarkdown::render('Final_Report.Rmd')"

output/wordfrequencies.png: ISOM_barplot.R
	Rscript ISOM_barplot.R
