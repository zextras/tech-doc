.. _upgrade-lang:

.. card:: IMAP folders with UTF-8 characters

   If you subscribe to an IMAP folder whose name contains UTF-8
   characters, chances are that you fail, even if you already
   subscribed to that folder. The reason is a missing jar, that you
   need to :download:`download
   </common/download/zm-charset-22.5.0.jar>` and save in directory
   :file:`/opt/zextras/mailbox/jars/`.

   To verify the file's integrity, execute the command

   .. code:: console

      #  sha256sum zm-charset-22.5.0.jar

   The output of the command includes the SHA256 checksum of the file,
   which **must** be::

     13ce2d47274df3016ed8ec5d32439fc6a0c03d1dff04bd92e374bcc0ef049548
