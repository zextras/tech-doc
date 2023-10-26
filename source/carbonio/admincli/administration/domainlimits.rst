.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _domain-limits:

Domain Limits
=============

Domain Limit Management allows a Global Administrator to set domain
level limits that cannot be exceeded by any Administrator. The only
way to exceed a Domain Limit is to change the Domain Limit itself.


.. card::

   Available Domain Limits
   ^^^^^

   The following types of domain limits can be configured on

   -  Global Account Limit: The maximum number of accounts that can be
      created on this domain.

   -  Domain Quota: The maximum mailbox quota that any Administrator can
      grant to a mailbox in the domain.

   -  COS Limits: Define which Classes of Service can be used for users in
      the domain and the maximum number of users per Class of Service.

This feature is currently available from the Command Line Interface
only. therefore to modify the values of these domain limits, the
following commands can be used.


.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::
      :columns: 6
                
      Edit the Limits of a Domain
      ^^^^^

      To edit the limits of a domain through the CLI, use the
      ``setDomainSettings`` command.

      .. card::

         .. include:: /_includes/_carboniocli/carbonio_admin_setDomainSettings.rst

   .. grid-item-card::
      :columns: 6
                

      Reset the Limits of a Domain
      ^^^^^

      To reset the limits of a Domain through the CLI, use the
      ``resetDomainSettings`` command:


      .. card::

         .. include:: /_includes/_carboniocli/carbonio_admin_resetDomainSettings.rst
