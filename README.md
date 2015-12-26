# Gemfile.io

[![Code Climate](https://codeclimate.com/github/droptheplot/gemfileio/badges/gpa.svg)](https://codeclimate.com/github/droptheplot/gemfileio)
[![Test Coverage](https://codeclimate.com/github/droptheplot/gemfileio/badges/coverage.svg)](https://codeclimate.com/github/droptheplot/gemfileio/coverage)
[![Build Status](https://travis-ci.org/droptheplot/gemfileio.svg?branch=master)](https://travis-ci.org/droptheplot/gemfileio)

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
