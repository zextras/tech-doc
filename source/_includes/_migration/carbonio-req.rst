
* |product| must be up&running during the whole procedure

* To prevent any LDAP conflicts, |product| must be configured with a
  *local* domain, different from any domain that is going to be
  imported. You can use, for example, a domain like ``carbonio.local``

* All the CLI commands must be executed, unless differently specified,
  on the Node featuring the **Mailstore & Provisioning Role** as the
  ``zextras`` user
 
* All the files to be imported must be stored under directory
  :file:`/tmp/backup/` on the Mailstore and Provisioning Node
