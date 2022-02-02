.PHONY: build run

build:
	docker build -t ubuntu-dev .

run:
	docker run -it ubuntu-dev

run-with-mount:
	docker run -it -v ${PWD}/..:/home/jane/.otomatis ubuntu-dev
