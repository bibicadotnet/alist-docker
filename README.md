# alist-docker
Sửa dòng 19 ở file docker-compose.yml, thay bằng domain bạn muốn sử dụng
```shell
docker-compose up -d --build --remove-orphans --force-recreate
```
Password:
```shell
docker exec -it alist ./alist admin random
```
# Cài đặt file.bibica.net 1 click
```shell
sudo wget --no-check-certificate https://raw.githubusercontent.com/bibicadotnet/alist-docker/main/setup.sh && sudo chmod +x setup.sh && sudo ./setup.sh
```
