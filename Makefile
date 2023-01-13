DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

DATA_PATH			= /home/anhigo-s/data

# DATABASE VOLUME
DB_PATH				= $(DATA_PATH)/db/

# WORDPRESS VOLUME
WP_PATH				= $(DATA_PATH)/wp/

####################################################################################################
########################################## Default Rules ###########################################
####################################################################################################

all: start

re: fclean all

clean: stop
	@ docker system prune -a --force

fclean: clean
	@ rm -rf $(DATA_PATH)

start:
	@ mkdir -p $(DB_PATH) $(WP_PATH)
	@ grep -qxF '127.0.0.1 anhigo-s.42.fr' /etc/hosts || echo '127.0.0.1 anhigo-s.42.fr' >> /etc/hosts
	@ docker-compose -f $(DOCKER_COMPOSE_PATH) up --build

stop:
	@ docker-compose -f $(DOCKER_COMPOSE_PATH) down

ava:
	sudo bash ./srcs/requirements/tools/clean.sh

.PHONY: all start stop clean fclean re ava

####################################################################################################
####################################################################################################
####################################################################################################
