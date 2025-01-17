
===========================
 Architecture of |product|
===========================

This section contains a description of |product| architecture and  of
the Roles along with the features they provide and how to manually
install them within a |product| infrastructure.

:numref:`fig-arch` shows the internal architecture of |product|
with all its components.

.. _fig-arch:

.. figure:: /img/carbonio/architecture_Carbonio.png
   :width: 100%

   Simplified architecture of |product|.

A typical |product| installation consists of various components
installed on one or multiple :term:`Nodes <node>`.
Each of the component depicted by the red boxes should be installed on a
different Node, while all the others can be combined and installed on
one or more Nodes. For example, if |vs| is heavily used, it could be a
good idea to install it on a dedicated node.

In :numref:`fig-arch`, *dependencies* are denoted by the boxes piled
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

.. toctree::
   :hidden:

   roles
