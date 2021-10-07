# My Project
For my project, I will analyze performance data using R. To analyze this data, you will load it, clean it, build a matrix and then plot the data. 
There are some R packages that need to be installed in order to properly analyze this data.

You will need to install the following packages in R:
install.packages("readxl")  for reading excel doc
install.packages("tm")   for text mining
install.packages("SnowballC") for text stemming
install.packages("wordcloud") for word-cloud generator 
install.packages("RColorBrewer") for color palettes
install.packages("syuzhet") for sentiment analysis
install.packages("sentimentr")  for sentiment analysis
install.packages("ggplot2") for plotting graphs
install.packages("dplyr")



# Execute the analysis
To execute the analysis, from the project folder you can run

```{r}
Rscript -e "rmarkdown::render('HW2_up.Rmd')"
```

