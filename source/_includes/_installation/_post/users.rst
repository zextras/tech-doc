It is possible to manage the password of any user, including the
Administrators, from the CLI, a task that is mandatory to allow the
Global Admin (whose account's username is ``zextras@example.com``) the
first Web access to the |adminui|.

To change the password, log in to a shell terminal as the ``zextras``
user and execute the command

.. code:: console

   zextras$ carbonio prov sp zextras@example.com mynewsecurepassword

Make sure that ``mynewsecurepassword`` meets good security criteria!

A breakdown of the above command:

* :command:`carbonio prov` accesses the |carbonio| provisioning tool,
  which is used to manage accounts, domains, COS, and so on

* ``sp`` (short form of ``setPassword``) is the specific provisioning
  tool's subcommand to change a user's password
  
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
