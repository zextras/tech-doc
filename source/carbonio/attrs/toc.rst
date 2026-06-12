Carbonio Directory Attributes
=============================

This section provides a complete reference of all Carbonio directory attributes,
including classes, object classes, flags, and metadata filters.

....

This reference is interactive and opens in a dedicated web tool.


.. card:: Carbonio Attributes Table
   :link: ../../../attr/index.html
   :link-type: url
   :class-title: sd-font-weight-bold

   - Attributes (interactive table with search and filters)
   - Object classes view
   - Faceted filtering by class, type, flags, and state



About Carbonio attributes
-------------------------

Carbonio uses a comprehensive set of LDAP (Lightweight Directory Access Protocol) attributes
to store configuration settings, metadata, and operational information across all platform components.
These attributes define the behavior and properties of accounts, domains, distribution lists, servers, services, and other Carbonio objects.

Directory attributes control a wide range of functionality, including user account settings, authentication and security policies, mailbox
features, service configuration, quota management, server provisioning, and routing rules. Together with LDAP object classes, they form the
foundation of Carbonio's configuration model.

Administrators typically manage these attributes through the Carbonio Admin Console or by using Command Line Interface (CLI).
While many attributes are configured automatically during deployment and routine administration, understanding their purpose
and relationships can be essential when troubleshooting issues, performing advanced configurations, developing integrations, or automating
administrative tasks.

This reference provides a searchable catalog of Carbonio directory attributes and object classes, allowing administrators and developers
to quickly locate attribute definitions, identify associated object classes, review attribute properties and flags, and understand how
configuration data is stored within the Carbonio directory.