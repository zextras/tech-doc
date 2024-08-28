echo '' > user_provisioning.cmd;
for p in $(cat user_provisioning.csv);
do
    IFS=', ' read -r -a array <<< "$p"
    echo 'ca' ${array[0]} ${array[1]} 'givenName "'${array[2]}'" sn "'${array[3]}'"'  'zimbraPasswordMustChange TRUE displayName "'${array[2]} ${array[3]}'"' >> user_provisioning.cmd
done
