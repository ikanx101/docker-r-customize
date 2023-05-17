FROM rocker/rstudio:4.2.2

ENV USER="rstudio" PASSWORD="rstudio" ROOT="TRUE"

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
	&& apt-get clean all && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN Rscript -e "install.packages(c('gapminder','text2vec','dbscan','stringdist','ggraph','igraph','proxy','sf','maps','factoextra','tictoc','packrat','rsconnect','shinydashboard','shinymanager','shiny','nomnoml','xaringan','DT','caret','expss','rmdformats','TSP','dplyr','tidyr','readxl','janitor','openxlsx','stringr','knitr','checkmate','htmlwidgets','rvest','ggplot2','txtplot','tidytext','reshape2','readxl','ggpubr','ggrepel','ROI','ompr','ompr.roi','ROI.plugin.glpk','rmarkdown','RSelenium','gganimate','tm'));"


WORKDIR /home/rstudio
