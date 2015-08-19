FROM iojs

ENV HOME /usr/src/app
RUN useradd --create-home --home-dir $HOME app \
  && chown -R app:app $HOME

WORKDIR /usr/src/app
RUN npm install -g gulp jspm@beta

COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

# ENV JSPM_GITHUB_AUTH_TOKEN

# RUN jspm config registries.github.remote https://github.jspm.io \
#   && jspm config registries.github.auth $JSPM_GITHUB_AUTH_TOKEN \
#   && jspm config registries.github.maxRepoSize 0 \
#   && jspm config registries.github.handler jspm-github
#
# RUN jspm install -y
# RUN jspm install -y github:ceoaliongroo/aurelia-leaflet

CMD [ "gulp", "watch" ]
# CMD [ "npm", "start" ]
EXPOSE 9000
#3000

# docker run -ti -v $PWD/credentials/.jspm:/root/.jspm -v $PWD:/usr/src/app aureliatest_aurelia bash -c 'npm install -g gulp jspm@beta && npm install && jspm install -y'
# docker run -ti -v $PWD/credentials/.jspm:/root/.jspm -v $PWD:/usr/src/app -v $PWD/root:/root aureliatest_aurelia bash -c 'npm install && jspm install -y'
#
# docker run -ti -v $PWD/credentials/.jspm:/root/.jspm -v $PWD:/usr/src/app aureliatest_aurelia bash -c 'npm install && jspm install -y && jspm install github:ceoaliongroo/aurelia-leaflet -y'
# docker run -ti -v $PWD/credentials/.jspm:/root/.jspm -v $PWD:/usr/src/app aureliatest_aurelia bash -c 'npm install && jspm install -y && jspm install -y github:ceoaliongroo/aurelia-leaflet'

# docker run -ti -v $PWD/credentials/.jspm:/root/.jspm local/aurelia-test
