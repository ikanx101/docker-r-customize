# _Official_ ikanx101.com R Studio Server Dockerfile

_Repository_ ini berisi _setting_ awal saya membuat _Docker container_ untuk R Studio Server.

Untuk menginstall Docker di Ubuntu, silakan _refer_ ke situs [ini](https://docs.docker.com/engine/install/ubuntu/). 

## Cara membuat _container_

Berikut adalah langkah-langkahnya:

- Buat dan modifikasi _file_ `Dockerfile`. Saya memasukan beberapa _presets_ seperti ini:
    - Versi __R__ terbaru.
    - _Libraries_ linux untuk _web scrape_ dan GLPK.
    - _Libraries_ __R__ yang sering saya pakai.
- Setelah itu kita _login_ ke _Docker server_ dengan perintah berikut:

```
docker login
```

- Lalu kita buat _container_-nya dengan perintah berikut:

```
docker build -t ikanx101/r-custom . 
```

- Lalu kita akan upload _container_ ini ke _Docker server_ agar orang lain bisa menikmatinya juga.

```
sudo docker tag ikanx101/r-custom:latest ikanx101/r-custom:latest
sudo docker push ikanx101/r-custom:latest
```

## Cara _run container_

Setelah ada di _Docker server_, kita bisa menggunakan _container_ tersebut di mesin mana saja dengan cara buka _Docker_ dan berikan perintah berikut:

```
# melakukan pull request dari Docker server
docker pull ikanx101/r-custom:latest

# run container
docker run --rm -p 8888:8787 -d \
           -e USER=ikanx101 \
           -e PASSWORD=ikanx101 \
           -e USERID=1001 \
           -e GROUPID=1001 \
           ikanx101/r-custom:latest 
```

Jangan lupa mengganti _username_ dan _password_ sesuai dengan kebutuhan.

---  

# Cara Run _Container_ Selain __R Studio Server__

## _Firefox Only_

```
docker pull selenium/standalone-firefox
docker run -d -p 4445:4444 standalone-firefox:2.53.0

# update per 21 Juni
# firefox nya harus downgrade agar bisa dipakai
docker pull selenium/standalone-firefox:4.8.0-20230123
docker run -d -p 4445:4444 selenium/standalone-firefox:4.8.0-20230123

```

Ini untuk memanggilnya di __R__:

```
library(rvest)
library(RSelenium)
remote_driver = remoteDriver(remoteServerAddr = "localhost", port = 4445L, browserName = "firefox")
remote_driver$open()
```

## Untuk Menghubungkan Dua _Containers_

Biasa digunakan untuk `mesin` yang tidak mau di-_install_ __R__ ke _local_.

```
docker run -d -p 4445:4444 --name myselcontainer selenium/standalone-firefox

# versi full
docker run -ti --rm -p 8888:8787 --link=myselcontainer \
           -e USER=ikanx101 \
           -e PASSWORD=ikanx101 \
           -e USERID=1001 \
           -e GROUPID=1001 \
           ikanx101/r-custom:latest
           
# versi simple di windows
# username: rstudio
docker run --rm -p 8888:8787 --link=myselcontainer -e PASSWORD=ikanx101 ikanx101/r-custom:latest

```

Ini yang harus dimasukkan ke dalam RScript-nya:

```
library(rvest)
library(RSelenium)
remote_driver = remoteDriver(remoteServerAddr = "myselcontainer", 
                             port = 4444L, browserName = "firefox")
remote_driver$open()
```
