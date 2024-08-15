#!/bin/bash
set -eux
 
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
 
#Demo PostgreSQL Database initialisation
# psql postgres -c "CREATE USER testuser PASSWORD 'testpass'"
 
#The -O flag below sets the user: createdb -O DBUSER DBNAME
#createdb -O testuser testdb
 
#psql -d testdb -U testuser -f $THISDIR/seed_db.sql

#createdb avy

#psql -d avy -f $THISDIR/schema.sql

# unable to use a seperate schema.sql file because of path issues in
# COPY sql command. Use \copy meta command instead:
psql -d avy -c "\
\copy uac(date_mdy, region)	\
FROM 'test.csv'			\
DELIMITER ',' 			\
CSV HEADER 			\
"
