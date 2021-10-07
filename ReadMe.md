# My Project
# For my project, I will analyze performance data using R. 
# There are some R packages that need to be installed in order to properly analyze this data.

installed_pkgs <- row.names(installed.packages())
pkgs <- c("readxl", "tm", "SnowballC", "wordcloud", "RColorBrewer", "syuzhet", "sentimentr", "ggplot2", "dplyr")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}


# Execute the analysis
# To execute the analysis, from the project folder you can run

Rscript -e "rmarkdown::render('HW2_up.Rmd')"
