FROM node:8

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -yy -qq && \

COPY yarn.lock package.json ./

RUN mkdir -p lib
COPY lib ./lib/

RUN yarn install --pure-lockfile --ignore-scripts

COPY . ./
