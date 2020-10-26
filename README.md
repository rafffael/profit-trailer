ProfitTrailer for Docker
------------------------

**ProfitTrailer** is a smart crypto currency trading bot. It gives you the ability to trade using different exchanges in a fast and simple way.
For easier deployment, I set up a *Docker Container*.

For more information about ProfitTrailer :

 - Official website : https://profittrailer.com
 - Wiki : https://wiki.profittrailer.io
 - Github : https://github.com/taniman/profit-trailer

Usage
-----

Start a new container with a volume for your config files

    docker run -d --name profittrailer -p 8081:8081 lucasconde/profit-trailer:latest for latest production image
    docker run -d --name profittrailer -p 8081:8081 lucasconde/profit-trailer:x.x.x for specific image
    docker run -d --name profittrailer -p 8081:8081 lucasconde/profit-trailer:dev for development image

[![Docker Stars](https://img.shields.io/docker/stars/lucasconde/profit-trailer.svg)](https://hub.docker.com/r/lucasconde/profit-trailer/)
[![Docker Pulls](https://img.shields.io/docker/pulls/lucasconde/profit-trailer.svg)](https://hub.docker.com/r/lucasconde/profit-trailer/)
