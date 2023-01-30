DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

DATA_PATH			= /home/anhigo-s/data

####################################################################################################
########################################## Volume Paths ############################################
####################################################################################################


DB_PATH				= $(DATA_PATH)/db/

WP_PATH				= $(DATA_PATH)/wp/

####################################################################################################
########################################## Default Rules ###########################################
####################################################################################################

# Create the data volumes folder and start the containers
all:
	@ mkdir -p $(DB_PATH) $(WP_PATH)
	@ grep -qxF '127.0.0.1 anhigo-s.42.fr' /etc/hosts || echo '127.0.0.1 anhigo-s.42.fr' >> /etc/hosts
	@ docker-compose -f $(DOCKER_COMPOSE_PATH) up --build

# Stop the containers and remove images and networks
clean: stop
	@ docker system prune -a --force

# Remove the data volumes folder
fclean: clean
	@ rm -rf $(DATA_PATH)

# Stop the containers, remove images and networks and recreate the data volumes folder
re: fclean all


# Stop the containers
stop:
	@ docker-compose -f $(DOCKER_COMPOSE_PATH) down


# Clean all previus containers, images and networks
ava:
	sudo bash ./srcs/requirements/tools/clean.sh

####################################################################################################
####################################################################################################
####################################################################################################

.PHONY: all stop clean fclean re ava

####################################################################################################
####################################################################################################
####################################################################################################
