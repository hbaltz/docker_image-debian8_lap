# Docker image: rpi-lap

* [Docker hub repository](https://hub.docker.com/r/hbaltz/rpi-lap/)

## Description

Official Debian 8 (debian:8) + apache2 + php5 docker image with some customization:
* mod_rewrite apache2 module enabled
* DocumentRoot set to /var/www/public
* /etc/apt/sources.list modified to include jessie-updates and to use Polish mirror by default
* WORKDIR set to /var/www/
* ENTRYPOINT set to autostart apache2 service

## Usage

### Create the folder
```
mkdir <path_to_your_datadir>/public
```

### Pull the git repositories
```
git pull <path-to-your-repo-git>
```

### Place the website source at the right place
```
cd <path-to-your-folder-git>/src

cp -R ./ <path_to_your_datadir>/public
```

### Run the image

There are two main run-time settings that may need to be passed to newly created container from this image:
* Container provides HTTP service on port 80. If you want this port to be published on host interfaces add `-p 80:80` to your `docker run` statement
* There is no VOLUME statement in Dockerfile, so data volume must be attached when starting container by adding `-v <path_to_your_datadir>:/var/www/` to your `docker run` statement

## Example

To successfully start a new container using this image please specify port (here port 80) and volume options as in following example:
`docker run -dp 80:80 -v <path_to_your_datadir>:/var/www/ --name <your-app-name> hbaltz/rpi-lap`

## Summary

This docker image is best suited for simple PHP applications that do not require database backend. It works well not only with simple PHP websites, but also with ie. Laravel framework (just mount your project under /var/www).

Should you need to use a database backend (like MySQL or Postgres) with your project, please see my other docker images!
