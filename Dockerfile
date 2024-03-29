FROM node:16
WORKDIR /home
RUN apt-get update -y
RUN apt-get install git -y
RUN git init
RUN  git clone https://github.com/chandankumar-010101/infrastructure-engineer-technical-task.git
WORKDIR /home/infrastructure-engineer-technical-task/application
ENTRYPOINT  npm install &&  npm run start:dev
EXPOSE 3000
VOLUME ["/ my-volume"]
