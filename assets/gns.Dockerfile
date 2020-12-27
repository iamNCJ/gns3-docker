FROM ubuntu:20.04

EXPOSE 3080

RUN sed -i 's/archive.ubuntu.com/mirrors.bfsu.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:gns3/ppa && \
    apt-get update && \
    apt-get install gns3-server -y

ENTRYPOINT [ "gns3server" ]