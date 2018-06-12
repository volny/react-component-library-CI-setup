FROM node:8

ENV PATH /app/node_modules/.bin:$PATH

RUN mkdir /app
WORKDIR /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -yy -qq

COPY yarn.lock package.json ./

COPY lib ./lib

RUN yarn install --pure-lockfile --ignore-scripts

COPY . ./
