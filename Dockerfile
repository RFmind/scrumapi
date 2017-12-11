FROM elixir:latest

# create and set homedir
WORKDIR /app

# install hex silently
RUN mix local.hex --force

# install rebar silently
RUN mix local.rebar --force

# copy all dependencies
COPY mix.* /app/

# install dependencies
RUN mix deps.get

# compile dependencies
RUN mix deps.compile

# copy all application files
COPY . /app/

# compile application
RUN mix compile

