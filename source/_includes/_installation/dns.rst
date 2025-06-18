This section collects all DNS-related settings, which are crucial in
the setup of |product|, and examples to correctly verify them. To set
them, you can use the DNS console of your domain administration panel.

The most important settings, which is mandatory for a Multi-Node
setup, is that each Node must be able to carry out DNS resolution
autonomously and be able to resolve all other Nodes' IP addresses.

In the remainder of this section, we assume that your |product|
infrastructure has public IP **203.0.113.124** and FQDN
**mail.example.com**.

The list of settings that are shown in this page includes: :ref:`DNS A
record <dns-a>`, :ref:`DNS MX record <dns-mx>`, :ref:`DNS PTR record
<dns-ptr>`, and a few TXT records, namely :ref:`SPF <dns-spf>`,
:ref:`DMARC <dns-dmarc>`, and :ref:`DKIM <dns-dkim>`; the latter has a
dedicated subsection, including commands to verify its correct
setup.

.. note:: While the ``A``, ``MX`` and ``PTR`` records must be
   configured for the proper functioning of |product| of, TXT records
   are not required, but it is recommended to configure them, because
   they are used by most providers to block spam and unsolicited
   e-mails.

.. _dns-a:

.. card:: ``A`` record

   The whole |product| infrastructure must have at least **one public
   IP address**. The IP address must have a domain name associated,
   that coincides with the **A record** in the DNS (e.g., ``A
   mail.example.com``)

   You can check a domain's A record using the CLI utility
   :command:`host`:

   .. code:: console

      # host -t A mail.example.com

.. _dns-mx:

.. card:: ``MX`` Record

   To allow the mail server to receive mail, it will be necessary to
   set up an **MX record**, which must correspond to the A record
   (e.g. MX: example.com = mail.example.com )

   You can check a domain's MX record using the CLI utility
   :command:`host`:

   .. code:: console

      # host -t MX example.com

   If either of the ``A`` or ``MX`` records is not correctly
   configured, the installation will be temporarily suspended to allow
   the change of the hostname.

.. _dns-ptr:

.. card:: ``PTR`` Record

   To allow remote mail server to verify the IP address of your
   |product| infrastructure, which is important for spam filtering,
   you should also configure the PTR record.

   You can check a domain's MX record using CLI utility :command:`dig`:

   .. code:: console

      # dig -x 203.0.113.124

.. _dns-spf:

.. card:: SPF

   **S**\ender **P**\olicy **F**\ramework* is a TXT record used to
   prevent e-mail spoofing. It contains a string of allowed domain
   server that are allowed to send e-mails from the domain

   You can check a domain's MX record using CLI utility
   :command:`host`:

   .. code:: console

      # host -t TXT example.com

   The output should be similar to::

     example.com. IN TXT "v=spf1 ip4:203.0.113.124 include:_spf.yourprovider.com -all"

.. _dns-dmarc:

.. card:: DMARC

   **D**\omain-based **M**\essage **A**\uthentication, *R**\eporting,
   *and **C**\onformance is an additional TXT record that works in
   conjunction with SPF And DKIM to provide additional protection
   against e-mail spoofing and phishing.

   You can check a domain's MX record using CLI utility :command:`dig`:

   .. code:: console

      # dig TXT _dmarc.example.com

   The output should be similar to::

     _dmarc.example.com. IN TXT "v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@example.com"
