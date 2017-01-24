FROM ubuntu:15.04
MAINTAINER hafner87@gmail.com

RUN apt-get update
RUN apt-get install -y openssh-server supervisor python tmux zsh git vim build-essential python-dev sudo mosh

RUN useradd -ms /bin/zsh -u 768 mzhafn
RUN echo 'mzhafn:mzhafn' | chpasswd
RUN addgroup mzhafn sudo

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8888
RUN mkdir -p /var/run/sshd

CMD ["/usr/bin/supervisord"]
