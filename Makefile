build:
	docker-compose up --build -d
	sleep 5
	docker exec -it test-couchdb0 ./db_setup.sh
	docker exec -it test-couchdb1 ./db_setup.sh


purge:
	docker-compose down -v
