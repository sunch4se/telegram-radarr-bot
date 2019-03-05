FROM arm64v8/node:alpine
MAINTAINER itsmegb

RUN apk add --update git

RUN mkdir /app && \
    git clone https://github.com/itsmegb/telegram-radarr-bot.git /app

WORKDIR /app

RUN npm install

RUN ln -s /app/config /config

RUN apk del git

VOLUME /config

CMD ["node", "radarr.js"]
