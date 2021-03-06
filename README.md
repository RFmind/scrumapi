# Scrumapi [![wercker status](https://app.wercker.com/status/05b8bd585249901be521f06e666d50f5/m/master "wercker status")](https://app.wercker.com/project/byKey/05b8bd585249901be521f06e666d50f5)

## Running the application locally:

  * Set `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_HOST` environment variables
  * Set `MIX_ENV` to one of `dev`, `test`, `prod`
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
