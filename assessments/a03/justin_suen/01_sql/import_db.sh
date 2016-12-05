#!/usr/bin/env sh

test -e "movie.db" && rm movie.db
cat ./data/import_db.sql | sqlite3 movie.db
