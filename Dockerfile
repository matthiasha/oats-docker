FROM ubuntu:rolling
MAINTAINER hafner87@gmail.com

RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes  # causes problems with command-not-found
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server supervisor python tmux zsh git vim build-essential python-dev sudo rsync psmisc nmap net-tools tcpdump iputils-ping locales
# lxml and other Python package deps
RUN apt-get install -y libxml2-dev libxslt1-dev libffi-dev libssl-dev zlib1g-dev
# dev tools
RUN apt-get install -y valgrind command-not-found man-db python3-venv python3-dev libffi-dev libpcap-dev
RUN printf "y\ny\n" | unminimize

# NodeJS
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
#RUN apt-get install -y nodejs

RUN locale-gen en_US.UTF-8
RUN update-locale
ENV LANG en_US.UTF-8

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/run/sshd
RUN sed -i "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config  # PAM stops me from logging in

RUN wget https://get.docker.com/ -O /tmp/docker.sh
RUN sh /tmp/docker.sh
RUN echo "Port 2222" >> /etc/ssh/sshd_config

RUN apt-get install -y pandoc texlive-xetex   # Jupyter PDF creation
RUN apt-get install -y libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config  # aiortc deps

# pyenv build deps 
RUN apt-get install -y build-essential curl libbz2-dev libffi-dev liblzma-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxmlsec1-dev llvm make tk-dev wget xz-utils zlib1g-dev

RUN echo ALL ALL=(ALL) NOPASSWD:ALL >> /etc/sudoers  # password-less sudo for all users

COPY entrypoint.py /entrypoint.py
ENTRYPOINT ["/usr/bin/python3", "/entrypoint.py"]
