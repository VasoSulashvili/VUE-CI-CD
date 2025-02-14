FROM nginx:latest

WORKDIR /usr/share/nginx/html

RUN apt-get update
RUN apt-get install -y nodejs && apt-get install -y npm

COPY . /usr/share/nginx/html
COPY ./default.conf /etc/nginx/conf.d/default.conf

#User and group for non-root
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID vs && useradd -m -u $UID -g vs vs

WORKDIR /usr/share/nginx/html/app

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]