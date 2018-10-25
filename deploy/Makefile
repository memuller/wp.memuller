include ../.env
# include .env

.PHONY: up down run build wipe

PROD_DC-CMD=docker-compose -f docker-compose.yml -f docker-compose.prod.yml

run:
	cd ../ ; \
	${PROD_DC-CMD} up

up:
	cd ../ ; \
	${PROD_DC-CMD} up --detach

down:
	cd ../ ; \
	${PROD_DC-CMD} stop

build:
	cd ../ ; \
	${PROD_DC-CMD} build --force-rm;
wipe:
	cd ../ ; \
	${PROD_DC-CMD} down --remove-orphans ; \
	${PROD_DC-CMD} rm -v ;

clean: wipe build

pull_attachments:
	scp -r $(DEPLOY_HOST):~/data/uploads/ ./data/uploads ;

dump_database:
	ssh $(DEPLOY_HOST) "mysqldump $(DEPLOY_DATABASE_NAME) > ~/dumps/dump.sql" ;

pull_database: dump_database
	scp $(DEPLOY_HOST):~/dumps/dump.sql ./data/ ;

pull: dump_database pull_database pull_attachments ;

push_config:
	scp -r ./config $(DEPLOY_HOST):~/data/ ;

push_app:
	cd .. ; git push deploy master

push: push_config push_app
