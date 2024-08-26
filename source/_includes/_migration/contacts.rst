
We assume that the Contacts files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/opt/zextras/backup/` directory, in CSV Format, e.g.,
:file:`/opt/zextras/backup/user1@example.com.csv`,
:file:`/opt/zextras/backup/user1@acme.corp.csv`, and so on.

They can be imported into carbonio using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Contacts?fmt=csv&csvfmt=thunderbird-csv' /opt/zextras/backup/${account}.csv"; \
   done | carbonio

