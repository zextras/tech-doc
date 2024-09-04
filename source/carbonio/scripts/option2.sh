echo '' > user_provisioning.cmd;
for p in $(cat user_provisioning.csv);
do
    IFS=', ' read -r -a array <<< "$p"
    echo 'ca'  ${array[0]} "''" givenName "'${array[1]}'" sn "'${array[2]}'" displayName "'${array[3]}'" zimbraPrefPasswordRecoveryAddress ${array[4]} zimbraPrefPasswordRecoveryAddressStatus verified zimbraFeatureResetPasswordStatus enabled >> user_provisioning.cmd
done
