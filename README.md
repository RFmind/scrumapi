# Scrumapi

## Running the application locally:

  * Set POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST environment variables
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Run tests with `mix test`
  * Run the application with `mix phoenix.server`

The application is now available at [`localhost:4000`](http://localhost:4000).

## Running the application with Docker:

  * Install docker and docker-compose
  * Create database with `sudo docker-compose run web mix ecto.create`
  * Migrate database with `sudo docker-compose run web mix ecto.migrate`
  * Run tests with `sudo docker-compose run test`
  * Run application with `sudo docker-compose run web`

The application is now available at [`localhost:4000`](http://localhost:4000).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
