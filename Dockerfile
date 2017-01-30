FROM ubuntu:16.10
MAINTAINER hafner87@gmail.com

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y openssh-server supervisor python tmux zsh git vim build-essential python-dev sudo mosh libc6:i386 libncurses5:i386 libstdc++6:i386
# lxml and other Python package deps
RUN apt-get install -y libxml2-dev libxslt1-dev libffi-dev libssl-dev zlib1g-dev libasound2:i386
# dev tools
RUN apt-get install -y valgrind

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN useradd -ms /bin/zsh -u 768 mzhafn
RUN addgroup mzhafn sudo

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8888
RUN mkdir -p /var/run/sshd

VOLUME /home/mzhafn

CMD ["/usr/bin/supervisord"]
