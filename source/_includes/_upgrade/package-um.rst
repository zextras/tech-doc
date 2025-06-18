In release 25.3.0, this package must be installed as part of the
**Mesh & Directory** Component, instead of the **Proxy** Component. To
install it on the *Mesh & Directory* Node, execute as the |ru|

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-user-management

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-user-management

While the user management features works even if the package is
installed with both Components, we suggest that you remove it from the Node
featuring the Proxy Component:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt remove carbonio-user-management

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf remove carbonio-user-management

