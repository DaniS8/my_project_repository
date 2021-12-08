# My Project
For my project, I will analyze performance data using R. To analyze this data, you will load it, clean it, build a matrix and then plot the data. 
There are some R packages that need to be installed in order to properly analyze this data.

```R
installed_pkgs <- row.names(installed.packages())
pkgs <- c("readxl", "dplyr", "tm", "SnowballC", "wordcloud", "RColorBrewer", "syuzhet", "sentimentr", "ggplot2")
for(p in pkgs){if(!(p %in% installed_pkgs)){install.packages(p)}}
```

You will need to install the following packages in R: "readxl"  for reading excel doc, "tm" for text mining, "SnowballC" for text stemming, "wordcloud" for word-cloud generator, "RColorBrewer" for color palettes, "syuzhet" for sentiment analysis, "sentimentr"  for sentiment analysis, "ggplot2" for plotting graphs, and "dplyr".



# Execute the analysis
To execute the analysis, from the project folder you can run:

```bash
Rscript -e "rmarkdown::render('Final_Report.Rmd')"
```

To produce the report you will need the following code:
```bash
make report
```

# Docker Information
```bash
To pull image: Docker pull dsargeant8/rocker_and_tidyverse 
To make directory: mkdir output
To run: docker run -v absolute_file_path/output:/project/output dsargeant8/rocker_and_tidyverse 
```
