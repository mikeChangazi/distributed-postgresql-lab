# Database Users and Permissions

## 1. Overview

This document records the PostgreSQL database and user configuration completed on `pg-node1` as part of the Distributed PostgreSQL High-Availability Lab.

The objective was to create a dedicated application database and user instead of using the PostgreSQL administrative `postgres` account for application workloads.

## 2. Database and User

| Setting            | Value           |
| ------------------ | --------------- |
| PostgreSQL server  | `pg-node1`      |
| PostgreSQL version | `16.15`         |
| Database           | `labdb`         |
| Application user   | `labuser`       |
| Database owner     | `labuser`       |
| Authentication     | `SCRAM-SHA-256` |
| PostgreSQL port    | `5432`          |

The `postgres` role remains the administrative superuser.

The `labuser` role is used for application and workload testing.

## 3. Application User

The application role `labuser` was created as a login role.

A password was configured using PostgreSQL's interactive password command:

```sql
\password labuser
```

The password is not stored in the Git repository.

The role was verified to have no unnecessary administrative privileges such as:

* Superuser
* Create role
* Create database
* Replication
* Bypass RLS

## 4. Password Authentication

PostgreSQL password encryption was verified with:

```sql
SHOW password_encryption;
```

Result:

```text
scram-sha-256
```

This confirms that password authentication uses SCRAM-SHA-256.

## 5. Application Database

The database was created with:

```sql
CREATE DATABASE labdb OWNER labuser;
```

The database was verified using:

```sql
\l labdb
```

The result confirmed:

```text
Name  | Owner
------+--------
labdb | labuser
```

Therefore, `labuser` owns the application database.

## 6. Client Authentication

The PostgreSQL host-based authentication configuration was updated to allow password-authenticated TCP connections.

The localhost rule was configured as:

```text
host    all    all    127.0.0.1/32    scram-sha-256
```

The private PostgreSQL network rule was previously configured as:

```text
host    all    all    192.168.50.0/24    scram-sha-256
```

The HBA configuration was validated using:

```bash
sudo -u postgres psql -c "SELECT * FROM pg_hba_file_rules;"
```

The configuration was then reloaded:

```bash
sudo systemctl reload postgresql
```

## 7. Authentication Test

The application user was tested using a TCP connection:

```bash
psql -h 127.0.0.1 -U labuser -d labdb
```

Authentication succeeded using the configured password.

The connection was verified with:

```sql
\conninfo
```

Result:

```text
You are connected to database "labdb" as user "labuser"
on host "127.0.0.1" at port "5432".
```

The active user and database were also verified:

```sql
SELECT current_user, current_database();
```

Result:

```text
current_user | current_database
-------------+-----------------
labuser      | labdb
```

## 8. Permission Test

The `labuser` account was tested by creating a temporary table:

```sql
CREATE TABLE test_connection (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL
);
```

Data was inserted:

```sql
INSERT INTO test_connection (message)
VALUES ('PostgreSQL lab test connection');
```

The data was successfully retrieved:

```sql
SELECT * FROM test_connection;
```

This confirmed that `labuser` could:

* Create database objects
* Insert data
* Read data

The temporary test table was subsequently removed:

```sql
DROP TABLE test_connection;
```

## 9. Security Considerations

The PostgreSQL `postgres` role is reserved for administrative tasks.

Application workloads will use the dedicated `labuser` role rather than the PostgreSQL superuser.

The database password is not stored in the project repository.

The current private-network HBA rule permits SCRAM-authenticated connections from the entire `192.168.50.0/24` lab network. This is acceptable for the current laboratory stage and can be tightened later when additional nodes and dedicated replication/application roles are configured.

## 10. Current State

| Component                     | Status   |
| ----------------------------- | -------- |
| PostgreSQL service            | Complete |
| `labuser` role                | Complete |
| SCRAM authentication          | Complete |
| `labdb` database              | Complete |
| Database ownership            | Complete |
| Local TCP authentication test | Complete |
| Basic permission test         | Complete |
| Temporary test table          | Removed  |

The database and user foundation is now ready for the next stage of the lab.
