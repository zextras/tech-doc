
===========================
 Architecture of |product|
===========================

:numref:`fig-cb-arch` shows the internal architecture of |product|
with all its components.

.. card::
   :width: 75%

   .. _fig-cb-arch:

   .. figure:: /img/carbonio/architecture_Carbonio.png
      :width: 100%

      Simplified architecture of |product|.

A typical |product| installation consists of various :term:`Components
<Component>` installed on one or multiple :term:`Nodes <node>`. Each
of the component depicted by the red boxes should be installed on a
different Node, while all the others can be combined and installed on
one or more Nodes. For example, if |vs| is heavily used, it could be a
good idea to install it on a dedicated node.

In :numref:`fig-cb-arch`, *dependencies* are denoted by the boxes piled
on top of the bottom one. In other words, all the ``*-UI`` packages,
which contain the files necessary to show the Module to the users,
**must be** installed on the Proxy Node.

.. hint:: ``-UI`` packages provide the front-end files to access the
   service from a browser or mobile app.

A special case is represented by the Postgres/DB-Connection
component. While |product| can be installed to communicate directly
with a Postgres database, it is suggested to install the **PgPool-II**
middleware in all Multi-Node scenarios, in order to be independent of
the underlying database(s) and be able to scale without the need to
configure multiple Postgres instances or even a Postgres cluster.

The use of **Pgpool-II** would therefore improve flexibility and
scalability in the management of the DB instance(s).

Supported Mail Protocols
========================

|product| supports the following protocols:

* POP3 and POP3S
* SMTP and its secure protocol SMTPS (SMTP over TLS/SSL)
* IMAP and its secure protocol IMAPS (IMAP over SSL)
