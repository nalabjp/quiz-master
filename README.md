# Quiz Master

Quiz Master is Quipper's technical exam for web developers.

# System requirements

* Ruby

* Bundler

* SQLite3

## My Environment

* MacOS 10.12.3

* Ruby 2.3.3p222

* SQLite3 3.14.0

# Technical summary

* Web Application Framework
    * Rails

* Template Engine
    * Slim

* CSS Framework
    * Materialize

* Frontend library
    * React.js

# Setup

Bundle:

```
$ bundle install --path=vendor/bundle
```

Basic setup:

```
$ bin/setup
```

If you want to import some example questions, you can use the script.

```
$ bundle exec rails r script/import_example_questions.rb
```

Launch application:

```
$ RAILS_ENV=production bundle exec rails s
```

# TODO

* Frontend Testing 😰
