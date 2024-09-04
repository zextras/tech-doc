Global e-mail attachment settings allow you to specify global rules
for handling attachments of an e-mail message.

.. card:: Modify list of blocked file extensions

   You can set rules at COS-level and also for individual accounts. When
   attachment settings are configured in Global Settings, the global rule
   takes precedence over COS and Account settings.

   A list of formats (extensions) can be created via CLI to restrict the attachments
   allowed.

   .. warning:: All files whose extension is in the list will **never**
      reach the recipient.

   For example, to block ``.exe`` filex, use command

   .. code:: console

      # carbonio prov mcf +zimbraMtaBlockedExtension "exe"

   .. hint:: Only one format/extension at a time can be specified.

.. card:: Manage attachments' size

   It is possible to limit both the size of a message and its
   attachment and their individual sizes.

   The total size of the message can be set for each MTA server
   directly on the |adminui|, in the **Tuning** section under
   :menuselection:`Admin Panel --> MTA --> Advanced`, see
   :ref:`ap-mta-adv`.

   The maximum size of each attachment can be set by the CLI for each
   user, CoS, or domain issuing as the ``zextras`` user

   .. code:: console

      zextras$ carbonio prov ma alice@example.com zimbraFileUploadMaxSizePerFile 1048574

   This command prevents Alice to sent an attachment larger that 10Mb.
