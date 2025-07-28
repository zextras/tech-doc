.. _broker-pkg:

If you are upgrading from **24.9** versions or older, make sure
that the :file:`carbonio-message-broker` package is installed on
the :ref:`component-mesh-install` Node.

This situation was previously required by the
:ref:`component-wsc-install`  Component, where it was installed, but
now is used by the whole |product|.

In case you already installed |WSC|, remove the
:file:`carbonio-message-broker` from the |wsc| Node, then
install it on the **Mesh & Directory Node**.

If you never installed |wsc|, make sure you install this package
on the **Mesh & Directory Node**.

To verify if the package is installed, execute the following
command on the |wsc| (if installed) and the Mesh & Directory
Node.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # dpkg -l carbonio-message-broker

      The output should be (version may vary)::

        ii  carbonio-message-broker 0.2.0-1jammy amd64   Carbonio message broker

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # rpm -q carbonio-message-broker

      The output should be (version may vary)::

        carbonio-message-broker-0.2.0-1.el8.x86_64

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # dpkg -l carbonio-message-broker

      The output should be (version may vary)::

        ii  carbonio-message-broker 0.2.0-1jammy amd64   Carbonio message broker

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # rpm -q carbonio-message-broker

      The output should be (version may vary)::

        carbonio-message-broker-0.2.0-1.el8.x86_64

If the package is installed on the |wsc| Node (if you have it
installed), remove it.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt remove carbonio-message-broker

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf remove carbonio-message-broker

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt remove carbonio-message-broker

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf remove carbonio-message-broker

If the package is **not** installed on the Mesh & Directory
Node, install it manually:

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install carbonio-message-broker

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-message-broker

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt install carbonio-message-broker

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-message-broker
