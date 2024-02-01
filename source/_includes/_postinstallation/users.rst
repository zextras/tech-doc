.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

In order to change the password used by the ``zextras@example.com``
user for the Web access, log in to a shell terminal as the ``zextras``
user and execute the command

.. code:: console

   # su - zextras -c "carbonio prov setpassword zextras@example.com mynewsecurepassword"

Make sure that ``newpassword`` meets good security criteria.

.. card:: The ``zextras`` and ``zextras@example.com`` users

   There is a clear distinction between these two users, which are
   intended to execute different tasks:

   ``zextras``
      This the **unix** account of the administrator and must be used to
      carry out administrative tasks from the command line.

   ``zextras@example.com``
      This is the default administrator user to be used to access the
      Admin UI and manage |product| from the web interface.


A new Global Admin can be created from the |adminui|;  please refer to
section :ref:`ap-new-admin` for directions.
