.. _install-with-ansible:

=================================
 Prepare the Ansible Environment
=================================

Section :ref:`roles-installation` reviews all the roles that make up
|product| and the tasks required to successfully complete the
installation. 

To make the installation process easier and faster, this section
introduces an alternative installation method based on Ansible and an
`Ansible playbook
<https://docs.ansible.com/ansible/latest/index.html>`_ to be run.
 
.. note:: Ansible is free software that allows you to automate the
   configuration and management procedures on Unix-like and Windows
   systems.

Ansible will read an `inventory file` containing the Nodes on which to
install the various Roles and automatically execute on the selected
Nodes all the necessary task.

Once the Control Node (see Section :ref:`ansible-setup` below) has
been properly set up according the directions in the remainder, the
ansible installation only requires to edit the inventory file and run
**one CLI command** to execute the playbook.

.. _ansible-req:

Requirements
============

You can run the Ansible playbook form any workstation, which runs
Linux, macOS, or BSD, satisfying the following requirements

.. note:: Using Ansible from a Windows workstation is not
   straightforward: If you want to use the Ansible playbook from a
   Windows workstation, please read `the official Windows FAQ
   <https://docs.ansible.com/ansible/latest/os_guide/windows_faq.html#windows-faq-ansible>`_
   for setting it up.

.. card:: Workstation requirements

   #. The workstation has a working installation of Ansible (see
      Section :ref:`ansible-setup` for directions)

   #. The workstation has SSH access as the ``root`` user to all the
      Nodes on which |product| must be installed. This is necessary
      because Ansible needs to install packages and carry out various
      tasks which require root privileges.

      .. hint:: You can temporarily copy the SSH key of the user on
         the workstation to the :file:`.ssh/authorized_keys` file of
         the Nodes' ``root`` user

.. card:: Nodes requirements

   Besides the :ref:`carbonio-requirements` that every Node must
   satisfy, the Nodes

   #. must be equipped with the same **supported OS**

   #. must be able to reach one another via SSH

.. _ansible-setup:

Ansible Setup
=============

This section guides you in the set up of a workstation featuring
Ansible (the **Control Node**) and the |carbonio| Ansible playbook,
with the purpose to install |product| on an existing infrastructure.

The control node should run on any Linux, macOS, or BSD box. Windows
is supported but needs some work, therefore it is not mentioned
here.

.. _ansible-inst-linux:

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

.. _ansible-inst-mac:

Install Ansible - macOS, BSD
----------------------------

The best installation option on these platforms is to use
``homebrew``, provided a **python3** interpreter is installed on the
system. You can follow these `directions
<https://medium.com/javarevisited/how-to-install-ansible-on-mac-2baf00d42466>`_.

.. _ansible-inst-playbook:

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
:file:`carbonio-install-ansible`, so you have created this structure
within carbonio-ansible::

  $ ls -1
  carbonio-install-ansible
  data

The idea is that you keep the repository clean, so you can simply
:command:`git pull` whenever there is some update and use the
:file:`data` to keep all the information about the |carbonio|
infrastructure(s) that you manage.

.. _ansible-playbook-info:

Playbook Information
~~~~~~~~~~~~~~~~~~~~

The ansible playbook is publicly available on the read-only GitHub
repository https://github.com/zextras/carbonio-install-ansible.

The repository will be updated either when new features will be made
available or other improvements will be implemented.

Strong points of the playbook are:

* It will be updated by the |zx| team

* It automatically recognises the OS on the Nodes, therefore it chooses
  the appropriate packages for your operating system, and execute only
  those commands necessary for installation for that environment

* only require to fill in a template and launch the playbook using a single
  CLI command

* When more scenarios will be added, suitable inventory files will be added


.. _ansible-conf:

Configure Ansible
-----------------

You can configure Ansible using the :file:`ansible.cfg` in the cloned
repository (i.e., in directory :file:`carbonio-install-ansible`). We
suggest to define at least a log file, which you can do achieve as
follows::

  [defaults]
  log_path=/var/log/carbonio-ansible.log
