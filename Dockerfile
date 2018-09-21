FROM ubuntu:rolling
MAINTAINER hafner87@gmail.com

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y openssh-server supervisor python tmux zsh git vim build-essential python-dev sudo mosh libc6:i386 libncurses5:i386 libstdc++6:i386
# lxml and other Python package deps
RUN apt-get install -y libxml2-dev libxslt1-dev libffi-dev libssl-dev zlib1g-dev libasound2:i386
# dev tools
RUN apt-get install -y valgrind
RUN apt-get install -y command-not-found man-db
RUN apt install python3-venv
RUN apt install python3-dev libffi-dev libpcap-dev  # comms deps
RUN echo y |unminimize

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install -y nodejs

ENV LANG C.UTF-8

RUN mkdir /Users
RUN useradd -ms /bin/zsh -u 768 -d /Users/mzhafn mzhafn
RUN addgroup mzhafn sudo

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8888 9999
RUN mkdir -p /var/run/sshd
RUN sed -i "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config  # PAM stops me from logging in

VOLUME /Users/mzhafn

CMD ["/usr/bin/supervisord"]
