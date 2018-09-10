.PHONY: mysql ssh build run up down

include .env

EXEC_APP_CMD:=docker exec -it ${APP}
EXEC_DB_CMD:=docker exec -it ${DB}

copy_database:
	cp ./../deploy/data/dump.sql ./mysql/ ;

copy_uploads:
	cp -r ./../deploy/data/uploads/** ./../web/app/uploads/ ;

prepare: copy_database copy_uploads

build:
	docker-compose down --remove-orphans ;
	docker-compose rm ;
	docker-compose build ;

setup: prepare build

run:
	docker-compose up ;
up:
	docker-compose up --detach;
down:
	docker-compose stop;

mysql:
	${EXEC_DB_CMD} sh -c 'mysql -u root -p$${MYSQL_ROOT_PASSWORD} $${MYSQL_DATABASE}' ;

ssh:
	${EXEC_APP_CMD} ash
