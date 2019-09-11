FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386
# apt-get install
RUN apt-get update && apt-get install -y \
    git vim coreutils binutils zip \
    python python3 \
    python-pip python3-pip \
    ipython ipython3 \
    netcat socat nmap tcpdump curl wget \
    gcc clang llvm php-cli nasm qemu \
    radare2 ltrace strace gdb \
    foremost volatility binwalk zip \
    libc6:i386 libncurses5:i386 libstdc++6:i386
# pip install
RUN pip install hashid scapy pwn libformatstr && \
    pip3 install hashid scapy libformatstr
# rp ++
RUN wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x64 \
    && wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x86 \
    && chmod +x rp-lin-x64 rp-lin-x86 \
    && mv rp-lin-x64 rp-lin-x86 /usr/local/bin
# exgdb
WORKDIR /root
RUN git clone https://github.com/miyagaw61/exgdb \
    && cd ./exgdb \
    && ln -s $(realpath exgdbctl) /usr/local/bin/exgdbctl \
    && exgdbctl install expeda \
    && exgdbctl install Pwngdb \
    && echo "source $(realpath gdbinit.py)" >> /root/.gdbinit

# add volume
RUN mkdir volume
WORKDIR /root/volume
CMD ["bash", "--version"]

