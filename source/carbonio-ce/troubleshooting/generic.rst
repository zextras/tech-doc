.. _ts-generic:

Generic Issues
==============

This section contains advices and directions to deal with generic
issues that may arise in everyday |product| use.

* There are :ref:`warning messages about SLF4J <upgrade-logging>` in
  the log files
* |product| version in the |adminui| and on the CLI :ref:`do not match
  <ts-version>`

.. include:: /_includes/_ts/issue-logging.rst

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

   The output will report the actual version, for example::

     zextras@example:~$ zmcontrol -v
     Carbonio Release 24.9.0
