
To import |dl|\s, you need to export them in a CSV file,
called :file:`dl_provisioning.csv`, that has this format::
  
  distibution_list1@example.io,Description1,Name1,email_1@example.io,email_2@example.io,
  distibution_list2@example.io,Description2,Name2,email_2@example.io,email_4@example.io,email_5@example.io
  distibution_list3@example.io,Description3,Name3,email_3@example.io,email_6@example.io,email_7@example.io,email_8@example.io

The first three fields are parsed as the Distribution List's address,
Description, and Name, respectively, and they are reflected in the
|adminui|. All remaining fields, whose number may vary, are the e-mail
addresses that are member of the Distribution List.

As the ``zextras`` user, execute the following script, which will
create a command file that will be fed to :command:`carbonio` later:

.. dropdown:: |dl|\s Migration Script
   :open:
         
   :download:`/scripts/dl.sh`

   .. literalinclude:: /scripts/dl.sh

Once the script has been successfully executed, it will output file
:file:`dl_provisioning.cmd`, which can be given to :command:`carbonio` as
input.

.. code:: console

   zextras$ carbonio prov -f dl_provisioning.cmd

Alternatively, you can create manually each Distribution List as
follows. Taking the first list from the :file:`dl_provisioning.csv`
file above as example, as the ``zextras`` user, enter the |carbonio|
shell with command :command:`carbonio`, then issue the following
commands.

.. code:: console

   carbonio> prov cdl distibution_list1@example.io displayName Name1 \
   description Description1
   carbonio> prov adlm email_1@example.io
   carbonio> prov adlm email_2@example.io
