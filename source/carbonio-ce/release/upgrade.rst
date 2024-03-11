.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade from 24.1 to 24.3
===================================

.. include:: /_includes/_upgrade/intro-ce.rst

.. _upgrade-checklist:

Upgrade Checklist
-----------------
              
.. include:: /_includes/_upgrade/checklist-ce.rst

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.
             
.. _pre-upgrade:
   
Preliminary Tasks
-----------------

.. include:: /_includes/_upgrade/ds-ce.rst

.. _pg-upgrade:

Upgrade to PostgreSQL 16
------------------------

.. include:: /_includes/_upgrade/pg.rst

.. _upgrade-nodes:

Upgrade Nodes
-------------

.. include:: /_includes/_upgrade/node-ce.rst


.. _upgrade-manual:

Manual Steps
------------

In the upgrade to 24.3, the following manual steps are required.

.. _upgrade-monit:

|monit|
~~~~~~~

While upgrading the ``carbonio-prometheus`` package, you will be
prompted with the following text::
  
  Configuration file '/etc/carbonio/carbonio-prometheus/prometheus.yml'
  ==> Modified (by you or by a script) since installation.
  ==> Package distributor has shipped an updated version.
  What would you like to do about it ?  Your options are:
  Y or I  : install the package maintainer's version
  N or O  : keep your currently-installed version

You must replace the existing file **with the new one**, therefore
answer :kbd:`Y` or :kbd:`I`.

.. _upgrade-wsc:

|wsc|
~~~~~

After the upgrade you need to reinitialise the message dispatcher. As
the ``root`` user execute the command

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration carbonio_adm 127.78.0.10 20000

Then restart the service

.. code:: console

   # systemctl restart carbonio-message-dispatcher

..
   .. _upgrade-ts:

   Troubleshooting
   ---------------

   In this section you find solutions for some possible error during the
   upgrade procedure.

   .. include:: /_includes/_upgrade/ts.rst
