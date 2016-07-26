# pre-commit-shell
![Branch master](https://img.shields.io/badge/branch-master-brightgreen.svg?style=flat-square)[![Build](https://api.travis-ci.org/detailyang/pre-commit-shell.svg)](https://travis-ci.org/detailyang/pre-commit-shell)[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/detailyang/pre-commit-shell/master/LICENSE)[![release](https://img.shields.io/github/release/detailyang/pre-commit-shell.svg)](https://github.com/detailyang/pre-commit-shell/releases)

pre-commit-shell is a [pre-commit](https://github.com/pre-commit/pre-commit) commponent, which wrapper [shellcheck](https://www.shellcheck.net/) to check shell scripts:)

Table of Contents
-----------------

  * [Requirements](#requirements)
  * [Install](#install)
  * [Contributing](#contributing)
  * [License](#license)
  * [Author](#author)

Requirements
------------
  pre-commit-shell requires the following to run:

  * [pre-commit](http://pre-commit.com)
  * [shellcheck](https://www.shellcheck.net/)
    

Install
---------

1. create .pre-commit-config.yaml in you git project
2. pre-commit install 
3. enjoy it

example .pre-commit-config.yaml as following:

```yaml
-   repo: git://github.com/detailyang/pre-commit-shell
    sha: 1.0.0
    hooks:
    - id: shell-lint
```
Contributing
------------

To contribute to pre-commit-shell, clone this repo locally and commit your code on a separate branch. 


Author
------

> GitHub [@detailyang](https://github.com/detailyang)     


License
-------

pre-commit-shell is licensed under the [MIT](https://github.com/detailyang/pre-commit-shell/blob/master/LICENSE) license.  
