# Gemfile.io

[![Code Climate](https://codeclimate.com/github/droptheplot/gemfileio/badges/gpa.svg)](https://codeclimate.com/github/droptheplot/gemfileio)
[![Test Coverage](https://codeclimate.com/github/droptheplot/gemfileio/badges/coverage.svg)](https://codeclimate.com/github/droptheplot/gemfileio/coverage)
[![Build Status](https://travis-ci.org/droptheplot/gemfileio.svg?branch=master)](https://travis-ci.org/droptheplot/gemfileio)
[![Stack Share](http://img.shields.io/badge/tech-stack-0690fa.svg?style=flat)](http://stackshare.io/droptheplot/gemfile-io)

## Requirements

* Ruby 2.2.2 or higher
* Bower

## Getting Started

Copy database config and secrets from examples

```shell
cp config/database.yml.example config/database.yml
cp config/secrets.yml.example config/secrets.yml
```

Run migrations

```shell
rake db:migrate
```

Install bower dependencies

```shell
bower install
```

Run server

```shell
rails s
```

## Roadmap

* Logo and favicon
* Subcategories
* Human friendly urls for categories
* Page with favorite projects for users
* Elasticsearch
* ~~Minifiable AngularJS~~
* ~~Github url parser new projects~~

## Contributing

1. Fork it (https://github.com/droptheplot/gemfileio/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
