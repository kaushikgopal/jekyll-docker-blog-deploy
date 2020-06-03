FROM jklgg/blog-build:0.3
LABEL maintainer "Kaushik Gopal <c@jkl.gg>"

RUN apk add --no-cache musl-dev

###############################################################################
# Environment variables
###############################################################################

ENV NODE_VERSION 12.18.0
ENV YARN_VERSION 1.22.4
ENV NODE_HOME /usr/local
RUN mkdir -p $NODE_HOME/node_modules && chmod 777 $NODE_HOME/node_modules

ENV JEKYLL_DATA_DIR=/srv/jekyll
RUN mkdir -p $JEKYLL_DATA_DIR && chmod 777 $JEKYLL_DATA_DIR

ENV PATH $NODE_HOME/node_modules:$PATH


###############################################################################
# Install firebase
###############################################################################
# TODO: should use /usr/local/node_modules for caching
RUN npm install --prefix $NODE_HOME firebase-tools@7.10.0 --unsafe-perm --verbose


WORKDIR /srv/jekyll

CMD bundle exec jekyll build && \
    $NODE_HOME/node_modules/firebase-tools/lib/bin/firebase.js --version
