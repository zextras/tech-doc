.. _role-vs-wsc-install:

Video Server & Video Recording (WSC)
====================================

Before installing this Role on the |product| infrastructure, make sure
that you installed the :ref:`role-prov-install`, which is a
requirement for this Role.

.. note:: If you already have installed on your infrastructure the
   legacy :ref:`role-vs-install`, make sure this Role is installed on
   a different Node.

Install Packages
----------------

This Role consists of *Video Server (WSC)* and *Video Recording (WSC)*. You need
to install the latter only if you plan to record video meetings,
otherwise you can install *Video Server* without *Video
Recording*. For this reason we split this Role's installation in two parts.

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_packages/role-vs-wsc.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Complete |vs| installation
--------------------------

Starting from **25.3** release, the :file:`/etc/janus/janus.jcfg`
configuration file will be updated automatically to include the |vs|
`public` IP address (i.e., the one that will accept incoming
connections to the |vs|) using a :command:`curl` call.

However, this may be not true in case the Node setup has a different
IP address for incoming and outgoing traffic, for example if the
incoming traffic is routed to the |vs| node using IP address
203.0.113.102 and the outgoing traffic from the Node to the Internet
is routed through IP address 203.0.113.105, the :command:`curl` call
would return the latter IP (105), but the actual IP in the
configuration file should be the former (102).


Therefore, after the installation, make sure that the correct `public`
IP address is present in the file: the line containing the
``nat_1_1_mapping`` variable should be::

  nat_1_1_mapping = "203.0.113.102"

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable carbonio-videoserver.service
   # systemctl start  carbonio-videoserver.service

Check Video Server & Broker
---------------------------

To make sure that videoserver and message broker are connected
successfully, check that in the carbonio-videoserver logs
(:command:`journalctl -u carbonio-videoserver`) you find the line::

  RabbitMQEventHandler: Connected successfullySetup of RabbitMQ event
  handler completed

Video Recording
---------------

To install the Video Recording packages, execute the command according
to the underlying operating system.

.. include:: /_includes/_installation/_packages/role-vr-wsc.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

You can then enable the Video Recorder on a user, COS, or global
level: please refer to section :ref:`vs-recorder-conf` for
directions.

A recorded session is temporary stored in directory
:file:`/var/lib/videoserver/` on the Node featuring the |vs| Role:
make sure that this directory has sufficient free space, otherwise
recorded videos can not be stored. As soon as the recording session
terminates, the file will be processed and moved to the Node featuring
the :ref:`role-prov-install`.

.. hint:: You can mount on that location a dedicated disk or
   partition and keep it monitored for space usage.

