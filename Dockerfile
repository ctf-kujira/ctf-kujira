FROM ubuntu:artful
# apt-get install
RUN apt-get update && apt-get install -y \
    git vim zsh coreutils binutils zip \
    python python3 \
    python-pip python3-pip \
    ipython ipython3 \
    socat nmap tcpdump curl wget \
    gcc clang llvm php-cli nasm qemu \
    radare2 ltrace strace gdb \
    foremost volatility binwalk zip
# pip install
RUN pip install hashid scapy pwn && \
    pip3 install hashid scapy 
# rp ++
RUN wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x64 \
    && wget https://github.com/0vercl0k/rp/releases/download/v1/rp-lin-x86 \
    && chmod +x rp-lin-x64 rp-lin-x86 \
    && mv rp-lin-x64 rp-lin-x86 /usr/local/bin
# zsh-completions
RUN wget https://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_17.10/amd64/zsh-completions_0.27.0+1.1_amd64.deb \
    && dpkg -i zsh-completions_0.27.0+1.1_amd64.deb
# mgpeda
RUN git clone https://github.com/miyagaw61/exgdb
WORKDIR ./exgdb
RUN yes | ./install.sh
# set zsh
WORKDIR /root/
ENV SHELL /bin/zsh
CMD ["zsh", "--version"]

