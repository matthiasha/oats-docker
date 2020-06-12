# oats-docker
OATS Development Environment via Docker

* Get the latest version: `docker pull matthias87/oats-docker`
* Linux: `docker run -d --restart always --network host --privileged -h oats-docker --name oats-docker -v $HOME:$HOME -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp matthias87/oats-docker $HOME $USER $UID`
* Mac: `docker run -d --restart always -p 2222:2222 -h oats-docker --name oats-docker -v $HOME:$HOME -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp matthias87/oats-docker $HOME $USER $UID`
* Login: `ssh -p 2222 localhost`, default password is `pass`
* Please change the default password using the `passwd` command

Explanation of Docker parameters:
 * `-h` hostname
 * linux only: `--network host --privileged` use host network (SSH will be on port 2222)
 * `-p` map network port (host:container)
 * `-v` map file system (host:container)
 * the host's docker API is made available through `/var/run/docker.sock`
