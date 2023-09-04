# ft_inception

## Description

This project is about setting up a complete web server. It must run multiples services: Wordpress, Mariadb, and nginx. To do this, you will need to use Docker and docker-compose. You will also need to make sure that your SQL database works with the WordPress.

## Objectives

- Docker
- Docker-compose
- System administration
- Web stack

## Structure

In the image below, you can see the structure of the project:

<p align="center">
<img src="https://user-images.githubusercontent.com/47704550/224850772-5fc7b9a7-c680-4eda-87f1-e46ffb9e9284.png" width="600px" alt="struct"/><br>
</p>

## Services

### Wordpress

WordPress is a free and open-source content management system written in PHP and paired with a MySQL or MariaDB database. Features include a plugin architecture and a template system, referred to within WordPress as Themes.

### MariaDB

MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system (RDBMS), intended to remain free and open-source software under the GNU General Public License. Development is led by some of the original developers of MySQL, who forked it due to concerns over its acquisition by Oracle Corporation in 2009.

### Nginx

Nginx is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. The software was created by Igor Sysoev and first publicly released in 2004. A company of the same name was founded in 2011 to provide support and Nginx plus paid software.

## Ports

| Service     | Port | Exposed |
| ----------- | ---- | ------- |
| Wordpress   | 8080 | no      |
| MariaDB     | 3306 | no      |
| Nginx (SSL) | 443  | yes     |


## Instructions

To run this project, you will need Docker and docker-compose installed on your machine.

### Usage

To run the project, you will need to run the following command:

```bash
	make all
```

This will build the images and run the containers.

To stop the containers, you will need to run the following command:

```bash
	make stop
```

To delete the containers, you will need to run the following command:

```bash
	make clean
```

To delete the containers and images, you will need to run the following command:

```bash
	make fclean
```

To rebuild the images, you will need to run the following command:

```bash
	make re
```

## Docker

Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. All containers are run by a single operating-system kernel and are thus more lightweight than virtual machines. Containers are created from images that specify their precise contents. Images are often created by combining and modifying standard images downloaded from public repositories.

## Docker-compose

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. To learn more about all the features of Compose see the list of features.
