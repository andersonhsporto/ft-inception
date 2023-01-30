# ft_inception

## Description

This project is about setting up a complete web server. It must run multiples services: Wordpress, Mariadb, and nginx. To do this, you will need to use Docker and docker-compose. You will also need to make sure that your SQL database works with the WordPress.

## Objectives

- Docker
- Docker-compose
- System administration
- Web stack

## Instructions

To run this project, you will need Docker and docker-compose installed on your machine.

### Usage

To run the project, you will need to run the following command:

```make all
```

This will build the images and run the containers.

To stop the containers, you will need to run the following command:

```make stop
```

To delete the containers, you will need to run the following command:

```make clean
```

To delete the containers and images, you will need to run the following command:

```make fclean
```

To rebuild the images, you will need to run the following command:

```make re
```

## Docker

Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating-system kernel and are thus more lightweight than virtual machines. Containers are created from images that specify their precise contents. Images are often created by combining and modifying standard images downloaded from public repositories.

## Docker-compose

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. To learn more about all the features of Compose see the list of features.
