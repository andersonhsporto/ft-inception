######################################################################
############################ BASE IMAGE  #############################
######################################################################

FROM debian:buster

######################################################################
########################### INSTALL NGINX  ###########################
######################################################################

RUN apt-get update && apt-get upgrade -y

RUN	apt-get install -y nginx

RUN rm -rf /var/lib/apt/lists/*

######################################################################
########################### CONFIGURATION ############################
######################################################################

# Certificate
COPY conf/certificate /etc/ssl/certificate

COPY conf/anhigo-s.conf /etc/nginx/sites-available/anhigo-s

# Create symbolic link from sites-available to sites-enabled 
RUN ln -s /etc/nginx/sites-available/anhigo-s /etc/nginx/sites-enabled/anhigo-s

# Remove index HTML file
RUN	rm /var/www/html/index.nginx-debian.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
