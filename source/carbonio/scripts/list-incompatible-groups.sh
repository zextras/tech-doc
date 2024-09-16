echo -e "User\tAddressBook folder\tGroupName\n"
for i in $(mysql -e "show databases like 'mboxgroup%'" -N -B);
     do echo "select mailbox.comment, folder.name, TRIM(TRAILING ':' from (SUBSTRING_INDEX(SUBSTRING_INDEX(mi.metadata, 'fullName', 1),':',-2)))  from $i.mail_item as mi, $i.mail_item as folder, zimbra.mailbox as mailbox where mi.mailbox_id=mailbox.id and folder.mailbox_id=mailbox.id and  folder.id=mi.folder_id and  mi.metadata like 'd3:fldd6:fileA%' and (mi.metadata like '%d1:t1:C%' or mi.metadata like '%d1:t1:G%');"; done | mysql -B -N 

echo """
NB: the folder refers the one that contains the incompatible group, but this could be nested

in order to make those groups available in the destination, the user need to extract them as CSV an import them back
"""

