# ctf-kujira
Docker image and some tools for CTFer.

## Dependencies
* python3
* docker
* docker-compose
* bash or zsh

## How To Use
### Install (Linux)
```sh
$ wget https://raw.githubusercontent.com/akakou/ctf-kujira/master/script/install
$ python3 install
```
### Run
```sh
$ kujira
$ kujira filename     # run kujira and copy file to volume
$ kujira -m filename  # run kujira and move file to volume
```

### Uninstall (Linux)
```sh
$ wget https://raw.githubusercontent.com/akakou/ctf-kujira/master/script/uninstall
$ python3 uninstall
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
