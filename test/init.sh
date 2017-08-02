#! /bin/bash

which shellcheck &> /dev/null
if [[ $? != 0 ]]; then
    echo "are you sure you have installed shellcheck?"
    exit 1
fi

cat << EOS > .pre-commit-config.yaml
-   repo: $(pwd)
    sha: $(git rev-parse HEAD)
    hooks:
    -   id: shell-lint
EOS

tmpdir=$(mktemp -t pre-commit-shell.XXXXXX  -d)
cp test/test.sh "$tmpdir"
cp test/.pre-commit-config.yaml "$tmpdir"
pushd "$tmpdir"
pwd
git init
git config user.email "detailyang@gmail.com"
git config user.name "detailyang"
pre-commit install
git add .pre-commit-config.yaml; git commit -a -m "init test case"
git add . --all
tmpfile=$(mktemp -t pre-commit-shell.XXX)
git commit -a -m "let begin test" &> "$tmpfile"
popd
rm -rf "$tmpdir"

function passed() {
    echo "$@"

    return 0
}

function failed() {
    echo "$@"
    exit 255
}

grep --quiet "SC2115" $tmpfile && passed "SC2115 PASSED" || failed "SC2115 FAILED"
grep --quiet "SC2086" $tmpfile && passed "SC2086 PASSED" || failed "SC2086 FAILED"
grep --quiet "SC2034" $tmpfile && passed "SC2034 PASSED" || failed "SC2034 FAILED"
