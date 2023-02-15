# FROM instruction
docker build -t galihrizki/sample FROM

# RUN instruction
docker build -t galihrizki/run RUN
docker image ls
docker build -t galihrizki/run RUN --progress=plain --no-cache

# CMD instruction
docker build -t galihrizki/cmd cmd
docker create container --name testcmd galihrizki/cmd:latest
docker start testcmd
docker container logs testcmd

# LABEL Instruction
docker build -t galihrizki/label LABEL
docker image inspect galihrizki/label

# ADD Instruction
docker build -t galihrizki/add ADD
docker create container --name testadd galihrizki/add:latest
docker start testadd
docker container logs testadd

# COPY Instruction
docker build -t galihrizki/copy COPY
docker create container --name testcopy galihrizki/copy
docker start testcopy
docker container logs testcopy

# IGNORE instruction
docker build -t galihrizki/ignore IGNORE --no-cache
docker container create --name ignore galihrizki/ignore
docker container start ignore
docker container logs ignore

# EXPOSE instruction
docker build -t galihrizki/expose EXPOSE
docker container create --name expose --publish 8080:8080 galihrizki/expose
docker container start expose

# ENV instruction
docker build -t galihrizki/env ENV
docker container create --name env --env APP_PORT=9090 --publish 9090:9090 galihrizki/env

# VOLUME instruction
docker build -t galihrizki/volume VOLUME
docker image inspect galihrizki/volume
docker container create --name volume --publish 8080:8080 galihrizki/volume
docker container start volume

# WORKDIR instruction
docker build -t galihrizki/workdir WORKDIR
docker container create --name workdir --publish 8080:8080 galihrizki/workdir
docker container start workdir
docker container exec -t -i workdir /bin/sh

# USER instruction
docker build -t galihrizki/user USER
docker container create --name user --publish 8080:8080 galihrizki/user
docker container start user
docker container exec -t -i user /bin/sh
whoami

# ARG instruction
docker build -t galihrizki/arg ARG
docker container create --name arg --publish 8080:8080 galihrizki/arg
docker container start arg
docker container exec -t -i arg /bin/sh

# HEALTHCHECK instruction
docker build -t galihrizki/health HEALTHCHECK
docker container create --name health --publish 8080:8080 galihrizki/health
docker container ls -a

# ENTRYPOINT instruction
docker build -t galihrizki/entry ENTRYPOINT
docker container create --name entry --publish 8080:8080 galihrizki/entry

# MULTI STAGE BUILD INSTRUCTION
docker build -t galihrizki/multi MULTI
docker image ls
docker container create --name multi --publish 8080:8080 galihrizki/multi