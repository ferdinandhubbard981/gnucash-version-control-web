docker-build:
	docker build -t gnucash-version-control-web .
	docker tag gnucash-version-control-web ej21378/gnucash-version-control-web

docker-run:
	docker run --rm --network host -e ApiSettings:BaseUrl="http://localhost:5000" gnucash-version-control-web

docker-publish: docker-build
	docker push ej21378/gnucash-version-control-web

all: docker-build docker-run

update-server:
	scp docker-compose.yml gncweb:~/docker-compose.yml
	scp nginx.conf gncweb:~/nginx.conf
	scp -r secrets gncweb:~/secrets
	ssh gncweb 'docker compose down; docker compose pull; docker compose up -d'