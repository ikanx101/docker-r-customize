sudo apt-get install ca-certificates curl gnupg -y


# Command to run the container

docker run --rm -p 8888:8787 \
           -e USER=ikanx101 \
           -e PASSWORD=ikanx101 \
           -e USERID=1001 \
           -e GROUPID=1001 \
           ikanx101/r-custom:latest
