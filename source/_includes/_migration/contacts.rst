
We assume that the Contacts files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/tmp/backup/` directory, in CSV Format, e.g.,
:file:`/tmp/backup/user1@example.com.csv`,
:file:`/tmp/backup/user1@acme.corp.csv`, and so on.

The files to be imported must have the following format::

  "company","email","firstName","jobTitle","lastName","middleName","mobilePhone","namePrefix","nickname","workCity","workCountry","workPostalCode","workState","workStreet","workURL"
  "ACME","j.doe@example.com","john","CEO","doe","","","","Boss",“Vicenza”,“IT”,“36100”,"","","www.example.com"
  "ACME","m.jane@example.com","mary","CFO","jane","","+39 000000000","","MJ",“Vicenza”,“IT”,“36100”,"","","www.example.com"
  "ACME","p.sullivan@example.com","Peter","Head of HR","Sullivan","Raymond","","mr","Ray",“Vicenza”,“IT”,“36100”,"","","www.example.com"
  "ACME","d.smith@example.com","Donald","CTO","Smith",“”,"","","Don",“Vicenza”,“IT”,“36100”,“”,“”,"www.example.com"

They can be imported into |product| using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Contacts?fmt=csv&csvfmt=thunderbird-csv' /tmp/backup/${account}.csv"; \
   done | carbonio

CSV files can be also be imported manually by each user according to
the direction presented in the `Working with Contacts
<https://docs.zextras.com/user-guides/carbonio/en/html/contacts/toc.html#import-a-csv-file-as-an-address-book>`_
section of the User Guides.
