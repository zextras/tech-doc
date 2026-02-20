.. _install-with-ansible:

=================================
 Prepare the Ansible Environment
=================================

Section :ref:`components-installation` reviews all the Components that make up |product|.

This section describes the installation method based on Ansible.

Ansible is free and open-source software that automates configuration and management tasks on Unix-like and Windows systems.
The installation relies on Ansible Galaxy, an Ansible playbook, and an Ansible inventory file.

Ansible reads the `inventory file`, which contains the list of Nodes on which the various Components must be installed, and automatically
executes all the required tasks on the appropriate Node.

Once the **Control Node** (that is, a workstation with Ansible installed and from which Carbonio installations are launched; see Section
:ref:`ansible-setup` below) has been properly configured according to the instructions
provided, the installation procedure simply requires editing the inventory file and running **a single CLI command** to execute the playbook.

.. _ansible-req:

Requirements
============

You can run the Ansible playbook form any control node, which runs
Linux, macOS, or BSD, satisfying the following requirements

.. note:: Using Ansible from a Windows control node is not
   straightforward: If you want to use the Ansible playbook from a
   Windows control node, please read `the official Windows FAQ
   <https://docs.ansible.com/ansible/latest/os_guide/windows_faq.html#windows-faq-ansible>`_
   for setting it up.

.. card:: Control Node requirements

   #. The control node has a working installation of Ansible (see
      Section :ref:`ansible-setup` for directions)

   #. The control node has SSH access as the ``root`` user to all the
      Nodes on which |product| must be installed. This is necessary
      because Ansible needs to install packages and carry out various
      tasks which require root privileges.

      .. hint:: You can temporarily copy the SSH key of the user on
         the control node to the :file:`.ssh/authorized_keys` file of
         the Nodes' ``root`` user

.. card:: Nodes requirements

   Besides the :ref:`carbonio-requirements` that every Node must
   satisfy, each Nodes must

   #. be equipped with the same **supported OS** (see section
      :ref:`software-requirements`)

   #. be able to reach one another via SSH

   #. have the |product| repository configured (see section
      :ref:`preliminary` for directions)

.. card:: Version requirements

   |product| installation and upgrade playbooks **require the full Ansible package**.

   Ansible is distributed as a **community bundle** that includes:

   - ``ansible-core`` – the execution engine
   - A curated set of **required collections and plugins**
 
   The ``ansible-core`` package alone provides only the execution engine and **is not sufficient** to run Carbonio install or upgrade playbooks.

   .. warning::

      Installing only ``ansible-core`` may cause playbooks to run but **complete with errors** due to missing collections and plugins.

      For this reason, **Carbonio install and upgrade procedures require the** ``ansible`` **package**, not ``ansible-core`` alone.

   **Supported Versions**

   The supported ``ansible-core`` versions are **>= 2.16.5**

   For more detailed information about available versions and compatibility between ``ansible`` and ``ansible-core``, refer to the official Ansible documentation:

   - `Ansible Release and Maintenance <https://docs.ansible.com/projects/ansible/latest/reference_appendices/release_and_maintenance.html>`_


.. _ansible-setup:

Ansible Setup
=============

This section guides you in the set up of a control node featuring
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

|product| Playbook is available from Ansible Galaxy.
Please ensure that you always have installed the latest playbook to be able to install the most
recent |product| release.

.. card:: Playbook for |product| installation

   .. code:: console

      # ansible-galaxy collection install zxbot.carbonio_install -U

.. _ansible-conf:

Configure Ansible
-----------------

You can configure Ansible using the :file:`ansible.cfg` file.  Please
refer to the `official documentation
<https://docs.ansible.com/ansible/latest/installation_guide/intro_configuration.html>`_
for directions.


.. _ansible-multi-inventories:

Multiple Inventories
====================

If you plan to install multiple instances of |carbonio| on different
environments, we suggest that you create a dedicated directory to
store the various inventories required for the different setups.
