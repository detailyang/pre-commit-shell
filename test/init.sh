#! /bin/bash

cat << EOS > .pre-commit-config.yaml
-   repo: $(pwd)
    sha: $(git rev-parse HEAD)
    hooks:
    -   id: shell-lint
EOS

tmpdir=$(mktemp -t pre-commit-shell  -d)
echo $tmpdir
cp test/test.sh "$tmpdir"
cp test/.pre-commit-config.yaml "$tmpdir"
pushd "$tmpdir"
git init
git add .pre-commit-config.yaml; git commit -a -m "init test case"
pre-commit install
pre-commit run
git add . --all
tmpfile=$(mktemp -t pre-commit-shell)
git commit -a -m "let begin test" &> "$tmpfile"
popd
rm -rf "$tmpdir"

grep --quiet "SC2115" $tmpfile && echo "SC2115 PASSED" || (echo "SC2115 FAILED"; exit 2)
grep --quiet "SC2086" $tmpfile && echo "SC2086 PASSED" || (echo "SC2086 FAILED"; exit 2)
grep --quiet "SC2034" $tmpfile && echo "SC2034 PASSED" || (echo "SC2034 FAILED"; exit 2)
