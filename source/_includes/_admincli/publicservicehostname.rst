
.. index:: ! Public Service Hostname; by CLI
.. index:: ! PublicServiceHostname; by CLI

.. card:: ``zimbraPublicServiceHostname``

   The LDAP attribute ``zimbraPublicServiceHostname`` is used to
   define the **publicly accessible hostname** that |product| uses
   when generating URLs for public services like:

   * Sharing: When users share folders, the URLs generated for
     external access will use this hostname

   * REST APIs It is used as the base hostname for RESTful API
     endpoints

   * Login redirection

   It connects clients to a user-friendly public-facing hostname for
   services, which might be different from the internal server or
   service hostname.

   For example, if your |product| Proxy has an internal hostname like
   ``server1.internal.example.lan``, you might set
   ``zimbraPublicServiceHostname`` to ``mail.example.com`` so that
   links appear as ``https://mail.example.com/...`` instead of
   exposing the internal hostname.

   Along with zimbraPublicServiceHostname, the folllowing related
   attributes are to configured for public service URLs.

.. card:: ``zimbraPublicServiceProtocol``

   It specifies the protocol to use (``https``).

.. card:: ``zimbraPublicServicePort``

   It specifies the port to use (443).

These three attributes together define the base URL to publish all
services; you can manage them at domain level using the command-line
tools as the |zu|, for example:

.. code:: console

   zextras$ carbonio prov md example.com zimbraPublicServiceHostname \
   mail.example.com zimbraPublicServiceProtocol https \
   zimbraPublicServicePort 443

.. card::  zimbraVirtualHostname

   Additionaly you should also specify the
   ``zimbraVirtualHostname``. As the |zu| execute

   .. code:: console

      zextras$ carbonio prov md example.com zimbraVirtualHostname

   The value of this attribute allow to

   Login without Domain
      When zimbraVirtualHostname is set for a domain, users associated
      with that domain might be able to log in to the webmail
      interface using just their username (without needing to append
      @example.com).

   Use Server Name Indication (SNI) for SSL
      In environments hosting multiple domains with separate SSL
      certificates and sharing the same IP address,
      zimbraVirtualHostname plays a crucial role in Server Name
      Indication (SNI). It helps the server identify which SSL
      certificate to present based on the hostname the user is trying
      to connect to.
