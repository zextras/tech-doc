.. _ansible:

======================================
 |product| Installation Using Ansible
======================================

Section :ref:`roles-installation` reviews all the roles that make up
|product| and the tasks required to successfully complete the
installation. 

.. link a docs - open in new tab copyright x ansible

To make the installation process easier and faster, this section
introduces an alternative installation method based on Ansible\
:far:`registered` [#f1]_ and an `Ansible playbook
<https://docs.ansible.com/ansible/latest/index.html>`_ to be run.
 
.. note:: Ansible is free software that allows you to automate the
   configuration and management procedures on Unix-like and Windows
   systems.

Ansible will read an `inventory file` containing the Nodes on which to
install the various Roles and automatically execute on the selected
Nodes all the necessary task. You only need to edit the inventory file
and run the playbook.

.. _ansible-req:

Requirements
============

You can run the Ansible playbook form any workstation, which runs
Linux, macOS, or BSD, satisfying the following requirements

.. note:: Using Ansible from a Windows workstation is not immediate:
   If you want to use the Ansible playbook from a Windows workstation,
   please read `the official Windows FAQ
   <https://docs.ansible.com/ansible/latest/os_guide/windows_faq.html#windows-faq-ansible>`_
   for setting it up.

.. card:: Workstation requirements

   #. The workstation has a working installation of Ansible (see
      Section :ref:`ansible-setup` for directions)

   #. The workstation has SSH access as the ``root`` user to all the
      Nodes on which |product| must be installed. This is necessary
      because Ansible needs to install packaged and carry out various
      tasks which require high privileges.

      .. hint:: You can temporarily copy the SSH key of the user on
         the workstation to the :file:`.ssh/authorized_keys` file of
         the Nodes' ``root`` user

.. card:: Nodes requirements

   Besides the :ref:`carbonio-requirements` that every Node must
   satisfy, the Nodes

   #. must be equipped with the same **supported OS**

   #. must be able to reach one another via SSH

.. _ansible-download:

Playbook Download and Information
=================================

The ansible playbook is publicly available on the read-only GitHub
repository https://github.com/zextras/carbonio-install-ansible.

You can clone it or better fork it. The repository will be updated
either when new features will be made  available or other improvements
will be implemented.

Strong points of the playbook are:

* It will be updated by the |zx| team

* It automatically recognises the OS on the Nodes, therefore it chooses
  the appropriate packages for your operating system, and execute only
  those commands necessary for installation for that environment

* only require to fill in a template and launch the playbook

.. _ansible-setup:

Setting up Ansible
==================

This section guides you in the set up of a workstation featuring
Ansible (the `control node`) and the |carbonio| Ansible playbook, with
the purpose to install |product| on an existing infrastructure.

The control node should run on any Linux, macOS, or BSD box. Windows
is supported but needs some work, therefore it is not mentioned
here.


Install Ansible - Linux
-----------------------

On Linux, Ansible can be installed using packages in the
distribution's repository, hence using the distribution's package
manager. Please refer to the `official installation guide
<https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html>`_.
This procedure pulls all the necessary dependencies, including **python3**.

If you prefer alternative installation methods, like using manual
python package installation, containers, or from source code, please
refer to the `Installing Ansible
<https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html>`_
section of the official documentation, which includes also
installation requirements.

To verify that installation was successful, run the following command
on the control node

.. code:: console

   $ ansible --version

Install Ansible - macOS, BSD
----------------------------

The best installation option on these platforms is to use
``homebrew``, provided a **python3** interpreter is installed on the
system. You can follow these `directions
<https://medium.com/javarevisited/how-to-install-ansible-on-mac-2baf00d42466>`_.

Install Playbook
----------------

While you can simply clone (or better, fork) the repository on the
control node and use it to keep everything therein, we suggest a
slight different approach.

First, create a top-level directory in a location of your choice, for
example in the home directory of the user that will run the playbook
(preferably not the ``root`` user),

.. code:: console

   $ mkdir carbonio-ansible

Enter the directory

.. code:: console

   $ cd carbonio-ansible

Now create a directory called :file:`data`

.. code:: console

   $ mkdir data

Then clone the repository, which is read-only, meaning you can only
pull the code

.. code:: console

   $ git clone https://github.com/zextras/carbonio-install-ansible

.. note:: Alternatively, you can also point your browser to that link
   and fork or download the repository.

This command creates a directory called
:file:`carbonio-install-ansible`, so you have created this structure::

  $ tree
  .
  ├── carbonio-install-ansible
  └── data

The idea is that you keep the repository clean, so you can simply
:command:`git pull` whenever there is some update and use the
:file:`data` to keep all the information about the |carbonio|
infrastructure(s) that you manage.

Prepare the Working Environment
-------------------------------

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

If you do want to install a Role, simply leave the corresponding
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

Configure Ansible
-----------------

You can configure Ansible using the :file:`ansible.cfg` in the cloned
repository. We suggest to define at least a log file, which you can do
achieve as follows::

  [defaults]
  log_path=/var/log/carbonio-ansible.log


Run the playbook
----------------

In order to run the script, from the
:file:`carbonio-ansible/carbonio-install-ansible` directory, execute
as the ``root`` user the command

.. code:: console

   # ansible-playbook -i ../../data/inventoryname carbonio-install.yml

The playbook will execute all the tasks necessary and print the result
on the screen. When finished, a summary of the results is
displayed. Moreover, the passwords created during the installation are
saved in the :file:`data` directory, along with the
:file:`carbonio_inventory` file, so make sure

* to allow only trusted persons to access to the directory

* to make a backup of the directory

Closing Remarks
---------------

Once the script has successfully completed, you can immediately access
your new |product| installation and execute the first necessary tasks,
see Section :ref:`web-access`. You can then proceed to carry out further
administration tasks, see :ref:`post-install`. In particular, if you plan
to migrate to |product|, refer to section  :ref:`migration`.

.. rubric:: Footnotes

..  [#f1] Ansible is a trademark of Red Hat, Inc. in the United States and other countries.
