
.. _ ansible:

======================================
 |product| Installation Using Ansible
======================================

Section :ref:`roles-installation` reviews all the roles that make up
|product| and the tasks required to successfully complete the
installation.

To make the installation process easier and faster, this section
introduces an alternative installation method by running an `Ansible
<https://www.ansible.com/>`_ playbook.

Ansible is free software that allows you to automate the configuration
and management procedures on Unix-like and Windows systems.

.. _ansible-req:

Requirements
============

You can run the Ansible playbook, form any workstation, which runs
Linux or iOs, satisfying the following requirements

.. note:: Using Ansible from a Windows workstation is not immediate:
   If you want to use the Ansible playbook from a Windows workstation,
   please read `the official Windows FAQ
   <https://docs.ansible.com/ansible/latest/os_guide/windows_faq.html#windows-faq-ansible>`_
   for setting it up.

.. card:: workstation requirements
	  
   #. The workstation has a working installation of Ansible

   #. The ability to launch Ansible as the ``root`` user, or as a user
      with ``sudo`` privileges (i.e., the user must be in the
      ``sudoers`` file)
   
   #. The workstation has SSH access to all the Nodes on which |product|
      must be installed

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


