FROM rocker/rstudio:4.2.0

ENV USER="ikanx101" PASSWORD="ikanx101" ROOT="TRUE"

MAINTAINER ikanx101.com

RUN apt-get clean all && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		libhdf5-dev \
		libssl-dev \
		libxml2-dev \
		libxt-dev \
		zlib1g-dev \
		libbz2-dev \
		liblzma-dev \
		libglpk40 \
		libgit2-dev \
		git \
		pandoc \
		libgdal-dev \
  		gdal-bin \
  		libpng-dev \
  		libjpeg-dev \
  		libfreetype6-dev \
  		libglu1-mesa-dev \
  		libgl1-mesa-dev \
  		zlib1g-dev \
  		libicu-dev \
  		libgdal-dev gdal-bin \
  		libgeos-dev \
  		libproj-dev \
    		libgeos-dev \
      		libproj-dev \
		cmake \
		libglpk-dev \
		libfontconfig1-dev \
		libavfilter-dev \
		libcairo2-dev \
  		python3 \
    		python3-dev \
      		python3-pip \
		python3-venv \
	&& apt-get clean all && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN Rscript -e "install.packages(c('scales','markdown','qcc','ggwordcloud','dbscan','stringdist','ggraph','igraph','proxy','sf','maps','factoextra','tictoc','packrat','rsconnect','shinydashboard','shinymanager','shiny','nomnoml','xaringan','DT','caret','expss','rmdformats','TSP','dplyr','tidyr','readxl','janitor','openxlsx','stringr','knitr','checkmate','htmlwidgets','rvest','ggplot2','txtplot','tidytext','reshape2','readxl','ggpubr','ggrepel','ROI','ompr','ompr.roi','ROI.plugin.glpk','rmarkdown','RSelenium','gganimate','tm','raster'));"

RUN Rscript -e "install.packages('rayshader')"

RUN Rscript -e "install.packages('kableExtra')"

RUN Rscript -e "install.packages('CGPfunctions')"

RUN Rscript -e "install.packages('CHAID', repos = 'http://R-Forge.R-project.org')"

RUN Rscript -e "install.packages('devtools')"

RUN Rscript -e "devtools::install_github('PMassicotte/gtrendsR')"

WORKDIR /home/rstudio
