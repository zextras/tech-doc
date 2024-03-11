
In order to upgrade from a |product| 24.1 on Ubuntu 20.04 to |product|
24.3 on Ubuntu 22.04 you need to follow the procedure in this
section. Please read carefully the whole page before starting the
upgrade.

The procedure will require to reboot the nodes and therefore a
downtime of the |product| infrastructure must be planned.

The procedure is divided into four phases:

#. upgrade PostgreSQL from 12 to 16
   
#. upgrade |product| to 24.3

#. upgrade Ubuntu LTS from 20.04 to 22.04 (Jammy Jellifish)

#. upgrade |product|\'s packages to match the correct repository

Phase 1
-------

Upgrade to PostgreSQL 16 **is mandatory**, because Ubuntu 22.04 does
not support the current PostgreSQL 12 installed on
|product|. Directions to upgrade PostgreSQL can be found in Section
:ref:`pg-upgrade`.
   
Phase 2
-------

This phase is the same as a normal upgrade, so please refer to Section
:ref:`carbonio-upgrade`.

Phase 3
-------

This phase requires to upgrade the Ubuntu 20.04 distribution to 22.04:
please refer to the Ubuntu's `upstream documentation
<https://ubuntu.com/server/docs/upgrade-introduction>`_.

Phase 4
-------

Once you successfully carried out the first three phases, you can
proceed to update the |product| packages to match the
distribution. This phase requires some manual command to be executed.

During the Ubuntu upgrade, the file
:file:`/etc/apt/sources.list.d/zextras.list` will be overwritten and
renamed.  You need to restore it and make sure it contains only the
line::

  deb https://zextras.jfrog.io/artifactory/ubuntu-rc jammy main

.. hint:: If you see a file called
   :file:`/etc/apt/sources.list.d/zextras.list.distUpgrade`, you can
   safely remove it.


Now you can update the package list and the packages itself, with the
command

.. code:: console

   # apt update && apt upgrade


Once done, you will end up with a fully upgrade |product| version
**23.4**  on Ubuntu **22.04**!


