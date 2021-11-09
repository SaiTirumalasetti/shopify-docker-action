# Container image that runs your code
FROM ruby:alpine3.14

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN gem update shopify-cli
RUN chmod 777 entrypoint.sh
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["shopify"]
CMD ["version"]
