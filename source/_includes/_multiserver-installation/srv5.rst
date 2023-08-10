.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _vs_installation:

Installation of |vs|
++++++++++++++++++++

It is possible to install the |vs| without the Video Recording
feature. If you wish to do so, follow the procedure below, but *skip
the last step*, :ref:`video-rec-installation`.

First, install |vs| package

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-videoserver

   .. tab-item:: RHEL
      :sync: rhel

      Before starting the procedure, install Fedora's epel-repository.

      .. code:: console

         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

      Then, install the packages.

      .. code:: console

         # dnf install carbonio-videoserver

After the installation, make sure that the |vs| `public` IP address
(i.e., the one that will accept incoming connections to the |vs|) is
present in the configuration file :file:`/etc/janus/janus.jcfg` and
add it if missing.

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
require configuration on this node, but in the next one. Indeed,
it requires a node which installs the ``carbonio-advanced``
package. The recorded sessions will be stored on that node, in
directory :file:`/var/lib/videorecorder/`. Make sure that the
directory has sufficient free space, otherwise recorded videos
can not be stored.

.. hint:: You can mount on that location a dedicated disk or
   partition and keep it monitored for space usage.
