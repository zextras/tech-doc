To create a new domain, fill in the form that opens upon clicking the
|create| button.

.. card:: Options for Domain ``acme.example``

   Multiple types of options are available during the creation of a new
   domain, grouped in several sections:

   General information
     The only mandatory data to supply it the domain name, which is its
     FQDN. All other data are optional and can be set at a later point.

     Important options that can be configured during the domain
     creation are the total number of accounts that can be managed for
     the domain and the e-mail quota. Also a description can be
     added.

   GAL settings
     Except for the :abbr:`GAL (Global Address List)` mode, currently
     only **Internal**, it is possible to define the account used to
     synchronise GAL information, the mail server used, which must be
     on the same domain (or in a compatible one, i.e., in a valid
     alias URL, see section :ref:`ap-vhost` below).

   These two groups of options can be seen in
   :numref:`fig_ap-new-domain-top`.

   COS
     The default Class of Service that will be applied to new accounts
     in the domain.

   Delegated Administration
     Allow users to become Administrators of the Domain.

   Domain System Notification
     Provide two e-mail addresses: the *Notification Sender* will
     appear as the sender of the e-mail while the second is the
     address to which the e-mail will be delivered.

     .. hint:: The *Notification Sender* can be also a non-existent
        but meaningful address, for example, mailbox-hq@example.com,
        to allow for filtering on the destination side.

   These options can be seen in :numref:`fig_ap-new-domain-bottom`.

   .. grid:: 1 1 2 2
      :gutter: 1

      .. grid-item::
         :columns: 6

         .. _fig_ap-new-domain-top:

         .. figure:: /img/adminpanel/new-domain.png
            :width: 99%
            :align: left
            :name: fig-apnd-1

            New Domain: general options and GAL

      .. grid-item::
         :columns: 6

         .. _fig_ap-new-domain-bottom:

         .. figure:: /img/adminpanel/new-domain-2.png
            :width: 99%
            :align: right

            New Domain: COS and delegated Admins

Further configuration option for the domain, including how to
configure authentication and accounts in the domain, can be found in
the :ref:`ap-domain-details` section.
