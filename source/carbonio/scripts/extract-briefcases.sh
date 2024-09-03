
for i in $(mysql -e "show databases like 'mboxgroup%'" -N -B;); do echo "select mi.mailbox_id, mailbox.comment, mi.id, mi.name from $i.mail_item as mi, zimbra.mailbox as mailbox where mi.mailbox_id=mailbox.id and mi.parent_id=1 and mi.id <> 16 and mi.metadata like '%vti8ee';"; done | mysql -B -N | awk '{print "sm " $2 " renameFolder " $4 " /Briefcase/" $4 }'
