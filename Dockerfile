FROM node:16.13-alpine3.15

RUN apk --no-cache add --virtual .builds-deps build-base python3

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 4080

CMD [ "node", "app.js" ]