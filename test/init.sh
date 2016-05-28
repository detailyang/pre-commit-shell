#! /bin/bash

cat << EOS > .pre-commit-config.yaml
-   repo: $(pwd)
    sha: $(git rev-parse HEAD)
    hooks:
    -   id: shell-lint
EOS

tmpdir=$(mktemp -t pre-commit-shell  -d)
cp -r test/* "$tmpdir"
cp -r test/.* "$tmpdir"
pushd "$tmpdir"
git init
git add .pre-commit-config.yaml; git commit -a -m "init test case"
pre-commit
git add test.sh --all
git commit -a -m "test"
popd
