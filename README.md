# perso-ubu
personal ubuntu docker setup

* run: `docker pull matthias87/perso-ubu; docker run -d -h ubu-dev -p 2222:22 -p 8888:8888 -p 60000-60100:60000-60100/udp -v /dockerhome:/Users/mzhafn matthias87/perso-ubu`
 * `-h` hostname
 * `-p` port forward (host:container)
    * SSH (22)
    * Jupyter (8888)
    * Mosh (UDP 60000-60100)
 * `-v` map home folder (host:container)
* set password: `docker exec -it <container-id> passwd mzhafn`
