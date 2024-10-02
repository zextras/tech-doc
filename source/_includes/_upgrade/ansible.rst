
This method works if you have a working :ref:`Ansible installation
<install-with-ansible>`. Make sure you read the :ref:`up-prev-req`
Section before starting the upgrade, then access Ansible's Control
Node (see Section :ref:`ansible-setup`) and issue the following
command.

.. code:: console

   $ ansible-galaxy collection install zxbot.carbonio_upgrade

.. hint:: This command can be run by any user, preferably by the one
   who installed the playbook.

The above command will install the necessary infrastructure to use for
the |product| upgrade. Next, you need to move to the directory where
you have the **inventory file** of your installation (it is called
:file:`data` in the :ref:`ansible-setup` Section), then issue the
command below. Before running it, please note that:

* The command will automatically remove all unused dependencies
  installed on your system. To prevent this behaviour, add to the
  command line the option :command:`--extra-vars slip_autoremove=1`


  * Packages that were manually installed and are no longer used will
    **not** be removed from your system: you need to remove them
    manually

.. code:: console

   $ ansible-playbook zxbot.carbonio_upgrade.carbonio_upgrade \
   -u root -i carbonio-inventory

In case the procedure does not complete successfully, you can run the
command a second time, during which the  tasks that successfully run
will be skipped. For details, refer to Section :ref:`ansible-ts`.
