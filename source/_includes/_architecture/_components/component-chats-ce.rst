First, we install PostgreSQL repository.

.. include:: /_includes/_installation/_repo/pg.rst

Then, we update the list of packages.

.. include:: /_includes/_installation/update-packages.rst

Finally, we install packages.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install postgresql-client-16 carbonio-message-dispatcher-ce \
           carbonio-ws-collaboration-ce

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt install postgresql-client-16 \
           carbonio-message-dispatcher-ce carbonio-ws-collaboration-ce

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-message-dispatcher-ce \
           carbonio-ws-collaboration-ce postgresql16

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-message-dispatcher-ce \
           carbonio-ws-collaboration-ce postgresql16
