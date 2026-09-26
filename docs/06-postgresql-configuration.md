# PostgreSQL Configuration

## 1. Overview

This document records the PostgreSQL server configuration performed on
`pg-node1` as part of the Distributed PostgreSQL High-Availability Lab.

### Server

| Setting          | Value             |
| ---------------- | ----------------- |
| Hostname         | `pg-node1`        |
| Operating System | Rocky Linux 10.2  |
| PostgreSQL       | 16.15             |
| Private IP       | `192.168.50.10`   |
| Private Network  | `192.168.50.0/24` |
| PostgreSQL Port  | `5432`            |

---

## 2. PostgreSQL Service

PostgreSQL was configured to start automatically with the operating
system and was started immediately.

```bash
sudo systemctl enable --now postgresql
```

The service was verified using:

```bash
systemctl status postgresql --no-pager
```

The service reported:

```text
Active: active (running)
```

The service was also verified using:

```bash
systemctl is-active postgresql
```

Expected result:

```text
active
```

---

## 3. PostgreSQL Configuration Files

The active PostgreSQL configuration file was verified using:

```bash
sudo -u postgres psql -c "SHOW config_file;"
```

Result:

```text
/var/lib/pgsql/data/postgresql.conf
```

The active client authentication file was verified using:

```bash
sudo -u postgres psql -c "SHOW hba_file;"
```

Result:

```text
/var/lib/pgsql/data/pg_hba.conf
```

The main configuration files are therefore:

```text
/var/lib/pgsql/data/postgresql.conf
/var/lib/pgsql/data/pg_hba.conf
```

---

## 4. Configuration Backups

Before modifying the PostgreSQL configuration files, backup copies were
created.

### PostgreSQL server configuration

```bash
sudo cp /var/lib/pgsql/data/postgresql.conf \
        /var/lib/pgsql/data/postgresql.conf.bak
```

### Client authentication configuration

```bash
sudo cp /var/lib/pgsql/data/pg_hba.conf \
        /var/lib/pgsql/data/pg_hba.conf.bak
```

The backups provide a way to restore the previous configuration if a
configuration change causes a problem.

---

## 5. Network Listening Configuration

### Initial Configuration

After PostgreSQL installation, the server was initially configured to
listen only on localhost.

The initial value was:

```text
listen_addresses = 'localhost'
```

This allowed local connections but did not allow PostgreSQL clients on
the private database network to connect.

### Private Network Configuration

The PostgreSQL server was configured to listen on the private database
interface.

The following setting was configured in:

```text
/var/lib/pgsql/data/postgresql.conf
```

Configuration:

```text
listen_addresses = '192.168.50.10,localhost'
```

This allows PostgreSQL to accept connections through:

```text
192.168.50.10
localhost
```

PostgreSQL uses TCP port:

```text
5432
```

### Verification

The listening sockets were verified using:

```bash
sudo ss -tlnp | grep 5432
```

PostgreSQL was confirmed to be listening on the private IP:

```text
192.168.50.10:5432
```

as well as the local interface.

---

## 6. Client Authentication Configuration

PostgreSQL client authentication is controlled by:

```text
/var/lib/pgsql/data/pg_hba.conf
```

The default configuration allowed local connections but did not contain
a rule for the private database network.

The following rule was added:

```text
# PostgreSQL private lab network
host    all    all    192.168.50.0/24    scram-sha-256
```

### Rule Explanation

| Field          | Value             | Purpose                         |
| -------------- | ----------------- | ------------------------------- |
| Type           | `host`            | TCP/IP connections              |
| Database       | `all`             | Applies to all databases        |
| User           | `all`             | Applies to all PostgreSQL users |
| Address        | `192.168.50.0/24` | Private database network        |
| Authentication | `scram-sha-256`   | Password authentication         |

This allows clients on the private PostgreSQL network to authenticate
using SCRAM-SHA-256.

Actual database users and their permissions will be configured in the
database users and permissions stage.

---

## 7. HBA Configuration Validation

After modifying `pg_hba.conf`, the configuration was validated before
continuing.

The following command was used:

```bash
sudo -u postgres psql -c "SELECT * FROM pg_hba_file_rules;"
```

The resulting configuration showed the private network rule:

```text
192.168.50.0/24
```

with:

```text
scram-sha-256
```

The `error` column was empty, confirming that PostgreSQL successfully
parsed the configuration without errors.

---

## 8. Applying the Configuration

The updated `pg_hba.conf` configuration was loaded without restarting
the PostgreSQL service.

```bash
sudo systemctl reload postgresql
```

The PostgreSQL service was then verified to ensure it remained active:

```bash
systemctl is-active postgresql
```

Result:

```text
active
```

---

## 9. Current Configuration State

At this stage, `pg-node1` has the following PostgreSQL configuration:

```text
Hostname:
    pg-node1

PostgreSQL:
    16.15

Private IP:
    192.168.50.10

Private Network:
    192.168.50.0/24

Port:
    5432

Listening:
    192.168.50.10
    localhost

Remote Authentication:
    SCRAM-SHA-256

PostgreSQL Service:
    Enabled and running
```
