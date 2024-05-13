
.. _ansible-run:

=================================
 Install |product| Using Ansible
=================================

.. _ansible-inventory:


Prepare Inventory
=================

The forked repository contains file :file:`inventoryname`, which you
need to copy to the :file:`data` directory, giving it a meaningful
name (especially in the case you manage multiple, separate
infrastructures)

.. code:: console

   $ cd carbonio-install-ansible/
   $ cp inventoryname ../data/carbonio_inventory

The :file:`carbonio_inventory` file contains various sections, one for
each of the available Roles. You need to edit the file and provide the
FQDN of the Node on which the role will be installed. Suppose that you
install on 5 nodes, whose FQDNs are ``srv1.example.com`` to
``srv5.example.com``, an excerpt of the file might look like::

  [postgresServers]
  srv1.example.com

  [masterDirectoryServers]
  srv1.example.com

  [dbsConnectorServers]
  srv1.example.com

If you do not want to install a Role, simply leave the corresponding
section empty.

For some of the Roles you need to provide some additional
value for a proper configuration. Currently, these sections are

* the Proxy Role::

    [proxyServers:vars]
    #webmailHostname=webmailPublicHostname

  This is the FQDN of the domain, for example ``mail.example.com``,
  so::

    [proxyServers:vars]
    webmailHostname=mail.example.com

* The |vs|, if installed::

    [videoServers]
    #hostname public_ip_address=x.y.z.t
    
  In this case, supposing that the Role is installed on
  ``srv5.example.com`` and the public IP address of the |vs| is
  172.16.12.5, this entry should look like::

    [videoServers]
    srv5.example.com public_ip_address=172.16.12.5

  .. note:: 172.16.12.5 is a private IP, remember to replace it with
     an actual public IP!

In order to run the script, first go to the repository's
:file:`carbonio-ansible/carbonio-install-ansible/playbooks` directory

.. code:: console

   $ cd playbooks
      
then execute the comman

.. code:: console

   $ ansible-playbook -u root -i ../../data/carbonio_inventory carbonio_install.yml

Make sure to replace :file:`carbonio_inventory` with the proper name of the
inventory you want to install.

The playbook will execute all the tasks necessary and print the result
on the screen. When finished, a summary of the results is
displayed. Moreover, the passwords created during the installation are
saved in the :file:`carbonio-ansible/data` directory, along with the
:file:`carbonio_inventory` file, so you have them always at your
disposal when you need them, for example during upgrades or routine
tasks. To protect them, make sure:

* to allow only trusted persons the access to the directory

* to make a backup of the directory

.. card:: Failed inventory installation

   If for any reason the installation fails, you can check the log
   file (to set it up, see Section :ref:`ansible-conf`) to see what
   happened, fix it, then execute again the inventory. Ansible will
   recognise the steps already successfully carried out and run only
   those that failed.

Closing Remarks
===============

Once the script has successfully completed, you can immediately access
your new |product| installation and execute the first necessary tasks,
see Section :ref:`web-access`. You can then proceed to carry out further
administration tasks, see :ref:`post-install`. In particular, if you plan
to migrate to |product|, refer to section  :ref:`migration`.
