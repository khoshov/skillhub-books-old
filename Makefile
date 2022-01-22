USERID := $$(id -u)
GROUPID := $$(id -g)

COMPOSE := docker-compose -f docker-compose.yml
DJANGO_CONTAINER := ${COMPOSE} run -u $(USERID):$(GROUPID) --rm django
DJANGO_CONTAINER_ROOT := ${COMPOSE} run --rm django
PYTHON := ${DJANGO_CONTAINER} python
PYTHON_ROOT := ${DJANGO_CONTAINER_ROOT} python
DJANGO := ${PYTHON} manage.py

# Docker-compose commands
build:
	${COMPOSE} build

build_no_cache:
	${COMPOSE} build --no-cache

down:
	${COMPOSE} down

up:
	${COMPOSE} up



init:
	${DJANGO_CONTAINER_ROOT} poetry init

install:
	${DJANGO_CONTAINER_ROOT} poetry add ${package}

show:
	${DJANGO_CONTAINER_ROOT} poetry show

