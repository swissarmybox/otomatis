.PHONY: build run

build:
	docker build -t ubuntu .

run:
	docker run -it -v ${PWD}/setup:/home/jane/setup --name ubuntu ubuntu
