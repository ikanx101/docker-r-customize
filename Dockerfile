FROM rocker/rstudio:latest

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
  		libpython3-dev \
    		gdebi-core \
    		curl \
	&& apt-get clean all && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# doesnt work
# RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
# RUN gdebi quarto-linux-amd64.deb

RUN pip install git+https://github.com/quarto-dev/quarto-cli

RUN quarto install tinytex

RUN quarto install chromium

RUN Rscript -e "install.packages(c('scales','markdown','qcc','ggwordcloud','dbscan','stringdist','ggraph','igraph','proxy','sf','maps','factoextra','tictoc','packrat','rsconnect','shinydashboard','shinymanager','shiny','nomnoml','xaringan','DT','caret','expss','rmdformats','TSP','dplyr','tidyr','readxl','janitor','openxlsx','stringr','knitr','checkmate','htmlwidgets','rvest','ggplot2','txtplot','tidytext','reshape2','readxl','ggpubr','ggrepel','ROI','ompr','ompr.roi','ROI.plugin.glpk','rmarkdown','RSelenium','gganimate','tm','raster'));"

RUN Rscript -e "install.packages(c('rayshader','kableExtra','CGPfunctions','devtools','rgeos'))"

RUN Rscript -e "install.packages('CHAID', repos = 'http://R-Forge.R-project.org')"

RUN Rscript -e "install.packages(c('bit64','data.table','gtools','zoo','rio','geosphere','geodist'))"

RUN Rscript -e "install.packages(c('forecast','TTR','tseries','fpp','TSstudio','MLmetrics','padr'))"

RUN Rscript -e "devtools::install_github('PMassicotte/gtrendsR')"

RUN Rscript -e "install.packages(c('epoxy','lavaan','psych'))"

RUN Rscript -e "install.packages(c('dtplyr','ggridges'))"

RUN Rscript -e "install.packages(c('bench','formattable'))"

RUN Rscript -e "install.packages(c('leaflet','leaflet.extras'))"

RUN Rscript -e "install.packages(c('Ryacas','shinythemes','UpSetR'))"

RUN Rscript -e "install.packages(c('treemapify','GWalkR'))"

RUN Rscript -e "install.packages(c('ggthemes','tidyverse','av','Hmisc'))"

RUN Rscript -e "install.packages(c('wordcloud2','webshot','randomNames','telegram.bot','googlesheets4'))"

RUN Rscript -e "webshot::install_phantomjs()"

RUN pip install tensorflow
RUN pip install keras
RUN pip install tensorrt

# https://tensorflow.rstudio.com/install/
RUN Rscript -e "install.packages(c('reticulate','keras3','text2vec','tensorflow'))"
RUN Rscript -e "install.packages(c('DALEX'))"
RUN Rscript -e "library(reticulate); virtualenv_create('r-tensorflow', python = install_python())"
RUN Rscript -e "tensorflow::install_tensorflow()"
RUN Rscript -e "keras::install_keras()"

WORKDIR /home/rstudio
