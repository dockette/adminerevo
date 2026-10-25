<h1 align=center>Dockette / Adminerevo</h1>

<p align=center>
   🎁 Dockerized <a href="https://https://docs.adminerevo.org/">Adminerevo</a> (MySQL, PostgreSQL, SQLite, Mongo, Oracle). Database management in a single PHP file.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

<p align=center>
  <a href="https://hub.docker.com/r/dockette/adminerevo/"><img src="https://badgen.net/docker/pulls/dockette/adminerevo"></a>
  <a href="https://bit.ly/ctteg"><img src="https://badgen.net/badge/support/gitter/cyan"></a>
  <a href="https://github.com/sponsors/f3l1x"><img src="https://badgen.net/badge/sponsor/donations/F96854"></a>
</p>

![Adminerevo](https://raw.githack.com/dockette/adminerevo/master/.docs/adminerevo.png)

------

[AdminerEvo](https://docs.adminerevo.org/) is a database management tool in a single PHP file, a fork of Adminer. This
image runs it with Caddy and PHP-FPM on Alpine.

## Features

- AdminerEvo `4.8.4` on Alpine `3.24` with PHP `8.4` (`session`, `mysqli`, `pgsql`, `json`, `fpm`)
- Caddy serves the single-file app on port `8080`, `tini` runs as init
- MySQL, PostgreSQL, SQLite, Mongo and Oracle

## Usage

```sh
docker run --rm -p 8080:8080 dockette/adminerevo
```

## Versions

| Version | Release |
|---------|---------|
| `dockette/adminerevo:4.8.4-YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/adminerevo:4.8.4` | latest release |
| `dockette/adminerevo:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/adminerevo:latest` | latest build of `master` |

All versions build on AdminerEvo `4.8.4`, pinned in the `Dockerfile` (`ADMINEREVO_VERSION`) and in `VERSION`. Releases
are listed on [GitHub](https://github.com/dockette/adminerevo/releases).

## Development

```sh
make docker-build   # build the image
make docker-run     # run the image on port 8080
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
