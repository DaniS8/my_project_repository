
FROM rocker/tidyverse

# install R packages
RUN Rscript -e "install.packages('readxl')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('tm')"
RUN Rscript -e "install.packages('SnowballC')"
RUN Rscript -e "install.packages('wordcloud')"
RUN Rscript -e "install.packages('RColorBrewer')"
RUN Rscript -e "install.packages('syuzhet')"
RUN Rscript -e "install.packages('sentimentr')"
RUN Rscript -e "install.packages('ggplot2')"



# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/


# make container entry point 
CMD make report




