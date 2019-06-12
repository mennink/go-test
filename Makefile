build:
	docker build -f Dockerfile.multistage -t go-test .

build1:
	docker build -t go-test .

run:
	docker run -d -p 8080:8080 go-test:latest
