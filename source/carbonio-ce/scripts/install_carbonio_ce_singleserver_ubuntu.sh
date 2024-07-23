#!/bin/bash

#PRE-INSTALL STEPS

source /etc/os-release

HOST=$(hostname -f);
DOMAIN=$(hostname -d);
IP=$(hostname -i);

echo "Carbonio will be installed on ${HOST}, using ${DOMAIN} as default domain and ${IP} as public IP"

apt update -y

#INSTALL STEPS

package_name="carbonio-core"

if apt-cache search "$package_name" | grep -q "$package_name"; then
    echo "Start Carbonio installation"
#echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list;
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - ;

sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget -O- "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | gpg --dearmor | sudo tee /usr/share/keyrings/postgres.gpg > /dev/null
chmod 644 /usr/share/keyrings/postgres.gpg
sed -i 's/deb/deb [signed-by=\/usr\/share\/keyrings\/postgres.gpg] /' /etc/apt/sources.list.d/pgdg.list

PACKAGES="postgresql-16 service-discover-server carbonio-directory-server carbonio-proxy carbonio-webui carbonio-files-ui carbonio-mta carbonio-mailbox-db carbonio-appserver carbonio-user-management carbonio-files-ce carbonio-files-public-folder-ui carbonio-files-db carbonio-tasks-ce carbonio-tasks-db carbonio-tasks-ui carbonio-storages-ce carbonio-preview-ce carbonio-docs-connector-ce carbonio-docs-connector-db carbonio-docs-editor carbonio-prometheus carbonio-message-broker  carbonio-ws-collaboration-ce carbonio-ws-collaboration-db carbonio-ws-collaboration-ui"

echo '' > config.conf
apt update -y -q
apt upgrade -y -q
apt install -y $PACKAGES 

carbonio-bootstrap -c ./config.conf

CONSUL_SECRET="$(openssl rand -base64 14 | tr -dc '[:alnum:]\n\r')"
POSTGRES_SECRET="$(openssl rand -base64 14 | tr -dc '[:alnum:]\n\r')"

service-discover setup $(hostname -i) --password=$CONSUL_SECRET 

export CONSUL_HTTP_TOKEN=$(echo $CONSUL_SECRET | gpg --batch --yes --passphrase-fd 0 -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r);
export SETUP_CONSUL_TOKEN=$CONSUL_HTTP_TOKEN

pending-setups --execute-all

su - postgres -c "psql --command=\"CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER encrypted password '$POSTGRES_SECRET';\""
su - postgres -c "psql --command=\"CREATE DATABASE carbonio_adm OWNER carbonio_adm;\""

PGPASSWORD=$POSTGRES_SECRET carbonio-files-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-tasks-db-bootstrap carbonio_adm 127.0.0.1
PGPASSWORD=$POSTGRES_SECRET carbonio-ws-collaboration-db-bootstrap carbonio_adm 127.0.0.1

PACKAGES="carbonio-message-dispatcher-db "
apt install -y $PACKAGES
pending-setups --execute-all
PGPASSWORD=$POSTGRES_SECRET carbonio-message-dispatcher-db-bootstrap carbonio_adm 127.0.0.1

PACKAGES="carbonio-message-dispatcher"
apt install -y $PACKAGES
PGPASSWORD=$POSTGRES_SECRET carbonio-message-dispatcher-migration carbonio_adm 127.0.0.1 20000

PACKAGES="carbonio-videoserver-ce"
apt install -y $PACKAGES
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
