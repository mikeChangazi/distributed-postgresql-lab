# Distributed PostgreSQL High-Availability Lab

## Project Overview

This project documents the design and implementation of a distributed
PostgreSQL laboratory environment built using VMware and Rocky Linux.

The lab is designed to provide practical experience with Linux
administration, networking, PostgreSQL administration, database
replication, high availability, monitoring, performance testing,
troubleshooting, and automation.

## Objectives

- Deploy PostgreSQL on Rocky Linux
- Configure a dedicated private database network
- Configure PostgreSQL databases, roles, and permissions
- Develop a Python PostgreSQL client
- Build a controlled database workload generator
- Measure database performance and latency
- Build a multi-node PostgreSQL environment
- Configure PostgreSQL streaming replication
- Implement connection pooling
- Implement HAProxy for database access
- Monitor database health and performance
- Test database failure and recovery
- Document troubleshooting procedures
- Automate selected administrative tasks
- Maintain the project using Git and GitHub

## Lab Environment

| Component | Technology |
|---|---|
| Hypervisor | VMware Workstation |
| Operating System | Rocky Linux 10.2 |
| Database | PostgreSQL 16.15 |
| Programming | Python |
| Automation | Bash / Ansible |
| Version Control | Git / GitHub |
| Database Proxy | HAProxy |
| Connection Pooling | PgBouncer |
| Monitoring | To be implemented |

## Initial PostgreSQL Node

| Node | IP Address | Role |
|---|---|---|
| pg-node1 | 192.168.50.10 | Initial PostgreSQL node |

Additional nodes will be added as the project progresses.

## Network Design

The lab uses separate VMware networks for management/Internet
connectivity and private database communication.

### Management Network

- Network: `192.168.10.0/24`
- Connection type: VMware NAT

### Private Database Network

- Network: `192.168.50.0/24`
- Connection type: VMware Host-only
- PostgreSQL nodes will communicate over this network.

## Project Status

Current stage:

- [x] Rocky Linux installed
- [x] Hostname configured
- [x] Management network configured
- [x] Private database network configured
- [x] Firewall zones configured
- [x] PostgreSQL 16.15 installed
- [x] PostgreSQL database cluster initialized
- [ ] PostgreSQL service configuration
- [ ] Database and user configuration
- [ ] Python client
- [ ] Load generator
- [ ] Performance testing
- [ ] PostgreSQL replication
- [ ] HAProxy
- [ ] PgBouncer
- [ ] Monitoring
- [ ] Failure testing
- [ ] Recovery testing
- [ ] Automation
- [ ] Final documentation
