RUN echo "Hello docker&Jenkins!"

EXPOSE 8081

FROM ubuntu

docker build -t="AzureDemo"

