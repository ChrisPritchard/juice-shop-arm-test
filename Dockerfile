# OWASP Juice Shop - An intentionally insecure JavaScript Web Application
FROM            arm32v7/node:12
MAINTAINER      Bjoern Kimminich <bjoern.kimminich@owasp.org>
LABEL version = "5.1.0-SNAPSHOT"

RUN apk update && \
    apk upgrade && \
    apk add git && \
    git clone https://github.com/bkimminich/juice-shop.git
WORKDIR /juice-shop
RUN npm install --production --unsafe-perm

EXPOSE  3000
CMD ["npm", "start"]
