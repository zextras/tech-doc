
The most functional and standard way to read from the Source and write
into the Destination is to use the IMAP protocol. For this reason, we
suggest `imapsync <https://imapsync.lamiral.info/>`_ as the tool to
perform IMAP migration.

.. hint:: We suggest not to use the Global Administrator account to
   perform this task, but to create temporary Administrator accounts
   in the Source and in the Destination to be used for the purpose of
   import process only, so you can safely remove them once the
   synchronisation has been completed, to keep the Administrators'
   action history clear. These will be denoted as
   **SOURCE_ADMIN_ACCOUNT** and **CARBONIO_IMPORT_ACCOUNT** in the
   command below.

We assume that you have already obtained credentials of an account
that can access all the accounts on the Source, and you have already
created a Global Administrator to be used for the import only.

In the following command, that must be executed on the Node hosting
|carbonio| Mails and Calendar, replace all values written in
**ALL_CAPS** with corresponding values, suitable for your
infrastructure.

.. seealso:: The command uses the official imapsync’s docker image;
   to download it or to learn on alternative approaches (e.g., if you
   want to install and use imasync) and documentation, please refer to
   `imapsyncs's official documentation
   <https://imapsync.lamiral.info/#doc>`_.

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   docker run --rm gilleslamiral/imapsync imapsync \
   --host1 SOURCE_ENDPOINT_ADDRESS --ssl1 --user1 ACCOUNT --authuser1 SOURCE_ADMIN_ACCOUNT --password1 SOURCE_ADMIN_PASSWORD \
   --host2 CARBONIO_PROXY_NODE_IP --ssl2 --user2 ACCOUNT --authuser2 CARBONIO_IMPORT_ACCOUNT --password2 CARBONIO_IMPORT_ACCOUNT_PASSWORD; \
   done
