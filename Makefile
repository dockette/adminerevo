DOCKER_IMAGE=dockette/adminerevo
DOCKER_PLATFORM=linux/amd64

.PHONY: docker-build
docker-build:
	docker buildx \
		build \
		--platform ${DOCKER_PLATFORM} \
		--pull \
		-t ${DOCKER_IMAGE} \
		adminerevo

.PHONY: docker-run
docker-run:
	docker run \
		-it \
		--rm \
		--platform ${DOCKER_PLATFORM} \
		-p 8080:8080 \
		--name adminer \
		${DOCKER_IMAGE}
