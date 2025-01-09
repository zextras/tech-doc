.. _ts-version:

.. card:: Carbonio version mismatch

   It can sometimes happen, especially after installing hotfixes, that
   there is a mismatch between the version of |product| shown in the
   |adminui| and in the output of the :command:`zmcontrol -v` CLI
   command.

   To understand which is the actual |product| version installed, you
   need to execute, as the ``zextras`` user, the command

   .. code:: console

      zextras$ zmcontrol -v

   In the output, you need to check the section starting with **Server
   version**.

   .. code-block:: text
      :linenos:
      :emphasize-lines: 3

       Server versions:

          version                                             24.9.1
          commit                                              68e2e5facf5fbcfc7be0b860e3a28356079e179d
          system_type                                         carbonio
          product                                             Carbonio
          zal_version                                         24.9.0
          zal_commit                                          5021945fc3d4d5c91c70598328d8d71eaa1b958e

   The actual |product| version is the one shown in the highlighted line.
