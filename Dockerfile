FROM jenkins
EXPOSE 8081

docker build -t=azuredemo .

RUN echo "Hello docker&Jenkins!"
