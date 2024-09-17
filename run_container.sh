# jalan di root tanpa autentifikasi
docker run --rm -p 8888:8787 -d --name ccc \
           -e USER=ikanx101 \
           -e PASSWORD=ikanx101 \
           -e DISABLE_AUTH=true \
           -e USERID=1001 \
           -e GROUPID=1001 \
           -e ROOT=TRUE \
           -v /home/ikanx101:/root ikanx101/r-custom:latest

# jalan docker standalone firefox
docker run -d -p 4445:4444 --name selesele selenium/standalone-firefox:4.8.0-20230123

# cek docker stats
docker stats
