#! /bin/bash

set -euxo pipefail

sudo su - postgres
initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
exit
sudo systemctl start postgresql
sudo systemctl enable postgresql
