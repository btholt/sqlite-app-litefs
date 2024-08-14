FROM node:20
RUN apt-get update -y && apt-get install -y ca-certificates fuse3 sqlite3
COPY --from=flyio/litefs:0.5 /usr/local/bin/litefs /usr/local/bin/litefs
COPY docker/etc/litefs.yml /etc/litefs.yml
RUN mkdir /home/node/code
WORKDIR /home/node/code
COPY package-lock.json package.json ./
RUN npm ci
COPY . .
ENTRYPOINT litefs mount
