.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0
   
.. _upgrade-troubleshooting:

Upgrade Troubleshooting
-----------------------

This section lists some troubleshooting options related to the upgrade
process.

Upgrade of Docs-Editor
~~~~~~~~~~~~~~~~~~~~~~

When installing recent version of the **Docs-Editor**, running the
:command:`pending-setups` might abruptly exit with an error message
similar to::

  Error writing config entry service-defaults/carbonio-docs-editor: Unexpected response code:
  400 (Bad request: Request decoding failed: 1 error occurred:
  
	* invalid config key "Websocket"

To avoid this error, make sure that the installed package
``service-discover-base`` is *at least* version **1.10.12**. You can
verify this with the following commands.


.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt search service-discover-base
         # dpkg -l service-discover-base

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf info service-discover-base
         # rpm -q service-discover-base

If the version is older than **1.10.12**, please upgrade the package.

After you verified that the version is the correct one, please run
this command **before** :command:`pending-setups`.

.. code:: console

   # systemctl restart service-discover.service

Token-related error messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Whenever, during the upgrade process, you find any error in the log
files, execute the following two commands.

The first one must be executed as the ``root`` user.

.. code:: console

   # chmod a+r /etc/zextras/carbonio-mailbox/token

The second one must be executed as the ``zextras`` user.

.. code:: console

   $ zmmailboxdctl restart

