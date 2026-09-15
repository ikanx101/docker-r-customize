docker run -p 8888:8787 -d --name RStudio\
           -e USER=rstudio \
           -e PASSWORD=ikanx101 \
	    -e DISABLE_AUTH=true \
	    -e USERID=1001 \
           -e GROUPID=1001 \
           -e ROOT=TRUE \
           --restart unless-stopped \
           -v /Users/ikanx101/Documents/:/home/rstudio ikanx101/r-custom:latest
