.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite admin doShowAdminActivity [param VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "admin (O)", "Account Name or ID", "", ""
   "action_name (O)", "String", "", ""
   "date_start (O)", "Date", "dd/MM/yyyy HH:mm:ss", ""
   "date_end (O)", "Date", "dd/MM/yyyy HH:mm:ss", ""
   "client_ip (O)", "String", "", ""
   "success (O)", "Boolean", "true | false", ""
   "show_admin_logins (O)", "Boolean", "true | false", "false"
   "max_results (O)", "Integer", "", "1000"
   "notification_mode (O)", "Multiple choice", "none | email |
   briefcase | both", "none"

\(M) == mandatory parameter,  (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin doShowAdminActivity admin john@example.com date_start 10/03/2013 notification_mode briefcase

Uploads a csv to the global admin’s briefcase containing all of John’s
activity recorded after 10/03/2013.

.. rubric:: Usage Example

::

   zxsuite admin doShowAdminActivity admin john@example.com date_start 10/03/2013 notification_mode briefcase

Same as before, but shows results in CLI instead of uploading a csv file
to briefcase.
