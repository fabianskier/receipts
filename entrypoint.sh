#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready.
while ! pg_isready -q -h $DB_HOST -p $DB_PORT -U $DB_USERNAME
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $DB_NAME"` ]]; then
  echo "Database $DB_NAME does not exist. Creating..."
  mix ecto.create
  mix ecto.migrate
  mix ecto.setup
  echo "Database $DB_NAME created."
fi

exec mix phx.server
