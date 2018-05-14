FROM node:7.10.1-slim

WORKDIR /app/client

ENV PATH /app/client/node_modules/.bin:$PATH

ENV TZ Asia/Tokyo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq  \
&& apt-get install -y git \
&& rm -rf /var/lib/apt/lists/*

COPY package.json /app/client/package.json

RUN npm install --no-progress --registry http://registry.npmjs.org/
