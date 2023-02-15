<!-- Build Docker FIle -->
Untuk membuat docker image kita memasukan configurasi/perintah tersebut ke file dockerfile
parameter -t digunakan untuk menambahkan nama atau versi

syntax:
docker build -t namakita/namaaplikasi:versi folder-dockerfile

example:
docker build -t glhrzk/app:1.0.0 FROM-Dockerfile
docker build -t glhrzk/app:1.0.0 -t glhrzk/app:latest FROM-Dockerfile
============================

FORM INSTRUCTION
form digunakan untuk mengambil image dari repository, yang digunakan untuk menjalankan/requiredment dari aplikasi kita

instruction Format:
FORM namaImages:version

============================

RUN INSTRUCTION
run adalah instruksi/perintah yang akan dijalankan ke image tersebut, dan akan dijalankan ketika image tersebut dibuat

instruction Format:
RUN command
RUN ['executable', 'argument']

============================

COMMAND INSTRUCTION
adalah instruksi ketika docker containernya dijalankan atau di start

instruction Format:
CMD command param param
CMD ['executable', 'param', 'param']
CMD ['param', 'param']

============================

LABEL INSTRUCTION
digunakan untuk menambah metadata information, metadata adalah informasi tambahan misal seperti namaaplikasi, nama perusahan dsb

instruction Format:
LABEL <key>=<value>
LABEL <key1>=<value1> <key2>=<value2>

============================

ADD INSTRUCTION
digunakan untuk menambahkan file dari source ke dalam destinasi di docker image, jika file yang ditambahkan adalah file archive(zip/rar/tar) maka dia akan otomatis di extract ke folder destination.
perintah add juga bisa mendownload file source dari URL, dan juga mendukung banyak penambahan file sekaligus 

instruction Format:
ADD source destination

============================

COPY INSTRUCTION
digunakan untuk menambahkan file dari source ke dalam destinasi di docker image, berbeda dengan add, copy tidak akan melakukan extract file secara otomatis.
perintah copy juga mendukung banyak penambahan file sekaligus 

instruction Format:
COPY source destination

============================

.dockerignore
saat melakukan COPY / ADD docker akan membaca file .dockerignore pertama kali, .dockerignore sama seperti /gitignore di GIT

dockerignore mendukung ignore folder dan regular expression

============================

EXPOSE INSTRUCTION
digunakan untuk memberitahu bahwa container akan listen port pada nomor dan protocol tertentu

instruction Format:
EXPOSE port (default menggunakan TCP)
EXPOSE port/tcp
EXPOSE port/udp

============================

ENVIRONMENT VARIABLE
instruksi yang digunakan untuk mengubah environment variable, baik itu ketika tahap build atau ketika di tahapa container.

env yang sudah di definisikan/inisialisasi dapat dipanggil dengan sintaks:
${NAMA_ENV}

instruction Format:
ENV key=value
ENV key1=value1 key2=value2

============================

VOLUME INSTRUCTION
merupakan instruksi yang akan membuat volume secara otomatis ketika container dibuat, misalkan di dalam container kita akan menyimpan data, data tersebut bisa kita binding ke volume yang akan kita buat

instruction Format:
VOLUME /lokasi/folder
VOLUME /lokasi1/folder1 /lokasi2/folder2
VOLUME ["/lokasi1/folder1", "/lokasi2/folder2"]

============================

WORKING DIRECTORY INSTRUCTION
adalah instruksi untuk menentukan di directory mana kita akan menjalankan instruksi RUN, CMD, COPY, ADD, ENTRYPOINT.
jika lokasi workdir adalah relative path, maka workdir akan masuk di workdir sebelumnya.

instruction Format:
WORKDIR /app (ini adalah absolute path)
WORKDIR docker (ini adalah relative path, jadi akan berada di path /app/docker)
WORKDIR /home/app

============================

USER INSTRUCTION
digunakan untuk berpindah user, misalkan yang tadinya root ke user glhrzk
karena secara default docker akan menggunakan user root
pastikan sebelum kita berpindah user, user tersebut sudah ada/harus kita buat terlebih dahulu

instruction Format:
USER <user>
USER <user>:<usergroup>

============================

ARGUMENT INSTRUCTION
cara kerjanya sama seperti ENV tetapi ARG digunakan ketika/saat image dibuat
cara mengakses ARG sama seperti ENV:
${NAMA_ARG}

sintaks saat build:
--build-arg key=value

instruction Format:
ARG key (membuat argument variable)
ARG key=value (membuat argument variable, dengan default value)

============================

HEALTH CHECK INSTRUCTION
adalah instruksi yang digunakan untuk memberitahu docker apakah container masih berjalan dengan baik atau tidak, dengan cara mengecek dengan meggunakan perintah health check.

jika didalam image terdapat healtcheck secara otomatis container yang dibuat dari image tersebut akan memiliki status health.

starting (memulai)
healthy (sehat)
unhealthy (tidak sehat / gagal)

instruction Format:
HEALTHCHECK NONE (default, tidak melakukan pengecekan alias disable)
HEALTHCHECK [OPTIONS] CMD command
OPTIONS:
    --interval=DURATION (default 30s)
    --timeout=DURATION (default 30s)
    --start-period=DURATION (default 0s)
    --retries=N (default 3)

============================

ENTRYPOINT INSTRUCTION
digunakan untuk menentukan executable file yang akan dijalankan oleh container.
biasanya entrypoint erat kaitannya dengan CMD
saat membuat CMD tanpa executable file, maka CMD secara otomatis akan menggunakan ENTRYPOINT

instruction Format:
ENTRYPOINT executable param1 param2 (entrypoint pertama)
ENTRYPOINT ["executable", "param1", "param2"] (entrypoint kedua)

saat menggunakan CMD ["param1", "param2"] akan mengakses ke entry point pertama

============================

MULTI STAGE BUILD
saat membuat docker file dari baseimage yang sangat besar, secara otomatis image yang dibuat akan besar juga
oleh karena itu, usahakan menggunakan base image yang kecil yang memang dibutuhkan.

FROM di dockerfile artinya buildstage, di docker mendukung mulit FROM atau builstage, builstage terakhir yang akan jadi rujukan image yang dibuild

contoh kasus:
golang, kita bisa mengcompile filenya terlebih dahulu, lalu hasil dari compilan tersebut di masukan ke image yang akan dibuat
