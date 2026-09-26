#!/bin/bash

set -e

echo "Creating Distributed PostgreSQL Lab structure..."

mkdir -p \
    docs \
    diagrams \
    screenshots/{01-vmware,02-rocky-linux,03-postgresql,04-database,05-python,06-replication,07-ha,08-monitoring} \
    configs/{postgresql,haproxy,pgbouncer,monitoring} \
    scripts/{setup,database,replication,monitoring,backup,testing} \
    python \
    sql/{queries,monitoring} \
    results/{baseline,load-tests,replication,failover,recovery} \
    ansible/inventory \
    ansible/playbooks \
    ansible/roles/{postgresql,haproxy,monitoring}

touch \
    README.md \
    LICENSE \
    .gitignore \
    requirements.txt

touch docs/{01-project-overview,02-lab-architecture,03-vmware-setup,04-rocky-linux-setup,05-postgresql-installation,06-postgresql-configuration,07-database-users-and-permissions,08-python-client,09-load-testing,10-replication,11-haproxy,12-pgbouncer,13-monitoring,14-failure-testing,15-recovery,16-troubleshooting,17-lessons-learned}.md

touch configs/postgresql/{postgresql.conf.example,pg_hba.conf.example}
touch configs/haproxy/haproxy.cfg.example
touch configs/pgbouncer/pgbouncer.ini.example
touch configs/monitoring/monitoring-config.example

touch python/{db_client.py,load_generator.py,metrics.py,config.py,requirements.txt}

touch sql/{schema.sql,seed-data.sql}
touch sql/queries/{select-tests,insert-tests,update-tests,performance-tests}.sql
touch sql/monitoring/{active-connections,replication-status,database-size}.sql

touch scripts/setup/{install-postgresql,configure-network,configure-firewall}.sh
touch scripts/database/{create-database,create-users,create-schema}.sql
touch scripts/replication/{configure-primary,configure-replica}.sh
touch scripts/monitoring/collect-metrics.sh
touch scripts/backup/{backup,restore}.sh
touch scripts/testing/{connectivity-test,replication-test,failover-test}.sh

touch ansible/inventory/hosts.example
touch ansible/playbooks/{setup,postgresql,monitoring}.yml
touch ansible/roles/postgresql/.gitkeep
touch ansible/roles/haproxy/.gitkeep
touch ansible/roles/monitoring/.gitkeep

echo
echo "Project structure created successfully."
echo
find . -type d | sort
