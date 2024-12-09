.. _install-with-ansible:

=================================
 Prepare the Ansible Environment
=================================

.. note:: On RHEL 8 and RHEL 9 systems, |product| version 24.12.0 can
   not be installed using Ansible, so if you plan to use either of
   these two Operating Systems, please install manually.

Section :ref:`roles-installation` reviews all the roles that make up
|product| and the tasks required to successfully complete the
installation.

To make the installation process easier and faster, this section
introduces an alternative installation method based on Ansible Galaxy,
an `Ansible playbook
<https://docs.ansible.com/ansible/latest/index.html>`_, and an Ansible
*inventory file* .

.. note:: Ansible is free software that allows you to automate the
   configuration and management procedures on Unix-like and Windows
   systems.

Ansible will read an `inventory file` containing a list of the Nodes
on which to install the various Roles and automatically execute on the
proper Node all the necessary tasks.

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
   satisfy, each Nodes must

   #. be equipped with the same **supported OS** (see section
      :ref:`software-requirements`)

   #. be able to reach one another via SSH

   #. have the |product| repository configured (see section
      :ref:`preliminary` for directions)

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

Install |carbonio| Playbook
===========================

|product| Playbook is available from Ansible Galaxy in two variants:
one for Single-Server Scenario and one for all other scenarios. You
need to simply run a command to install either of them. The playbooks
are **version-dependant**: to install |product| you will need to use
the corresponding playbook version. Please ensure that you always
have installed the latest playbook to be able to install the most
recent |product| release.

.. card:: Playbook for Single-Server Scenario

   .. code:: console

      # ansible-galaxy collection install zxbot.carbonio_ssinstall

.. card:: Playbook for all other Scenarios

   .. code:: console

      # ansible-galaxy collection install zxbot.carbonio_install

.. _ansible-conf:

Configure Ansible
-----------------

You can configure Ansible using the :file:`ansible.cfg` in the cloned
repository (i.e., in directory :file:`carbonio-install-ansible`). We
suggest to define at least a log file, which you can do achieve as
follows::

  [defaults]
  log_path=/var/log/carbonio-ansible.log

.. _ansible-multi-inventories:

Multiple Inventories
====================

If you plan to install multiple instances of |carbonio| on different
environments, we suggest that you create a dedicated directory to
store the various inventories required for the different setups. We
will call this directory :file:`/opt/carbonio-installations/`. During
the installation procedure, we assume that the inventory file is saved
in this directory.
