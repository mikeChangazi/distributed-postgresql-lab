# Python PostgreSQL Client

## Overview

The distributed PostgreSQL lab uses Python to connect to PostgreSQL and provide the foundation for later database load testing and performance measurement.

The Python client uses Psycopg 3 and reads database connection settings from environment variables.

## Python Environment

- Python: 3.12.14
- PostgreSQL driver: Psycopg 3.3.6
- Virtual environment: `.venv`
- Database: `labdb`
- Database user: `labuser`
- PostgreSQL host: `127.0.0.1`
- PostgreSQL port: `5432`

## Python Dependencies

The Python dependency is recorded in:

```text
python/requirements.txt
```

The PostgreSQL driver was installed with:

python -m pip install "psycopg[binary]"

## Configuration

Database connection settings are stored in:
python/config.py

The configuration reads the following environment variables:
DB_HOST
DB_PORT
DB_NAME
DB_USER
DB_PASSWORD

The database password is supplied through the environment and is not stored in the source code.

## Database Client

The client is implemented in:
python/db_client.py

The client:
1.Reads the database configuration.
2.Establishes a PostgreSQL connection using Psycopg.
3.Executes a test query.
4.Displays the connected database and user.
5.Closes the connection cleanly.

##Verification

The client was tested with:
python python/db_client.py

Successful output:
PostgreSQL connection successful
Database: labdb
User: labuser
Connection closed
