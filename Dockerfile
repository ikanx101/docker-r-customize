FROM rocker/rstudio:4.2.2

MAINTAINER ikanx101

RUN apt-get clean all && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		libhdf5-dev \
		libcurl4-gnutls-dev \
		libssl-dev \
		libxml2-dev \
		libpng-dev \
		libxt-dev \
		zlib1g-dev \
		libbz2-dev \
		liblzma-dev \
		libglpk40 \
		libgit2-dev \
	&& apt-get clean all && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN Rscript -e "install.packages(c('TSP','dplyr','tidyr','readxl','janitor','openxlsx','stringr','knitr','checkmate','htmlwidgets','rvest','ggplot2','txtplot','tidytext','reshape2','readxl','ggpubr','ggrepel','ROI','ompr','ompr.roi','ROI.plugin.glpk','rmarkdown','RSelenium','gganimate','av'));"

WORKDIR /home/rstudio
