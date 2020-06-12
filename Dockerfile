FROM ubuntu:rolling
MAINTAINER hafner87@gmail.com

RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes  # causes problems with command-not-found
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server supervisor python tmux zsh git vim build-essential python-dev sudo
# lxml and other Python package deps
RUN apt-get install -y libxml2-dev libxslt1-dev libffi-dev libssl-dev zlib1g-dev
# dev tools
RUN apt-get install -y valgrind
RUN apt-get install -y command-not-found man-db
RUN apt-get install -y python3-venv
RUN apt-get install -y python3-dev libffi-dev libpcap-dev  # comms deps
RUN apt-get install -y rsync
RUN printf "y\ny\n" | unminimize

# NodeJS
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
#RUN apt-get install -y nodejs

RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
RUN update-locale
ENV LANG en_US.UTF-8

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/run/sshd
RUN sed -i "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config  # PAM stops me from logging in

RUN wget https://get.docker.com/ -O /tmp/docker.sh
RUN sh /tmp/docker.sh
RUN echo "Port 2222" >> /etc/ssh/sshd_config

RUN apt-get install -y net-tools tcpdump iputils-ping
RUN apt-get install -y pandoc texlive-xetex   # Jupyter PDF creation
RUN apt-get install -y libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config  # aiortc deps

COPY entrypoint.py /entrypoint.py
ENTRYPOINT ["/usr/bin/python3", "/entrypoint.py"]