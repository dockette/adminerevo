DOCKER_IMAGE=dockette/adminerevo
DOCKER_TAG?=latest
DOCKER_PLATFORM?=linux/amd64
DOCKER_TEST_PORT?=8080

.PHONY: build
build:
	docker buildx \
		build \
		--platform ${DOCKER_PLATFORM} \
		--pull \
		--load \
		-t ${DOCKER_IMAGE}:${DOCKER_TAG} \
		adminerevo

.PHONY: test
test: build
	@set -e; \
	container=$$(docker run --rm -d \
		--platform ${DOCKER_PLATFORM} \
		-p ${DOCKER_TEST_PORT}:8080 \
		${DOCKER_IMAGE}:${DOCKER_TAG}); \
	trap 'docker stop $$container >/dev/null' EXIT; \
	sleep 3; \
	curl -fsS http://localhost:${DOCKER_TEST_PORT}/ >/dev/null

.PHONY: run
run:
	docker run \
		-it \
		--rm \
		--platform ${DOCKER_PLATFORM} \
		-p 8080:8080 \
		--name adminer \
		${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: docker-build
docker-build:
	$(MAKE) build

.PHONY: docker-test
docker-test: docker-build
	$(MAKE) test

.PHONY: docker-run
docker-run:
	$(MAKE) run
