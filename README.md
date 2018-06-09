# 3APA3A 3proxy tiny proxy server
[![](https://images.microbadger.com/badges/image/crims0n/3proxy.svg)](https://microbadger.com/images/crims0n/3proxy "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/crims0n/3proxy.svg)](https://microbadger.com/images/crims0n/3proxy "Get your own version badge on microbadger.com")
## Deploy 3proxy
```sh
docker run --name 3proxy -p 8080:8080 -p 1080:1080 -d crims0n/3proxy
```
## Deploy 3proxy and apply your own configuration
```sh
docker run --name 3proxy -p 8080:8080 -p 1080:1080 -v /data/3proxy.cfg:/etc/3proxy.cfg -d crims0n/3proxy
```
