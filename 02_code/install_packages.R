# instalasi
rm(list=ls())
pakets = installed.packages()
pakets_needed = c("dplyr","tidyr","readxl","janitor","openxlsx","stringr",
                  "knitr","checkmate","htmlwidgets","htmltools","htmlTable",
                  "rvest","ggplot2","txtplot","tidytext","reshape2",
                  "readxl","qpdf","ggpubr","ggrepel","ROI","ompr","ompr.roi",
                  "ROI.plugin.glpk","rmarkdown","Ryacas","languageserver","httpgd",
                  "forecast","TTR","tseries","fpp","TSstudio","padr","MLmetrics",
                  "RSelenium","gganimate","av","multidplyr","telegram.bot","telegram")
necessary = setdiff(pakets_needed,pakets)
if(length(necessary) > 0){
  for(i in 1:length(necessary)) install.packages(necessary[i])
} else print("+++ semua libraries sudah ready +++")

rm(list=ls())