#!/bin/bash

__run_postgres() {
su --login postgres --command "/usr/bin/postgres -D /var/lib/pgsql/data -p 5432" &
sleep 10
ps aux 
}

__run_jon() {
/opt/jon-server-3.2.0.GA/bin/rhqctl start
}

# Call all functions
__run_postgres
__run_jon

# A foreground process to avoid container ends
tail -f /opt/jon-server-3.2.0.GA/logs/rhqctl.log

