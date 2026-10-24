DOCKER_IMAGE=dockette/adminerevo
DOCKER_PLATFORM=linux/amd64
VERSION:=$(shell cat VERSION)

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
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
