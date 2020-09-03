FROM nodejs:10

RUN npm config set registry https://10.58.3.133/repository/digital-npm-group/

RUN if $http_proxy; then npm config set proxy=$http_proxy; fi
RUN if $http_proxy; then npm config set https-proxy=$http_proxy; fi
RUN if $http_proxy; then npm config set strict-ssl false; fi

RUN npm config set _auth $(echo -n "digital:changeme" | base64)
RUN npm config set always-auth true

RUN npm config set strict-ssl false

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]

