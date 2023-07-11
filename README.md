# README

# orders-api

## Install

### Clone the repository

```shell
git clone https://github.com/AlvaroJTorres/orders-api.git
```

### Install dependencies

```shell
bundle install
```

### Configuration

You may want to initiate your server and create a database and run the migrations

```shell
rails db:create
rails db:migrate
```

Also it may require you to create an .env file in the root directory to handle Enviromental Variables for the Database

The .env file should contain the following

```shell
DB_USERNAME=(insert your db username here)
DB_PASSWORD=(insert your db password here)
```

You can also seed the db with example data for testing

```shell
rails db:seed
```

## Server
To start the server run

```shell
rails s
Visit http://localhost:3000/
```

## Test suite

This proyect counts with tests for the endpoints, to run then use the following command:

```shell
bundle exec Rspec
```