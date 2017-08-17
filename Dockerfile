FROM elixir:latest

# create and set homedir
WORKDIR /opt/tasks

# install hex silently
RUN mix local.hex --force

# install rebar silently
RUN mix local.rebar --force

# copy all dependencies
COPY mix.* /opt/tasks/

# install depenencies from prod env
RUN mix deps.get --only prod

# compile dependencies
RUN mix deps.compile

# copy all application files
COPY . /opt/tasks

# compile application
RUN mix compile
