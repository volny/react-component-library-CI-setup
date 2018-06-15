FROM node:8

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -yy -qq

# authenticate to npm
RUN echo '//registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN' > ./.npmrc && \
npm config set '@$BUILDKITE_ORGANIZATION_SLUG:registry https://registry.npmjs.org'

COPY yarn.lock package.json ./

RUN mkdir -p lib docs

COPY lib/package.json ./lib
COPY docs/package.json ./docs

# Install dependencies
RUN yarn install --pure-lockfile --ignore-scripts

COPY . ./
