# PostgreSQL Installation

## Environment

PostgreSQL was installed on the first database server:

- Hostname: `pg-node1`
- Operating System: Rocky Linux 10.2
- Architecture: x86_64

## PostgreSQL Package

The PostgreSQL server package was obtained from the Rocky Linux
AppStream repository.

The installed version is:
PostgreSQL 16.15

## Installation

The server package was installed with DNF:
sudo dnf install postgresql-server

The installed RPM package was verified with:
rpm -q postgresql-server

Result:
postgresql-server-16.15-1.el10_2.x86_64

The PostgreSQL client version was verified with:
psql --version

Result:
psql (PostgreSQL) 16.15

## Database cluster initialization

The database cluster was initialized using:
sudo postgresql-setup --initdb

The PosstgreSQL data directory was created at:
/var/lib/pgsql/data

The directory contains the primary PostgreSQL configuration files:
postgresql.conf
pg_hba.conf
pg_ident.conf

The directory and its contents are owned by the postgres system user
and group.

Status

PostgreSQL has been successfully installed and the initial database
cluster has been initialized.

Service configuration and network access will be documented in the
next stage.
