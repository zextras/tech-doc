.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

If you have a Multi-Server installation, you must **upgrade each
node**, following the same order used during the installation. If you
installed your Multi-Server according to the scenario described in
:ref:`multiserver-installation`, you should start the upgrade from
**SRV1**, then **SRV2**, **SRV3**, **SRV4**, **SRV5**, and finally
**SRV6**.

This upgrade involves the **Directory Server** and **VideoServer**
(**SRV2** and **SRV4** in our scenario). For all the other nodes node
follow the same procedure used for the :ref:`upgrade-single`:

.. include:: /_includes/_upgrade/node.rst

For the Directory Server, please refer to section :ref:`upgrade-ds`,
while for |vs|, directions are described in section :ref:`upgrade-vs`.

