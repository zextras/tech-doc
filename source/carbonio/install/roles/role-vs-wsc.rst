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

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Complete |vs| installation
--------------------------

After the :command:`pending-setups` command has completed, make sure
that the Video Server's IP address is present in the configuration
file :file:`/etc/janus/janus.jcfg` and add it if missing: find the
variable ``nat_1_1_mapping`` and add it, for example:

``nat_1_1_mapping = "93.184.216.34"``

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

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-videorecorder

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-videorecorder

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

