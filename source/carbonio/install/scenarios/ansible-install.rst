
.. _ansible-run:

=================================
 Install |product| Using Ansible
=================================

In order to run the script, from the
:file:`carbonio-ansible/carbonio-install-ansible` directory, execute
as the ``root`` user the command

.. code:: console

   # ansible-playbook -i ../../data/inventoryname carbonio-install.yml

Make sure to replace :file:`inventoryname` with the proper name of the
inventory you want to install.

The playbook will execute all the tasks necessary and print the result
on the screen. When finished, a summary of the results is
displayed. Moreover, the passwords created during the installation are
saved in the :file:`data` directory, along with the
:file:`carbonio_inventory` file, so make sure

* to allow only trusted persons to access to the directory

* to make a backup of the directory

Closing Remarks
===============

Once the script has successfully completed, you can immediately access
your new |product| installation and execute the first necessary tasks,
see Section :ref:`web-access`. You can then proceed to carry out further
administration tasks, see :ref:`post-install`. In particular, if you plan
to migrate to |product|, refer to section  :ref:`migration`.
