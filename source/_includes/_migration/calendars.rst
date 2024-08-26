
We assume that the Calendar files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/opt/zextras/backup/` directory, in ICS Format, e.g.,
:file:`/opt/zextras/backup/user1@example.com.ics`,
:file:`/opt/zextras/backup/user1@acme.corp.ics`, and so on.

They can be imported into |product| using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Calendar?fmt=ics' /opt/zextras/backup/${account}.ics"; \
   done | carbonio
