#!/bin/bash

#PRE-INSTALL STEPS
subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

source /etc/os-release

HOST=$(hostname -f);
DOMAIN=$(hostname -d);
IP=$(hostname -i);

echo "Carbonio will be installed on ${HOST}, using ${DOMAIN} as default domain and ${IP} as public IP"

echo "Selinux will be set to ENFORCE"
echo -e "SELINUX=permissive \nSELINUXTYPE=targeted \n" > /etc/selinux/config
getenforce

systemctl stop firewalld.service

dnf update -y

#INSTALL STEPS
package_name="carbonio-core"

if yum list available "$package_name" | grep -q "$package_name"; then
    echo "Start Carbonio installation"

dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm;
dnf -qy module disable postgresql;
dnf -y install postgresql16 postgresql16-server;
/usr/pgsql-16/bin/postgresql-16-setup initdb;
systemctl enable --now postgresql-16;

PACKAGES="service-discover-server carbonio-directory-server carbonio-catalog-service carbonio-proxy carbonio-webui carbonio-files-ui carbonio-mta carbonio-mailbox-db carbonio-appserver carbonio-user-management carbonio-files-ce carbonio-files-public-folder-ui carbonio-files-db carbonio-tasks-ce carbonio-tasks-db carbonio-tasks-ui carbonio-storages-ce carbonio-preview-ce carbonio-docs-connector-ce carbonio-docs-connector-db carbonio-docs-editor carbonio-prometheus carbonio-message-broker  carbonio-ws-collaboration-ce carbonio-ws-collaboration-db carbonio-ws-collaboration-ui"

echo '' > config.conf
dnf install -y $PACKAGES 

carbonio-bootstrap -c ./config.conf

CONSUL_SECRET="$(openssl rand -base64 14 | tr -dc '[:alnum:]\n\r')"
POSTGRES_SECRET="$(openssl rand -base64 14 | tr -dc '[:alnum:]\n\r')"

service-discover setup $(hostname -i) --password=$CONSUL_SECRET 

export CONSUL_HTTP_TOKEN=$(echo $CONSUL_SECRET | gpg --batch --yes --passphrase-fd 0 -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r);
export SETUP_CONSUL_TOKEN=$CONSUL_HTTP_TOKEN

pending-setups --execute-all

su - postgres -c "psql --command=\"CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER encrypted password '$POSTGRES_SECRET';\""
su - postgres -c "psql --command=\"CREATE DATABASE carbonio_adm OWNER carbonio_adm;\""

sed -i 's/ident/md5/g' /var/lib/pgsql/16/data/pg_hba.conf
systemctl reload postgresql-16

PGPASSWORD=$POSTGRES_SECRET carbonio-files-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-tasks-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-ws-collaboration-db-bootstrap carbonio_adm 127.0.0.1


PACKAGES="carbonio-message-dispatcher-db "
dnf install -y $PACKAGES
pending-setups --execute-all
PGPASSWORD=$POSTGRES_SECRET carbonio-message-dispatcher-db-bootstrap carbonio_adm 127.0.0.1

PACKAGES="carbonio-message-dispatcher"
dnf install -y $PACKAGES
PGPASSWORD=$POSTGRES_SECRET carbonio-message-dispatcher-migration carbonio_adm 127.0.0.1 20000

dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

PACKAGES="carbonio-videoserver-ce"
dnf install -y $PACKAGES
pending-setups --execute-all
 

sudo -iu zextras -- bash <<EOF
	carbonio prov mcf zimbraDefaultDomainName \$(hostname -d)
	carbonio prov md  \$(hostname -d) zimbraVirtualHostname \$(hostname -d)
	carbonio prov mc default carbonioFeatureChatsEnabled TRUE
EOF


#echo service discover and postgresql passwords
echo -e "The service-discover password is: \e[1m $CONSUL_SECRET \e[0m" 
echo -e "You can find it in file \e[3m/var/lib/service-discover/password\e[0m."
echo ""
echo -e "The PostgreSQL passowrd (DB_ADM_PWD) is: \e[1m$POSTGRES_SECRET\e[0m"
echo "Please store it in a safe place, otherwise you will need to reset it!"

else
    echo "###### Carbonio repo are not configured. ######"
fi

