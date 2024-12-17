
Moreover, a default |cos| and its status can be attached to the
domain.

.. card:: COS statuses

   A COS can be defined for a whole domain or an account and
   determines its status, that is, its ability to log in to the domain
   and access the e-mail. If the domain COS and a user's COS differ,
   the resulting status of the account is shown. Each COS can be
   defined with one of the following five values.

   #. **Active**. The COS is enabled, therefore the domain and its
      accounts can be used for everyday operations.

   #. **Closed**. The domain is shut down, no access is granted, and
      all incoming e-mails are rejected.

      .. hint:: This status overrides the individual accounts COS status.

   #. **Locked**. In this state, user access is not possible, unless
      individual accounts are marked as *Active*. Incoming e-mails are
      regularly delivered to the accounts.

   #. **Maintenance**. Users can not log in, their incoming e-mails
      are not delivered but are kept in a queue by the MTA.  If the
      account’s status is *closed*, it overrides the domain status
      setting, that is, the user's incoming e-mails are rejected.

   #. **Suspended**. A status similar to *maintenance*, with the
      difference that no accounts or distribution lists can be
      changed. If the account’s status is *closed*, it overrides the
      domain status setting, that is, the user's incoming e-mails are
      rejected.

We build on the domain created in :ref:`previous section
<ap-domain-new>` and attach some property.

.. grid:: 1 2 2 4
   :gutter: 1
   :outline:
   :padding: 3

   .. grid-item::
      :columns: 6

      .. grid:: 1 1 1 1
         :gutter: 1

         .. grid-item-card:: Public Service Protocol

            Force clients to connect only using ``https``.

         .. grid-item-card::  Time Zone

            The timezone is set to Hawaii's time.

         .. grid-item-card:: Default Class of Service

            The |cos| used by the domain, which is left to the ``default``
            one.

   .. grid-item::
      :columns: 6

      .. grid:: 1 1 1 1
         :gutter: 1

         .. grid-item-card:: Public Service Host Name
            :columns: 12
            :margin: 4 4 0 0

            It is the FQDN (``mail.acme.example``) used by clients to
            connect to the domain and must correspond to the DNS ``A``
            record to be reachable publicly. If the ``A`` record is set to a
            private IP address, to reach the WebGUI you need some mechanism,
            like e.g., a VPN tunnel.

   .. grid-item-card::
      :columns: 12

      .. image:: /img/adminpanel/domain-details.png
         :scale: 50
         :align: center

At the bottom of the page, button :red:`DELETE DOMAIN` allows to
delete the domain. When clicked, a dialog will open, listing all items
defined on the domain (Accounts, Distribution Lists, Resources, and so
on) and that will be deleted together with the domain. Two choices are
available: to **Close** the domain, keeping all items but preventing
access, or **Remove** the domain and all its items.

.. warning:: The removal of the domain is an operation that can not be
   undone: all the items are gone forever.
