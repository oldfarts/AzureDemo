FROM ubuntu
EXPOSE 8081

RUN echo "Hello docker&Jenkins!"

docker build -t=azuredemo .

