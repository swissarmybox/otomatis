.PHONY: build run

build:
	docker build -t ubuntu-dev .

run:
	docker run -it -v ${PWD}/setup:/home/jane/setup ubuntu-dev
