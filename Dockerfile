# Description: Dockerfile for the Phoenix application
FROM elixir:1.14.3

# Maintainer
LABEL maintainer="fabianskier <fabianskier@icloud.com>"

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    inotify-tools \
    postgresql-client \
    nodejs \
    npm \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
WORKDIR /app
COPY . .

# Install mix dependencies and compile
RUN mix deps.get && mix deps.compile

# Add a script to be executed every time the container starts.
COPY ./entrypoint.sh /usr/bin/

# Give execution rights on the entrypoint
RUN chmod +x /usr/bin/entrypoint.sh

# The entrypoint script will execute the given command or run the server.
ENTRYPOINT ["entrypoint.sh"]
