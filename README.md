# README

Codebase for an e-commerce JSON API build in Ruby On Rails

This repo is set up to run using Docker Compose. To run it locally

1. Make sure you have the Docker Daemon running.

2. Run `docker-compose up` to generate two containers; one contains the API and one contains the DB itself. 

3. In another tab, run `docker compose run api rails db:create` and `docker compose run api rails db:migrate`. To use seed data, you can also run `docker compose run api rails db:seed`.



to check local postgres info:

 `ps auxwww | grep postgres` gives you port info

 `pg_ctl status` gives you local postgres info
