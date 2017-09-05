FROM docker.io/ubuntu:16.04

RUN apt-get update && apt-get upgrade

RUN apt-get -y install build-essential gawk bc lib32ncurses5-dev git

RUN apt-get -y install gcc-arm-none-eabi gdb-arm-none-eabi

RUN apt-get -y install minicom curl

RUN curl https://sh.rustup.rs -sSf > rustup.rs

RUN sh rustup.rs -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup update && rustup override set nightly && rustup component add rust-src && cargo install xargo

RUN apt-get -y install usbutils

COPY JLink_Linux_V618d_x86_64.deb /tmp/jlink.deb
RUN dpkg -i /tmp/jlink.deb && rm /tmp/jlink.deb

CMD /bin/bash
