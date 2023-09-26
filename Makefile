#
# Makefile for siderDB project
#

SHELL    := bash
PID_FILE := /var/siderdb.pid

.DEFAULT_GOAL := help

.PHONY: help

help:
	@echo ""
	@echo "==> Manage application"
	@echo "update_cpanlib   Install CPAN libs"
	@echo "update           Update and deploy"
	@echo "server           Start demo application server"
	@echo "hup              Restart demo application server"
	@echo "dependencies     List (most) CPAN dependencies"
	@echo ""
	@echo "==> Manage containers"
	@echo "up               Start containers"
	@echo "stop             Stop containers"
	@echo "down             Remove containers"
	@echo "restart          Restart containers"
	@echo "build            Rebuild containers"
	@echo ""
	@echo "==> Container internal commands"
	@echo "app-shell        Open a shell in the app container"
	@echo "app-update       'make update' inside the app container"
	@echo "app-hup          'make hup' inside the app container"
	@echo "app-restart      'make update & make hup' inside the app container"
	@echo "app-prove        'prove' inside the app container"
	@echo ""

# Manage application

.PHONY: update_cpanlib update server hup server-stop dependencies

update_cpanlib:
	@cpanm --quiet --notest --installdeps .

update: update_cpanlib

server: update
	@perl -Ilib script/siderdb_server.pl --port=5000 --pidfile=$(PID_FILE)

hup:
	@kill -HUP $$(cat $(PID_FILE));

server-stop:
	@kill $$(cat $(PID_FILE));

dependencies:
	@find . -type f -exec awk '/^use / {gsub(";","");print $$2}' '{}' \; \
		| grep -v siderDB \
		| sort -u

# Manage containers

.PHONY: up stop down restart build

up:
	@docker-compose up -d

stop:
	@docker-compose stop

down:
	@docker-compose down

restart: stop up

build:
	@docker-compose build

# Container internal commands

.PHONY: app-shell app-update app-hup app-server-stop app-server app-restart app-prove

app-shell:
	@docker-compose exec app bash

app-update:
	@docker-compose exec app make update

app-hup:
	@docker-compose exec app make hup

app-server-stop:
	@docker-compose exec app make server-stop

app-server:
	@docker-compose exec app make server

app-restart: app-update app-hup

app-prove:
	@docker-compose exec app prove -lvr $(filter-out app-prove,$(MAKECMDGOALS))
