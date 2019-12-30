FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER Daniel Wiltshire

WORKDIR /mnt/data

ADD https://papermc.io/api/v1/paper/1.15.1/latest/download paperclip.jar

RUN apt-get update && apt-get install --no-install-recommends --yes openjdk-11-jre-headless

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 25565/tcp

ENTRYPOINT java -jar -Xms2G -Xmx2G -Dcom.mojang.eula.agree=true /mnt/data/paperclip.jar
