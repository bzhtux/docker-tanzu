```
     _            _                  _                        
  __| | ___   ___| | _____ _ __     | |_ __ _ _ __  _____   _ 
 / _` |/ _ \ / __| |/ / _ \ '__|____| __/ _` | '_ \|_  / | | |
| (_| | (_) | (__|   <  __/ | |_____| || (_| | | | |/ /| |_| |
 \__,_|\___/ \___|_|\_\___|_|        \__\__,_|_| |_/___|\__,_|
                                                              

```

# about
docker-tanzu is a docker image providing a bunch of tools to manage tanzu clusters. That means creating tanzu clusters (management and workload clusters), interact with those clusters and other tools to write automation scripts


# supported versions

Tanzu docker image provides the following cli tools:

 * curl: **v7.77.0**
 * git: **v2.32.0**
 * helm **v3.6.0**
 * jinja2: **v3.0.1**
 * jq: **v20210212-7320**
 * kubectx: **v0.9.3**
 * kubens **v0.9.3**
 * ldapsearch: **latest**
 * openssl: **v1.1.1k**
 * python **v3.9.5**
 * tanzu **v1.3.1**
 * telnet: **v1.33.1**
 * velero **v1.6.0**
 * yq: **v2.12.2** 

# download

Latest release:

```shell
$ docker pull bzhtux/tanzu:0.1.0
```

For other/old releases:

```shell
$ docker pull bzhtux/tanzu:${tag}
```

[docker hub](https://hub.docker.com/repository/docker/bzhtux/tanzu-tools/tags?page=1&ordering=name)