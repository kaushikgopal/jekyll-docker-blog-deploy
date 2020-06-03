Available on docker-hub
https://hub.docker.com/repository/docker/jklgg/blog-deploy

Run this locally like so:

    docker run --rm -v="$PWD:/srv/jekyll" -it jklgg/blog-deploy:0.1

# Adapted from:

* https://github.com/docker-library/ruby/blob/a564feaaee4c8647c299ab11d41498468bb9af7b/2.7/alpine3.11/Dockerfile
* https://github.com/nodejs/docker-node/blob/master/12/alpine3.11/Dockerfile
* https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile
* https://kaush.quip.com/ccxYAW933asG/Docker-Jekyll



# Upgrading dependencies

* Update the Gemfile
* bundle install
* docker build --tag jklgg/blog-build:X.X --file Dockerfile .
