An important note: systemd vs. zmcontrol
========================================

**Systemd** and the legacy ``zmcontrol`` domain are mutually exclusive.

You cannot use both at the same time.

If any systemd target is enabled, attempting to run ``zmcontrol`` or any legacy control script will produce 
a warning message.

.. warning:: Similarly, attempting to start a service with ``systemctl`` on Ubuntu 22.04 or Red Hat 8 infrastructure
   (thus with the services still managed by ``zmcontrol``) will lead to failed startup of services and possible damage
   done to the infrastructure.

Technical Highlights
====================

- ``carbonio-configd.service`` is a prerequisite for most services; it must be up to provide generated configuration.
- All services wait for the unit ``carbonio-configd.service`` before starting.
- The only exception is ``carbonio-openldap.service``, which can start independently.
- LDAP availability is checked before ``carbonio-configd.service`` activates.
- Only ``carbonio-directory-server.target`` can safely start without ``carbonio-configd``.