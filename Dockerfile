FROM rocker/rstudio:latest

ENV ROOT="TRUE"

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
      		postgresql-client \
		libmagick++-dev \
  		libatk1.0-0 \
    		libatk-bridge2.0-0 \
      		libxkbcommon-x11-0 \
		libxcomposite-dev \
 	 	libxdamage1 \
    		libxrandr2 \
      		libgtk-3-0 \
	&& apt-get clean all && \
	apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get -y update && apt-get install -y  libudunits2-dev libgdal-dev libgeos-dev libproj-dev

RUN apt-get -y update && apt-get install -y python3-pip

RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.24/quarto-1.8.24-linux-amd64.deb
RUN gdebi quarto-1.8.24-linux-amd64.deb

RUN quarto install tinytex

RUN quarto install chromium

RUN Rscript -e "install.packages(c('scales','markdown','qcc','ggwordcloud','dbscan','stringdist','ggraph','igraph','proxy','sf','maps','factoextra','tictoc','packrat','rsconnect','shinydashboard','shinymanager','shiny','nomnoml','xaringan','DT','caret','expss','rmdformats','TSP','dplyr','tidyr','readxl','janitor','openxlsx','stringr','knitr','checkmate','htmlwidgets','rvest','ggplot2','txtplot','tidytext','reshape2','readxl','ggpubr','ggrepel','ROI','ompr','ompr.roi','ROI.plugin.glpk','rmarkdown','RSelenium','gganimate','tm','raster'));"

RUN Rscript -e "install.packages(c('rayshader','kableExtra','CGPfunctions','devtools','rgeos'))"

RUN Rscript -e "install.packages('CHAID', repos = 'http://R-Forge.R-project.org')"

RUN Rscript -e "install.packages(c('bit64','data.table','gtools','zoo','rio','geosphere','geodist'))"

RUN Rscript -e "install.packages(c('forecast','TTR','tseries','fpp','TSstudio','MLmetrics','padr'))"

RUN Rscript -e "devtools::install_github('PMassicotte/gtrendsR')"

RUN Rscript -e "devtools::install_github('ropensci/skimr')"

RUN Rscript -e "install.packages(c('epoxy','lavaan','psych','mapview','RPostgres'))"

RUN Rscript -e "install.packages(c('dtplyr','ggridges','klaR','ggtext'))"

RUN Rscript -e "install.packages(c('bench','formattable','pscl'))"

RUN Rscript -e "install.packages(c('leaflet','leaflet.extras','chromote'))"

RUN Rscript -e "install.packages(c('Ryacas','shinythemes','UpSetR','solitude','shinyalert','shinyjs','openssl'))"

RUN Rscript -e "install.packages(c('treemapify','GWalkR','ggh4x','Robyn','prophet','randomForest'))"

RUN Rscript -e "install.packages(c('ggthemes','tidyverse','av','Hmisc','qpdf','googleway','osrm','lsa','tidymodels','Metrics'))"

RUN Rscript -e "install.packages(c('wordcloud2','webshot','randomNames','telegram.bot','googlesheets4','tidygeocoder','olsrr','fpc','Rtsne'))"

RUN Rscript -e "install.packages(c('datarium','PerformanceAnalytics','memisc','summarytools','vtree','DataExplorer','GGally','getwiki'))"

# install utk LLM dengan R
RUN Rscript -e "install.packages('ellmer')"
RUN Rscript -e "install.packages('pak')"
RUN Rscript -e "pak::pak('tidyverse/ragnar')"
RUN Rscript -e "pak::pak('posit-dev/btw')"
RUN Rscript -e "pak::pak('posit-dev/shinychat/pkg-r')"

RUN Rscript -e "webshot::install_phantomjs()"

RUN Rscript -e "install.packages(c('flowchart','VGAM'))" # VGAM untuk pareto density plot
RUN Rscript -e 'remotes::install_github("davidsjoberg/ggsankey")'
RUN Rscript -e 'remotes::install_github("yukiyanai/rgamer")'
# ada tambahan aidea
RUN Rscript -e 'remotes::install_github("cpsievert/aidea")'

RUN Rscript -e "install.packages('BiocManager')"
RUN Rscript -e "BiocManager::install('EBImage')"
RUN Rscript -e "install.packages(c('gtExtras','gt','gtsummary','flextable','queuecomputer','simmer','simmer.plot','torch'))"

# https://tensorflow.rstudio.com/install/
RUN Rscript -e "install.packages(c('reticulate','keras3','text2vec','tensorflow'))" #'keras' kita ilangin dulu karena gak kompatibel skripnya
RUN Rscript -e "install.packages(c('DALEX'))"
RUN Rscript -e "tensorflow::install_tensorflow()"
WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio set_awal.sh /home/rstudio/set_awal.sh
