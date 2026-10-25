DOCKER_IMAGE=dockette/adminerevo
DOCKER_PLATFORM=linux/amd64
include VERSION

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

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@sed -i.bak "s/^VERSION=.*/VERSION=$$(date -u +%Y.%m.%d)/" VERSION && rm VERSION.bak
	@cat VERSION
