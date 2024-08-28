echo '' > user_provisioning.cmd;
for p in $(cat user_provisioning.csv);
do
    IFS=', ' read -r -a array <<< "$p"
    echo 'ca' ${array[0]}' "" givenName "'${array[1]}'" sn "'${array[1]}'"'  'zimbraPasswordMustChange TRUE displayName "'${array[1]} ${array[2]}'"' >> user_provisioning.cmd
done
