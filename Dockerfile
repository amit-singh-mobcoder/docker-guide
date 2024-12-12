FROM ubuntu

RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    apt-get upgrade -y && \
    apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

ENTRYPOINT [ "node","index.js" ]