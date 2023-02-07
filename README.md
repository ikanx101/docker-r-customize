# _Official_ ikanx101.com R Studio Server Dockerfile

_Repository_ ini berisi _setting_ awal saya membuat _Docker container_ untuk R Studio Server.

## Cara membuat _container_

Berikut adalah langkah-langkahnya:

- Buat dan modifikasi _file_ `Dockerfile`. Saya memasukan beberapa _presets_ seperti ini:
    - Versi __R__ terbaru.
    - _Libraries_ linux untuk _web scrape_ dan GLPK.
    - _Libraries_ __R__ berikut ini:
        - 'dplyr',
        - 'tidyr',
        - 'readxl',
        - 'janitor',
        - 'openxlsx',
        - 'stringr',
        - 'knitr',
        - 'checkmate',
        - 'htmlwidgets',
        - 'rvest',
        - 'ggplot2',
        - 'txtplot',
        - 'tidytext',
        - 'reshape2',
        - 'readxl',
        - 'ggpubr',
        - 'ggrepel',
        - 'ROI',
        - 'ompr',
        - 'ompr.roi',
        - 'ROI.plugin.glpk',
        - 'rmarkdown',
        - 'RSelenium',
        - 'gganimate',
        - 'av'

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
docker run --rm -p 8888:8787 -v /mnt/chromeos/removable/Workstation \
           -e USER=ikanx101 \
           -e PASSWORD=ikanx101 \
           -e USERID=1001 \
           -e GROUPID=1001 \
           ikanx101/r-custom:latest
```

Jangan lupa mengganti _username_ dan _password_ sesuai dengan kebutuhan.

---  

# _Firefox_

```
docker pull selenium/standalone-firefox
docker run -d -p 4445:4444 selenium/standalone-firefox
```

# Untuk Menghubungkan Dua Containers

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
docker run --rm -p 8888:8787 --link=myselcontainer ikanx101/r-custom:latest

```

