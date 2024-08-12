
This method works if you have a working :ref:`Ansible installation
<install-with-ansible>`.

In order to carry out the upgrade, you need to access the Control Node
(see Section :ref:`ansible-setup`) and issue the following command

.. code:: console

   $ ansible-galaxy collection install zxbot.carbonio_upgrade

.. hint:: This command can be run by any user, preferably by the one
   who installed the playbook.

The above command will install the necessary infrastructure to use for
the |product| upgrade. Next, you need to move to the directory where
you have the **inventory file** of your installation (it is called
:file:`data` in the :ref:`ansible-setup`, the issue the following
command

.. code:: console

   $ ansible-playbook zxbot.carbonio_upgrade.carbonio_upgrade \
   -u root -i carbonio_inventory

In case the procedure does not complete successfully, you can run the
command a second time, during which the  tasks that successfully run
will be skipped. For details, refer to Section :ref:`ansible-ts`.
