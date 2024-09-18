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

Complete installation
---------------------

After the :command:`pending-setups` command has completed, you need to
carry out these tasks.

#. Execute, as the ``root`` user the script that enables the correct
   routing to the |vs|. You need to provide the |mesh| credentials

   .. code:: console

      # carbonio-videoserver-routing

#. make sure that the Video Server's IP address is present in the
   configuration file :file:`/etc/janus/janus.jcfg` and add it if
   missing: find the variable ``nat_1_1_mapping`` and add it, for
   example: ``nat_1_1_mapping = "93.184.216.34"``

#. restart the service

   .. code:: console

      # systemctl restart carbonio-videoserver

Troubleshooting
---------------

Broker & Video Server Check
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To make sure that videoserver and message broker are connected
successfully, check that in the carbonio-videoserver logs
(:command:`journalctl -u carbonio-videoserver`) you find the line::

  RabbitMQEventHandler: Connected successfullySetup of RabbitMQ event
  handler completed
