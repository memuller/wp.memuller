DATABASE_NAME=memuller

pull_attachments:
	scp -r memuller.com:~/data/uploads/ ./data/uploads ;

dump_database:
	ssh memuller.com "mysqldump $(DATABASE_NAME) > ~/dumps/dump.sql" ;

pull_database: dump_database
	scp memuller.com:~/dumps/dump.sql ./data/ ;

pull: dump_database pull_database pull_attachments ;

push_config:
	scp -r ./config memuller.com:~/data/ ;
