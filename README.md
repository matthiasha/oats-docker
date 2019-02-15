# perso-ubu
personal ubuntu docker setup

* run: `docker pull matthias87/perso-ubu; docker run -d --restart always --network host --privileged -h ubu-dev -v /opt/home/mzhafn:/Users/mzhafn -v /var/run/docker.sock:/var/run/docker.sock -v /opt/tmp:/tmp matthias87/perso-ubu`
 * `-h` hostname
 * `--network host --privileged` use host network (SSH will be on port 2222)
 * `-v` map file system (host:container)
 * the host's docker API is made available through `/var/run/docker.sock`
* set password: `docker exec -it <container-id> passwd mzhafn`
