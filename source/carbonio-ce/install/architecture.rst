
===========================
 Architecture of |product|
===========================

:numref:`fig-ce-arch` shows the internal architecture of |product|
with all its components.

.. card::
   :width: 75%

   .. _fig-ce-arch:

   .. figure:: /img/carbonio/architecture_CE.png
      :width: 100%

      Simplified architecture of |product|.

While in Single-Server all packages are installed on the same node, in
a typical Multi-Server each of the services depicted by the red boxes
should be installed on a dedicated node, while all the others can be
combined and installed on any node, even on dedicated one. For
example, **User Management** can be installed on the Proxy node
instead of on a dedicated node.  In the :ref:`Example scenario
<multiserver-installation>` we use as example, we show how to set up a
cluster of *five* :term:`Nodes <node>` and combine the various |product|'s
roles. A :term:`component` is a functionality that is considered atomic and
can be added to the |product| by installing one or more software
packages.

In :numref:`fig-ce-arch`, *dependencies* are denoted by the boxes piled
on top of the bottom one. In other words, all the ``*-UI`` packages,
which contain the files necessary to show the Module to the users,
**must be** installed on the Proxy Node.

.. hint:: ``-UI`` packages provide the front-end files to access the
   service from a browser or mobile app.



Supported Mail Protocols
========================

|product| supports the following protocols:

* POP3 and POP3S
* SMTP and its secure protocol SMTPS (SMTP over TLS/SSL)
* IMAP and its secure protocol IMAPS (IMAP over SSL)
