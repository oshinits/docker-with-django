# Docker Django Redis Celery README
This repository provides a Docker setup for running a Django web application with Redis as the message broker and Celery as the task queue.

## Prerequisites
- Docker: Make sure you have Docker installed on your system. You can download and install Docker from the official website: https://www.docker.com

## Getting Started
- Clone the repository:
`> git clone <repository-url>` <br >

- Navigate to the project directory:
`> cd DJANGO-DOCKER` <br >

The following commands will start the Django application, Redis server, and Celery workers in either local or production.

### To start local dev
`> docker-compose up --build` <br >

### To stop local dev
`> docker-compose down -v` <br >

### To start production
`> docker-compose -f docker-compose.prod.yml up --build` <br >

### To spin up containers and run in detach mode
`> docker-compose -f docker-compose.prod.yml up -d` <br >

### To stop production
`> docker-compose -f docker-compose.prod.yml stop` <br >

- Access the Django application:
Open your web browser and visit [http://localhost:8000](http://localhost:8000). You should see the Django application running.

## Configuration
The configuration for Django, Redis, and Celery can be found in the following files:

- Django Settings: DJANGO-DOCKER/myapp/settings/

- You can modify this file to configure your Django application settings, such as database connection, static files, etc.

- Celery Configuration: DJANGO-DOCKER/myapp/celery.py

- This file contains the Celery configuration, including the Redis broker URL and other Celery settings. You can modify it to suit your needs.

- Docker Compose: DJANGO-DOCKER/docker-compose/*.yml

- The Docker Compose file defines the services and their configurations. You can modify this file to change the container names, exposed ports, or other Docker-related settings.

## Running Django Management Commands
To run Django management commands, you can use the following command:

### Local
`> docker-compose run web python manage.py <command>` <br >

For example, to apply database migrations, you can run:

`> docker-compose run web python manage.py migrate` <br >

### Production
`> docker-compose -f docker-compose.prod.yml run web python manage.py <command>` <br >

For example, to apply database migrations, you can run:

`> docker-compose -f docker-compose.prod.yml run web python manage.py migrate` <br >

## Scaling Celery Workers

If you need to scale up the number of Celery workers, you can use the following command:
`> docker-compose -f docker-compose.prod.yml up --scale worker=<number-of-workers>` <br >

For example, to start three Celery workers, you can run:
`> docker-compose -f docker-compose.prod.yml up --scale worker=3` <br >

## Shutting Down

To stop and remove the Docker containers, use the following command:
### Local
`> docker-compose down -v` <br >

### Production
`> docker-compose -f docker-compose.prod.yml down -v` <br >

This will gracefully shut down the Django application, Redis server, and Celery workers.

## License
This project is licensed under the MIT License. Feel free to modify and use it to suit your needs.

## Acknowledgements
This project was inspired by the Django, Redis, and Celery documentation and various community resources.

#### Previous issue with celery and flowers 
`Version of celery not compatible with newest version of python` <br >