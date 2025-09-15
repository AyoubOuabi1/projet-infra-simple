# Simple Infra Project (Vagrant + CentOS/Ubuntu)

This project demonstrates a minimal Vagrant-based lab with two virtual machines:

- `web-server` (Ubuntu) — serves a simple website from the `website/` folder.
- `db-server` (CentOS Stream) — runs MariaDB and holds a demo database `demo_db`.

Files of interest
- `Vagrantfile` — defines two machines, networking and synced folders.
- `scripts/provision-web-ubuntu.sh` — provisioning script for the web server.
- `scripts/provision-db-centos.sh` — provisioning script for the DB (installs MariaDB, creates DB and tables).
- `database/create-table.sql` and `database/insert-demo-data.sql` — schema and demo data.
- `website/` — simple site files (served by the web VM).

How to run

1. Make sure you have VirtualBox and Vagrant installed on your host.
2. From the project root run:

```powershell
vagrant up
```

This will create two VMs, run provisioning scripts and set up the web site and database.

How networking is configured

- The `web-server` has a `private_network` IP `192.168.56.10` and is configured to serve the contents of the `website/` folder on the VM's web server.
- The `db-server` has a `private_network` IP `192.168.56.20` and runs MariaDB on the default port 3306. The Vagrantfile also forwards the DB guest port 3306 to host port 3307 so you can connect from your Windows host at `127.0.0.1:3307`.

Verification and screenshots


- `images/webcapture.png` — a screenshot showing the web server page served in your host browser 
- `images/ping.png` — a screenshot showing `ping 192.168.56.20` executed from the web server, proving the web VM can reach the DB VM.
# Simple Infra Project (Vagrant + CentOS/Ubuntu)

This project demonstrates a minimal Vagrant-based lab with two virtual machines:

- `web-server` (Ubuntu) — serves a simple website from the `website/` folder.
- `db-server` (CentOS Stream) — runs MariaDB and holds a demo database `demo_db`.

Files of interest
- `Vagrantfile` — defines two machines, networking and synced folders.
- `scripts/provision-web-ubuntu.sh` — provisioning script for the web server.
- `scripts/provision-db-centos.sh` — provisioning script for the DB (installs MariaDB, creates DB and tables).
- `database/create-table.sql` and `database/insert-demo-data.sql` — schema and demo data.
- `website/` — simple site files (served by the web VM).

How to run

1. Make sure you have VirtualBox and Vagrant installed on your host.
2. From the project root run:

```powershell
vagrant up
```

This will create two VMs, run provisioning scripts and set up the web site and database.

How networking is configured

- The `web-server` has a `private_network` IP `192.168.56.10` and is configured to serve the contents of the `website/` folder on the VM's web server.
- The `db-server` has a `private_network` IP `192.168.56.20` and runs MariaDB on the default port 3306. The Vagrantfile also forwards the DB guest port 3306 to host port 3307 so you can connect from your Windows host at `127.0.0.1:3307`.

Verification and screenshots


- `images/webcapture.png` — a screenshot showing the web server page served in your host browser 
- `images/ping.png` — a screenshot showing `ping 192.168.56.20` executed from the web server, proving the web VM can reach the DB VM.
