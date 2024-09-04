echo '' > user_provisioning.cmd
export USERPASS="Apsw4llUs3rs";
for p in $(cat user_provisioning.csv); do
    IFS=', ' read -r -a array <<< "$p"
    echo 'ca' ${array[0]} $USERPASS 'givenName "'${array[1]}'" sn "'${array[2]}'"'  'zimbraPasswordMustChange TRUE displayName "'${array[1]} ${array[2]}'"' >> user_provisioning.cmd
done
