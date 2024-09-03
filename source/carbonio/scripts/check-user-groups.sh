
for i in $(mysql -e "show databases like 'mboxgroup%'" -N -B);
     do echo "select mi.mailbox_id, mailbox.comment, folder.name, mi.id, SUBSTRING_INDEX(SUBSTRING_INDEX(mi.metadata, 'fullName', 1),':',-2)  from $i.mail_item as mi, $i.mail_item as folder, zimbra.mailbox as mailbox where mi.mailbox_id=mailbox.id and folder.mailbox_id=mailbox.id and  folder.id=mi.folder_id and mi.folder_id <> 7 and mi.metadata like 'd3:fldd6:fileA%';"; done | mysql -B -N  | awk -F '\t' '{print "zmsoap -z -m " $2 " ContactActionRequest/action @op=move @l=7 @id=" $4  }'
