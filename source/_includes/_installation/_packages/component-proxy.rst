.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install carbonio-proxy carbonio-catalog \
          carbonio-files-public-folder-ui carbonio-webui \
          carbonio-tasks-ui carbonio-files-ui \
          carbonio-ws-collaboration-ui carbonio-avdb-updater


   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install carbonio-proxy carbonio-catalog \
          carbonio-files-public-folder-ui carbonio-webui \
          carbonio-tasks-ui carbonio-files-ui \
          carbonio-ws-collaboration-ui carbonio-avdb-updater


   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-proxy carbonio-catalog \
          carbonio-files-public-folder-ui carbonio-webui \
          carbonio-tasks-ui carbonio-files-ui \
          carbonio-ws-collaboration-ui carbonio-avdb-updater

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-proxy carbonio-catalog \
          carbonio-files-public-folder-ui carbonio-webui \
          carbonio-tasks-ui carbonio-files-ui \
          carbonio-ws-collaboration-ui carbonio-avdb-updater

.. note:: The :file:`carbonio-chats-ui` package is needed by the
   |dprc| Chats Component, which has been superseded by the new
   :ref:`role-wsc-install` Component. Hence, it is only needed to keep the
   old Chats working.
