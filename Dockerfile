FROM ubuntu:latest

ENV DISPLAY=:1
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386

# apt-get install
RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update

RUN apt-get install -y gedit git vim coreutils binutils zip
RUN apt-get install -y python3 python3-pip ipython3
RUN apt-get install -y netcat socat nmap tcpdump curl wget
RUN apt-get install -y gcc clang llvm php-cli nasm qemu
RUN apt-get install -y radare2 ltrace strace gdb foremost binwalk exiftool
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
RUN apt-get install -y default-jre openjdk-11-jdk openjdk-11-jre-headless
RUN apt-get install -y wireshark tilix

# pip install
RUN pip3 install pwn crypto hashid scapy libformatstr yara-python capstone

# rp ++
RUN wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x64 \
    && wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x86 \
    && chmod +x rp-lin-x64 rp-lin-x86 \
    && mv rp-lin-x64 rp-lin-x86 /usr/local/bin

# exgdb
WORKDIR /root
RUN git clone https://github.com/miyase256/exgdb \
    && cd ./exgdb \
    && export EXGDBPATH=$PWD \
    && echo "export EXGDBPATH=$PWD" >> ~/.bashrc \
    && cp -a $EXGDBPATH/bin/exgdbctl /usr/local/bin/ \
    && exgdbctl install peda \
    && exgdbctl install Pwngdb \
    && echo "source $EXGDBPATH/gdbinit.py" >> ~/.gdbinit

# ghidra
RUN curl https://ghidra-sre.org/ghidra_9.2_PUBLIC_20201113.zip -o ghidra.zip \ 
    && unzip ghidra.zip \
    && mv ghidra_* ghidra \
    && chmod +x ghidra/ghidraRun \
    && ln -s /root/ghidra/ghidraRun /usr/local/bin/ghidra

# zaproxy
COPY assets/zaproxy.deb zaproxy.deb
RUN dpkg -i zaproxy.deb

# burp 
RUN curl https://portswigger.net/burp/releases/download -o burpsuite.jar
RUN cp burpsuite.jar /usr/local/bin/burpsuite.jar \
    && echo 'java -jar /usr/local/bin/burpsuite.jar' > /usr/local/bin/burpsuite \
    && chmod +x /usr/local/bin/burpsuite

# voilatility
RUN git clone https://github.com/volatilityfoundation/volatility3 \ 
    && ln -s /root/volatility3/vol.py /usr/local/bin/volatility

# add volume
RUN mkdir volume
WORKDIR /root/volume
CMD ["bash", "--version"]
