.PHONY: build run run-with-mount

build:
	docker build -t ubuntu-dev .

run:
	docker run -it ubuntu-dev

run-with-mount:
	docker run -it -v ${PWD}/../..:/home/test/.otomatis ubuntu-dev
