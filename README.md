# [yujiorama/lastpass-cli](https://hub.docker.com/repository/docker/yujiorama/lastpass-cli)

Docker container for [lastpass-cli](https://github.com/lastpass/lastpass-cli).

## Build and Run

* build-arg
    - `LASTPASS_CLI_VERSION`
        + A release tag of [lastpass-cli](https://github.com/lastpass/lastpass-cli)
* environment variable
    - `USERNAME`
        + A username of [LastPass](https://www.lastpass.com/).

```bash
$ docker build -t lastpass-cli:1.3.3 --build-arg LASTPASS_CLI_VERSION=v1.3.3 .

$ docker run --rm -it -e USERNAME=test@example.com lastpass-cli:1.3.3
LastPass CLI v1.3.3

Usage:
  /usr/bin/lpass {--help|--version}
  lpass login [--trust] [--plaintext-key [--force, -f]] [--color=auto|never|always] USERNAME
  lpass logout [--force, -f] [--color=auto|never|always]
  lpass passwd
  lpass show [--sync=auto|now|no] [--clip, -c] [--quiet, -q] [--expand-multi, -x] [--json, -j] [--all|--username|--password|--url|--notes|--field=FIELD|--id|--name|--attach=ATTACHID] [--basic-regexp, -G|--fixed-strings, -F] [--color=auto|never|always] {UNIQUENAME|UNIQUEID}
  lpass ls [--sync=auto|now|no] [--long, -l] [-m] [-u] [--color=auto|never|always] [GROUP]
  lpass mv [--color=auto|never|always] {UNIQUENAME|UNIQUEID} GROUP
  lpass add [--sync=auto|now|no] [--non-interactive] [--color=auto|never|always] {--username|--password|--url|--notes|--field=FIELD|--note-type=NOTETYPE} NAME
  lpass edit [--sync=auto|now|no] [--non-interactive] [--color=auto|never|always] {--name|--username|--password|--url|--notes|--field=FIELD} {NAME|UNIQUEID}
  lpass generate [--sync=auto|now|no] [--clip, -c] [--username=USERNAME] [--url=URL] [--no-symbols] {NAME|UNIQUEID} LENGTH
  lpass duplicate [--sync=auto|now|no] [--color=auto|never|always] {UNIQUENAME|UNIQUEID}
  lpass rm [--sync=auto|now|no] [--color=auto|never|always] {UNIQUENAME|UNIQUEID}
  lpass status [--quiet, -q] [--color=auto|never|always]
  lpass sync [--background, -b] [--color=auto|never|always]
  lpass export [--sync=auto|now|no] [--color=auto|never|always] [--fields=FIELDLIST]
  lpass import [--keep-dupes] [CSV_FILENAME]
  lpass share subcommand sharename ...
```

## License

[MIT](./LICENSE)
