docker-build:
	docker build -t gnucash-version-control-web .

docker-run:
	docker run --rm --network host -e ApiSettings:BaseUrl="http://localhost:5000" gnucash-version-control-web

all: docker-build docker-run

docker-publish:
	docker tag gnucash-version-control-web ej21378/gnucash-version-control-web
	docker push ej21378/gnucash-version-control-web