FROM iojs

ENV HOME /usr/src/app
RUN useradd --create-home --home-dir $HOME app \
  && chown -R app:app $HOME

WORKDIR /usr/src/app
RUN npm install -g gulp jspm@beta

COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

CMD [ "gulp", "watch" ]
EXPOSE 9000
