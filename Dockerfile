FROM ruby:2.6.4-slim

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    sudo \
    build-essential \
    sqlite3 \
    libsqlite3-dev \
    git-core 

ENV LANG=C.UTF-8
ENV GEM_HOME=/bundle
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH
ENV BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH=$BUNDLE_BIN:$PATH

RUN mkdir -p $BUNDLE_PATH
RUN mkdir /code

RUN gem update --system

WORKDIR /code

COPY . ./

CMD ["/bin/bash"]

