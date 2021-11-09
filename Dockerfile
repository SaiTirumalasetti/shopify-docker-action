# Container image that runs your code
FROM node:14.18-alpine

RUN git clone https://github.com/nicolasalliaume/shopify-cli
RUN .shopify-cli/cli.js

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 entrypoint.sh
RUN apt-get -y update && apt-get -y upgrade

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
