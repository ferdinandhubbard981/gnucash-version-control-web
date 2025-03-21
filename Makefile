docker-build:
	docker build -t gnucash-version-control-web .

docker-run:
	docker run --network host -e ApiSettings:BaseUrl="http://localhost:5000" gnucash-version-control-web