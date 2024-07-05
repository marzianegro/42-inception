# Inception

## Overview
Inception is a project designed to introduce students to the world of system administration and infrastructure management using Docker. The goal is to set up a small infrastructure composed of different services under specific constraints.

## Table of Contents
- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)

## Project Overview
Inception aims to deepen your understanding of system and network administration using containerization technologies. The project involves setting up various services such as a web server, a database server, and others, each running in its own Docker container. These services will communicate with each other to form a cohesive system.

## Objectives
- Learn to use Docker to create and manage containers.
- Set up a network of containers that interact with each other.
- Configure and secure various services.
- Understand and apply concepts of system and network administration.

## Technologies Used
- **Docker**: To create and manage containers.
- **NGINX**: As a web server.
- **MariaDB**: As a database server.
- **WordPress**: For setting up a dynamic website.
- **PHP-FPM**: For handling PHP processes.
- **OpenSSL**: To secure connections using TLS/SSL.

## Project Structure
```
inception/
│
├──Makefile
└──srcs/
 	├── docker-compose.yml
    ├──.env
    └── requirements/
        ├── mariadb/
        ├── nginx/
        ├── tools/
        └── wordpress/
```

## Getting Started

### Prerequisites
Before you begin, ensure you have the following installed:

- Docker
- Docker Compose

### Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/marzianegro/42-inception.git
   cd 42-inception
   ```

2. **Set up the environment variables:**
   Edit the `.env` file to configure your environment variables. This includes setting up database credentials, domain names, and other configurations.

### Usage
1. **Build and start the containers:**

   ```sh
   make up
   ```

2. **Access the services:**
   - Open your web browser and navigate to the domain specified in your `.env` file to access the WordPress site.
   - Use the database credentials to connect to the MariaDB server.

3. **Stop the containers:**
   ```sh
   make down
   ```
