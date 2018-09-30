include ../.env
include .env

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
