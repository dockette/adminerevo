# AGENTS.md

## Project

Dockette Adminerevo packages Adminerevo, a single-file PHP database management UI, behind Caddy and PHP-FPM. The image exposes the web UI on port `8080`.

## Image

- Image name is `dockette/adminerevo`.
- Default tag is `latest`, controlled by `DOCKER_TAG`.
- Build context is `adminerevo`, not the repository root.
- `adminerevo/Dockerfile` uses `alpine:3.20` and downloads `ADMINEREVO_VERSION=4.8.4` from the Adminerevo GitHub release.
- The image includes Caddy, PHP 8.3 FPM, and PHP extensions for MySQL, PostgreSQL, JSON, and sessions.

## Commands

- `make build` uses Docker Buildx with `--platform ${DOCKER_PLATFORM}`, `--load`, and context `adminerevo`.
- `make test` builds first, runs the image detached on `${DOCKER_TEST_PORT}:8080`, and checks `http://localhost:${DOCKER_TEST_PORT}/`.
- `make run` starts an interactive container named `adminer` on `8080:8080`.
- `make docker-build`, `make docker-test`, and `make docker-run` delegate to the primary targets.

## Runtime Notes

- No Compose file is present; local runtime is direct `docker run`.
- Default platform is `linux/amd64`; keep Makefile and workflow platform assumptions aligned.
- GitHub Actions builds from context `adminerevo` with file `adminerevo/Dockerfile`, tests the UI on port `8080`, and publishes `dockette/adminerevo:latest` on `master`.
- `Caddyfile`, `php-fpm.conf`, and `entrypoint.sh` are part of the image contract and must stay in the `adminerevo` context.

## Guidelines

- Keep `README.md`, `Makefile`, `adminerevo/Dockerfile`, and `.github/workflows/docker.yml` aligned when changing versions, ports, or contexts.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
- Do not introduce unrelated formatting or structural changes.
