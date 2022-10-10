.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _create-admin-user:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   (Optional) Change Password for System User
   ^^^^^

   In order to change the password used by the
   ``zextras@carbonio.local`` user for the Web access, log in to a
   shell terminal as the ``zextras`` user and execute these two
   commands. The first allows to switch to the ``zextras`` user, with
   the second you actually change the password.

   .. code:: console

      # su - zextras
      # carbonio prov setpassword zextras@carbonio.local newpassword

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
