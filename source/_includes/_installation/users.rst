.. _create-admin-user:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 6. Create System User (Optional)
   ^^^^^

   In order to create a password for the ``zextras@carbonio.local``
   user, log in to a shell terminal as the ``zextras`` user and
   execute these two commands. The first allows to switch to the
   ``zextras`` user, with the second you actually change the password.

   .. code:: console

      # su - zextras
      # zmprov setpassword zextras@carbonio.local newpassword

   Make sure that ``newpassword`` meets good security criteria.

   .. rubric:: The ``zextras`` and ``zextras@carbonio.local`` users

   There is a clear distinction between these two users, which are
   intended to execute different tasks:

   ``zextras``
      This the **unix** account of the administrator and must be
      used to carry out administrative tasks from the command line.

   ``zextras@carbonio.local``
      This is the default administrator user to be used to access
      the Admin UI and manage |product| from the web interface.
