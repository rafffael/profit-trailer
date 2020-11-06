ProfitTrailer for Kubernetes
------------------------

**ProfitTrailer** is a smart crypto currency trading bot. It gives you the ability to trade using different exchanges in a fast and simple way.

For easier deployment, I forked this Docker image and added a Helm chart so I can install multiple PT bots in my K8S/Rancher cluster with SSL offloading out-of-the-box and asumes that you have a valid domain.

For more information about ProfitTrailer :

 - Official website : https://profittrailer.com
 - Wiki : https://wiki.profittrailer.io
 - Github : https://github.com/taniman/profit-trailer
 
 - This repo + Helm chart: https://github.com/connde/profit-trailer
 - Forked from: https://github.com/rafffael/profit-trailer 

Usage
-----

Start a new container with a volume for your config files

- Docker
    
    docker run -d --name profit-trailer -p 8081:8081 lucasconde/profit-trailer:latest for latest production image
    docker run -d --name profit-trailer -p 8081:8081 lucasconde/profit-trailer:x.x.x for specific image

- Kubernetes
    
    If you already have created the namespace remove --create-namespace
    helm install --dry-run --debug --namespace <NAMESPACE_NAME> --create-namespace profit-trailer ./ptchart/ --set ingress.host=<YOUR_DOMAIN>

    Check values.yaml for default/possible values, by default certificate will be created using Let's Encrypt staging.


Please note that I started using Docker Hub starting from version 2.4.34, if you need older versions you need to download the source code and add the version you need.

[![Docker Stars](https://img.shields.io/docker/stars/lucasconde/profit-trailer.svg)](https://hub.docker.com/r/lucasconde/profit-trailer/)
[![Docker Pulls](https://img.shields.io/docker/pulls/lucasconde/profit-trailer.svg)](https://hub.docker.com/r/lucasconde/profit-trailer/)
