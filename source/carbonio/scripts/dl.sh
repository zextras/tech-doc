echo '' > dl_provisioning.cmd
for p in $(cat dl_provisioning.csv) ;
do 
    IFS=', ' read -r -a array <<< "$p"
    echo 'prov cdl' ${array[0]} 'description' ${array[1]} 'displayName' ${array[2]} >> dl_provisioning.cmd
    len=${#array[@]}
    for ((i=3; i<$len; i++))
    do
    	echo 'prov adlm' ${array[0]} ${array[$i]} >> dl_provisioning.cmd
    done
done
