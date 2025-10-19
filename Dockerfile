FROM ubuntu:questing

ENV PATH=/usr/local/gauche/bin:$PATH
ENV GAUCHE_VERSION=0.9.15

WORKDIR /root
RUN apt update -y && apt install -y wget make build-essential libgdbm-dev zlib1g-dev texinfo
RUN wget https://github.com/shirok/Gauche/releases/download/release0_9_15/Gauche-$GAUCHE_VERSION.tgz && tar -xf Gauche-$GAUCHE_VERSION.tgz
RUN cd Gauche-$GAUCHE_VERSION && ./configure --prefix=/usr/local/gauche && make && make install
RUN gosh -V
