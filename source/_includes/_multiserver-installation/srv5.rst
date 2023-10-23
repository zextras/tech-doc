.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _vs_installation:

Installation of |vs|
++++++++++++++++++++

It is possible to install the |vs| without the Video Recording
feature. If you wish to do so, follow the procedure below, but *skip
the last step*, :ref:`video-rec-installation`. You can always install
it at a later point by following the procedure in

First, install |vs| package

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-agent carbonio-videoserver

   .. tab-item:: RHEL
      :sync: rhel

      Before starting the procedure, install Fedora's epel-repository.

      .. code:: console

         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

      Then, install the packages.

      .. code:: console

         # dnf install service-discover-agent carbonio-videoserver

After the installation, make sure that the |vs| `public` IP address
(i.e., the one that will accept incoming connections to the |vs|) is
present in the configuration file :file:`/etc/janus/janus.jcfg` and
add it if missing: find the variable ``nat_1_1_mapping`` and add it,
for example: ``nat_1_1_mapping = "93.184.216.34"``

Finally, enable and start the service with the commands

.. code:: console

   # systemctl enable videoserver.service
   # systemctl start  videoserver.service

.. _video-rec-installation:

Installation of Video Recording
+++++++++++++++++++++++++++++++

To implement this feature, install package

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-videoserver-recorder

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-videoserver-recorder

The video-recording feature is enabled by default, and does not
require configuration if installed together with the |vs|.  It does
however require some manual command if installed at a later
point. Please refer to Section :ref:`vs-record-meeting` for
directions.

The recorded sessions will be stored in directory
:file:`/var/lib/videorecorder/` on **SRV3**, because the ability to
record requires a Node which features the AppServer (i.e., on which
the ``carbonio-advanced`` package is installed). Make sure that the
directory has sufficient free space, otherwise recorded videos can not
be stored.

.. hint:: You can mount on that location a dedicated disk or
   partition and keep it monitored for space usage.

Bootstrap |carbonio|
+++++++++++++++++++++

Launch the |carbonio| bootstrap process

   .. code:: console

      # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from SRV1.

* ``Ldap master host`` is the FQDN of SRV1, srv1.example.com
* ``Ldap Admin password`` is obtained from SRV1 using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s zimbra_ldap_password"

Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh-agent.rst

