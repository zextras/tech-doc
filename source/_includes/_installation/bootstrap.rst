.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # carbonio-bootstrap


   .. tab-item:: RHEL
      :sync: rhel

      On RHEL 8 we need to make sure log files have correct
      permissions, then bootstrap |product|.

      .. code:: console

         # chown -R zextras:zextras /opt/zextras/log
         # carbonio-bootstrap
