FROM ubuntu:14.04

MAINTAINER Dockerfile

# Update packages
RUN apt-get update -y

#Install python Setuptools
RUN apt-get install -y python python-dev python-setuptools python-software-properties
RUN apt-get install -y libpq-dev  

RUN apt-get install -y build-essential libssl-dev libffi-dev 
 
#Install nginx
RUN apt-get install -y nginx

#Install supervisor to handle uwsgi
RUN apt-get install -y supervisor

#Install pip 
RUN easy_install pip 

# Install uwsgi
RUN pip install uwsgi

# copy the contents of this directory over to the container at location /app
ADD . /home/docker/app

COPY nginx.conf /etc/nginx/sites-available/default
COPY supervisor.conf /etc/supervisor/conf.d/

RUN pip install -r /home/docker/app/requirements.txt

EXPOSE 80
ENTRYPOINT ["supervisord -n"]
