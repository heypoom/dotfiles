all: build-image push-image run-image

build-image:
	docker build -t phoomparin/dotfiles .

run-image:
	docker run -it phoomparin/dotfiles:latest

push-image:
	docker push phoomparin/dotfiles:latest

