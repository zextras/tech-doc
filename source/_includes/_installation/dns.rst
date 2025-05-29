This section collects all DNS-related settings, which are crucial in
the setup of |product|, the activities to correctly implement them.


#. The whole |product| infrastructure must have at least **one public
   IP address**. The IP address must have a domain name associated,
   that coincides with the **A record** in the DNS (e.g., ``A
   mail.example.com``)

   .. hint:: You can check a domain's A record using the CLI utility
      ``host``:

      .. code:: console

         # host -t A mail.example.com

#. To allow the mail server to receive mail, it will be necessary to
   set up an **MX record**, which must correspond to the A record
   (e.g. MX: example.com = mail.example.com )

   .. hint:: You can check a domain's MX record using the CLI utility
      ``host``:

      .. code:: console

         # host -t MX example.com

   If either of the ``A`` or ``MX`` records is not correctly
   configured, the installation will be temporarily suspended to allow
   the change of the hostname.

#. To allow remote mail server to verify the IP address of your
   |product| infrastructure, which is important for spam filtering,
   you should also configure your PTS record.

   .. hint:: You can check a domain's MX record using either CLI utility
      :command:`dig -x` or :command:`nslookup`:

      .. code:: console

         # nslookup MX 203.0.113.124

      Assuming the your public IP address is **203.0.113.124**, the
      output of the command must contain ``mail.example.com``.

#. Each Node must be able to carry out DNS resolution autonomously and
   be able to resolve all other Nodes

#. For improved security of sending emails, you should also define TXT
   records for SPF, DKIM and DMARC

.. include:: /_includes/_installation/dkim.rst
