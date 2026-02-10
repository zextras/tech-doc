You should adhere to the following guidelines when installing a
|product| infrastructure.

* Components must be deployed on a server that use **private IP**
  addresses for all internal communications

* Only the necessary service ports should be exposed to the public
  network (Internet): you need to keep **private** (i.e., unreachable
  from outside networks) the internal network interfaces of the server,
  and configure either port forwarding or firewall rules so that only
  the necessary ports (like for example HTTPS, SSH, or SMTP) are
  reachable from outside (Internet or remote networks).

* Do not forward ports for services that are not offered: for example,
  if you do not allow IMAP connections, do not expose the IMAP
  service's port.

* For enhanced security, restrict SSH access to the server, allowing
  connections only from authorised devices or specific IP addresses.

.. seealso:: Please refer to section :ref:`fw-ports` to learn which
   port you should forward from the Internet.
