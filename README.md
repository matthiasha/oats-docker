# oats-docker
OATS Development Environment via Docker

* run: `docker pull matthias87/oats-docker; docker run -d --restart always --network host --privileged -h oats-docker --name oats-docker -v $HOME:$HOME -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp matthias87/oats-docker $HOME $USER $UID`
 * `-h` hostname
 * `--network host --privileged` use host network (SSH will be on port 2222)
 * `-v` map file system (host:container)
 * the host's docker API is made available through `/var/run/docker.sock`
* login: `ssh -p 2222 localhost`
