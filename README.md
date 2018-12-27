# ctf-kujira
Docker image for CTFer.

## How To Use
### Dependencies
* python 3
* docker
* docker-compose
* bash or zsh

### Install (Linux)
```sh
$ wget https://raw.githubusercontent.com/akakou/ctf-kujira/master/script/install.py
$ install.py
```
### Run
```sh
$ kujira
$ kujira filename     # run kujira and copy file to volume
$ kujira -m filename  # run kujira and move file to volume
```

### Uninstall (Linux)
```sh
$ wget https://raw.githubusercontent.com/akakou/ctf-kujira/master/script/uninstall.py
$ uninstall.py
```

## Installed Package 
> * bash
> * git
> * vim
> * coreutils
> * binutils
> * zip
> * python2 & 3
> * pip2 & 3
> * ipython2 & 3
> * netcat
> * socat
> * nmap
> * tcpdump
> * curl
> * wget
> * gcc
> * clang
> * llvm
> * php-cli
> * nasm
> * qemu
> * radare2
> * ltrace
> * strace
> * gdb
> * foremost
> * volatility
> * binwalk
> * zip
> * hashid
> * scapy
> * pwn-tools
> * rp++
> * exgdb (peda, pwngdb included)
