echo -e "User\tAddressBook folder\tGroupName\n"
for i in $(mysql -e "show databases like 'mboxgroup%'" -N -B);
do
  echo "
  SELECT 
    mailbox.comment, 
    folder.name, 
    TRIM(TRAILING ':' FROM 
        CASE
            WHEN RIGHT(TRIM(TRAILING ':' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(mi.metadata, 'fullName', 1), ':', -2)), 1) = '8'
            THEN LEFT(TRIM(TRAILING ':' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(mi.metadata, 'fullName', 1), ':', -2)), LENGTH(TRIM(TRAILING ':' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(mi.metadata, 'fullName', 1), ':', -2))) - 1)
            ELSE TRIM(TRAILING ':' FROM SUBSTRING_INDEX(SUBSTRING_INDEX(mi.metadata, 'fullName', 1), ':', -2))
        END
    ) AS group_name
  FROM $i.mail_item AS mi
  JOIN $i.mail_item AS folder ON folder.id = mi.folder_id
  JOIN zimbra.mailbox AS mailbox ON mi.mailbox_id = mailbox.id AND folder.mailbox_id = mailbox.id
  WHERE mi.metadata LIKE 'd3:fldd6:fileA%' 
    AND (mi.metadata LIKE '%d1:t1:C%' OR mi.metadata LIKE '%d1:t1:G%');
  ";
done | mysql -B -N


echo """
NB: the folder refers the one that contains the incompatible group, but this could be nested

in order to make those groups available in the destination, the user need to extract them as CSV an import them back
"""

