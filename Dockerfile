FROM nodejs:10

ARG _NEXUS_USER
ARG _NEXUS_PASS
ARG _NEXUS_NPM_REGISTRY

ENV NEXUS_USER=$_NEXUS_USER
ENV NEXUS_PASS=$_NEXUS_PASS
ENV NEXUS_NPM_REGISTRY=$_NEXUS_NPM_REGISTRY

RUN mkdir -p /home/node/api/node_modules

WORKDIR /home/node/api

COPY package*.json ./

RUN npm config set _auth $(echo -n "$NEXUS_USER:$NEXUS_PASS" | openssl base64)
RUN npm config set registry $NEXUS_NPM_REGISTRY
RUN npm config set strict-ssl false
RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

