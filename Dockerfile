FROM nodejs:10

USER root

RUN mkdir -p /home/node/api/node_modules

WORKDIR /home/node/api

COPY package.json yarn.* ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

