* |product| must be up&running during the whole procedure and the Backup
  must be initialized

* To prevent any LDAP conflicts, we suggest to configure |product| with a
  *local* domain, different from any domain that is going to be
  imported. You can use, for example, a domain like ``carbonio.local``

* All the CLI commands must be executed, unless differently specified,
  on the Node featuring the **Mailstore & Provisioning Role** as the
  ``zextras`` user

* Source backup must be available from ``zextras`` user and must not use
  Carbonio backup path
