#! /bin/bash

cat << EOS > .pre-commit-config.yaml
-   repo: https://github.com/detailyang/pre-commit-shell
    sha: $(git rev-parse HEAD)
    hooks:
    -   id: shell-lint
EOS

tmpdir=$(mktemp -t pre-commit-shell  -d)
cp -r . $tmpdir
git init
pre-commit
rm -rf $tmpdir
