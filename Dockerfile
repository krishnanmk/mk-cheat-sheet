FROM ubuntu
# FROM: can specify another existing created image above too
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y nginx
RUN rm /var/www/html/*
# Each run command adds a new layer in the image
WORKDIR /var/www/html/
RUN echo "<h1>hello world of docker</h1>" > index.html
# ADD - automaticaly copies file, unzips and removes original tar/zip file
EXPOSE 80
CMD /usr/sbin/nginx -g "daemon off;"
