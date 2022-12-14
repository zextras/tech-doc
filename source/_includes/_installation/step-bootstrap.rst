.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Once all packages have been installed, use the following command to
configure and launch |product|.

.. code:: console

   # carbonio-bootstrap

Before finalising the bootstrap, press :bdg-dark-line:`y` to apply the
configuration. The process will continue until its completion:
click :bdg-dark-line:`Enter` to continue.

.. dropdown:: What does ``carbonio-bootstrap`` do?

   This command makes a few checks and then starts the
   installation, during which a few messages are shown,
   including the name of the log file that will store all
   messages produced during the process::

     Operations logged to /tmp/zmsetup.20211014-154807.log

   In case the connection is lost during the installation, it is
   possible to log in again and check the content of that file
   for information about the status of the installation. If the
   file does not exist anymore, the installation has already
   been completed and in that case the log file can be found in
   directory :file:`/opt/zextras/log`.

   The first part of the bootstrap enables all necessary
   services and creates a new administrator account
   (zextras\@mail.example.com), initially **without password**
   (see below for instruction to set it).
