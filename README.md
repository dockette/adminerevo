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

## Usage

```sh
docker run \
    --rm \
    -p 8080:8080 \
    dockette/adminerevo
```

## Versions

The release version is the date in [`VERSION`](VERSION). The AdminerEvo version is pinned in the `Dockerfile`
(`ADMINEREVO_VERSION`). On `master`, CI pushes the image under four tags:

| Tag | What it is |
|-----|------------|
| `dockette/adminerevo:latest` | latest build of `master` |
| `dockette/adminerevo:2026.10.23` | release `2026.10.23` |
| `dockette/adminerevo:4.8.4` | latest build with AdminerEvo `4.8.4` |
| `dockette/adminerevo:4.8.4-2026.10.23` | AdminerEvo `4.8.4` in release `2026.10.23`; pin this one |

To release, run `make release`, commit and push to `master`. An upstream upgrade is a release too.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
