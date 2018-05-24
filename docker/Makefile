PRJ_NAME:=memuller_wp
.PHONY: mysql ssh

prepare:
	cp ./../deploy/data/dump.sql ./mysql/

build:
	docker-compose down --remove-orphans
	docker-compose rm
	docker-compose build

setup: prepare build

run:
	docker-compose up

mysql:
	docker exec -it ${PRJ_NAME}_db_1 sh -c 'mysql -uroot -p$${MYSQL_ROOT_PASSWORD} $${MYSQL_DATABASE}'

ssh:
	docker exec -it ${PRJ_NAME}_web_1 ash
