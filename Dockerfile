FROM archlinux/base:latest

RUN pacman -Syu --noconfirm
RUN pacman -Syu --noconfirm texlive-langjapanese
#texlive-most
RUN pacman -Syu --noconfirm pandoc pandoc-crossref otf-ipafont

WORKDIR /root
