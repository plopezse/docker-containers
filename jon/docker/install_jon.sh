#!/bin/bash

__start_postgres() {
su --login postgres --command "/usr/bin/postgres -D /var/lib/pgsql/data -p 5432" &
sleep 10
ps aux 
}

__install_jon() {
/opt/jon-server-3.2.0.GA/bin/rhqctl install
}

# Call functions
__start_postgres
__install_jon
