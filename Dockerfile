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
		libpng-dev \
		libxt-dev \
		zlib1g-dev \
		libbz2-dev \
		liblzma-dev \
		libglpk40 \
		libgit2-dev \
		git \
		pandoc \
		libgdal-dev \
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

RUN Rscript -e "install.packages(c('scales','markdown','qcc','ggwordcloud','dbscan','stringdist','ggraph','igraph','proxy','sf','maps','factoextra','tictoc','packrat','rsconnect','shinydashboard','shinymanager','shiny','nomnoml','xaringan','DT','caret','expss','rmdformats','TSP','dplyr','tidyr','readxl','janitor','openxlsx','stringr','knitr','checkmate','htmlwidgets','rvest','ggplot2','txtplot','tidytext','reshape2','readxl','ggpubr','ggrepel','ROI','ompr','ompr.roi','ROI.plugin.glpk','rmarkdown','RSelenium','gganimate','tm'));"
RUN Rscript -e "install.packages('tensorflow')"
RUN Rscript -e "path_to_python <- install_python()"
RUN Rscript -e "virtualenv_create('r-reticulate', python = path_to_python)"
RUN Rscript -e "library(tensorflow);install_tensorflow(envname = 'r-reticulate')"
RUN Rscript -e "install.packages('keras')"
RUN Rscript -e "library(keras)"
RUN Rscript -e "install_keras(envname = 'r-reticulate')"
RUN Rscript -e "reticulate::install_miniconda(force = T)"
RUN Rscript -e "reticulate::install_python()"

WORKDIR /home/rstudio
