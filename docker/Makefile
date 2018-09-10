PRJ_NAME:=memuller_wp
.PHONY: mysql ssh

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
	docker exec -it ${PRJ_NAME}_db_1 sh -c 'mysql -uroot -p$${MYSQL_ROOT_PASSWORD} $${MYSQL_DATABASE}' ;

ssh:
	docker exec -it ${PRJ_NAME}_web_1 ash ;
