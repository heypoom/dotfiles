release-image: build-image push-image
try-image: release run-image

build-image:
	docker build -t phoomparin/dotfiles .

run-image:
	docker run -it phoomparin/dotfiles:latest

push-image:
	docker push phoomparin/dotfiles:latest

