Run the Upgrade
---------------

To run the upgrade, you need to move to the directory where you have
the **inventory file** of your installation (it is called :file:`data`
in the :ref:`ansible-setup` Section), then issue the command
below. Before running it, please note that:

* The command will automatically remove all unused dependencies
  installed on your system. To prevent this behaviour, add to the
  command line the option :command:`--extra-vars skip_autoremove=1`

* Packages that were manually installed and are no longer used will
  **not** be removed from your system: you need to remove them manually.

.. code:: console

   $ ansible-playbook zxbot.carbonio_upgrade.carbonio_upgrade \
   -u root -i carbonio-inventory

In case the procedure does not complete successfully, you can run the
command a second time, during which the  tasks that successfully run
will be skipped. For details, refer to Section :ref:`ansible-ts`.