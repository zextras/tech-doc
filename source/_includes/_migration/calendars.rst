
We assume that the Calendar files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/tmp/backup/` directory, in ICS Format, e.g.,
:file:`/tmp/backup/user1@example.com.ics`,
:file:`/tmp/backup/user1@acme.corp.ics`, and so on.

They can be imported into |product| using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Calendar?fmt=ics' /tmp/backup/${account}.ics"; \
   done | carbonio
