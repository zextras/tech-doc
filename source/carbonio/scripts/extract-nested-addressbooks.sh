
for i in $(mysql -e "show databases like 'mboxgroup%'" -N -B);
	do echo "select mi.mailbox_id, mailbox.comment, mi.id, mi.name from $i.mail_item as mi, zimbra.mailbox as mailbox where mi.mailbox_id=mailbox.id and mi.parent_id <> 1 and mi.metadata like '%vti6ee';"; 
	done | mysql -B -N | awk '{print "zmsoap -z -m " $2 " FolderActionRequest/action @op=rename @id=" $3 " @name=" $4 "_" $3 }'

for i in $(mysql -e "show databases like 'mboxgroup%'" -N -B);
	do echo "select mi.mailbox_id, mailbox.comment, mi.id, mi.name from $i.mail_item as mi, zimbra.mailbox as mailbox where mi.mailbox_id=mailbox.id and mi.parent_id <> 1 and mi.metadata like '%vti6ee';"; 
	done | mysql -B -N | awk '{print "zmsoap -z -m " $2 " FolderActionRequest/action @op=move @id=" $3 " @l=1"}'
