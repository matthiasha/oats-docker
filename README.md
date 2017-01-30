# perso-ubu
personal ubuntu docker setup

* run: `docker pull matthias87/perso-ubu; docker run -d -h ubu-dev -p 0.0.0.0:2222:22 -p 0.0.0.0:8888:8888 -v /dockerhome:/home/mzhafn matthias87/perso-ubu`
 * -h hostname
 * -p port forward
 * -v volume mapping: SSH (22), Jupyter (8888)
* set password: `docker exec -it 8a6c0aea297f passwd mzhafn`
