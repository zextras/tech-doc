.. _role-vs-wsc-install:

Video Server & Video Recording (WSC)
====================================

Before installing this Role on the |product| infrastructure, make sure
that you installed the :ref:`role-prov-install`, which is a
requirement for this Role.

.. note:: This Role can not be installed on the same Node as
   :ref:`role-vs-install`.

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-vs-wsc.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst

Troubleshooting
---------------

Broker & Videoserver Check
~~~~~~~~~~~~~~~~~~~~~~~~~~

To make sure that videoserver and message broker are connected
successfully, check that in the carbonio-videoserver logs
(:command:`journalctl -u carbonio-videoserver`) you find the line::

  RabbitMQEventHandler: Connected successfullySetup of RabbitMQ event
  handler completed
