# OWASP Juice Shop - An intentionally insecure JavaScript Web Application
FROM            arm32v7/node:12-alpine

RUN apk update && \
    apk upgrade && \
    apk add alpine-sdk && \
    apk add python && \
    git clone https://github.com/bkimminich/juice-shop.git
WORKDIR /juice-shop
RUN npm install --production --unsafe-perm --max-old-space-size=16000

FROM            arm32v7/node:12-alpine
MAINTAINER      Bjoern Kimminich <bjoern.kimminich@owasp.org>
LABEL version = "latest-arm"
WORKDIR /juice-shop

EXPOSE  3000
CMD ["npm", "start"]
