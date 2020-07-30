# ProfitTrailer for Docker

**ProfitTrailer** is a smart crypto currency trading bot. It gives you the ability to trade using different exchanges in a fast and simple way.
For easier deployment, I set up a *Docker Container*.

For more information about ProfitTrailer :

 - Official website : https://profittrailer.com
 - Wiki : https://wiki.profittrailer.io
 - Github : https://github.com/taniman/profit-trailer
 - Original: https://github.com/rafffael/profit-trailer

## Usage

Build docker image for ProfitTrailer from dir with Dockerfile

```bash
$ docker build -t profit-trailer .
```

Create new dir for ProfitTrailer files

```bash
$ mkdir /var/opt/profittrailer1
```

Copy updatePT file to new dir and chmod

```bash
$ chmod +x updatePT
```

Run updatePT

```bash
$ ./updatePT
```

Start a new container and point volume to new dir 

```bash
$ docker run -d --restart=always --name profittrailer1 -p 8090:8081 -v /var/opt/dockerpt1:/app/ProfitTrailer profit-trailer
```

Optionally setup Nginx as proxy and enable TLS

```bash
server {

    listen 443 ssl;
    server_name pt.yourdomain.com;

    ssl_certificate           /etc/letsencrypt/live/pt.yourdomain.com/cert.pem;
    ssl_certificate_key       /etc/letsencrypt/live/pt.yourdomain.com/privkey.pem;

    ssl on;
    ssl_session_cache  builtin:1000  shared:SSL:10m;
    ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;
    ssl_prefer_server_ciphers on;


    location / {

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Connection keep-alive;
        proxy_read_timeout  90;
  
        proxy_pass         http://localhost:8090;

        proxy_redirect      http://localhost:8090 https://pt.yourdomain.com;

    }
}
```

## Update

Stop Docker container

```bash
$ docker stop profittrailer1
```

Run updatePT

```bash
$ ./updatePT
```

Start Docker container

```bash
$ docker start profittrailer1
```

## Misc

Check logs

```bash
$ docker logs profittrailer1 -f
```

Get shell in running container

```bash
$ docker exec -it profittrailer1 sh
```


