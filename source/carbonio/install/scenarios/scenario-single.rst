.. _scenario-single:

========================
 Scenario Single-Server
========================

Single-Server is the simplest scenario deployment of |product|. It is
suited for :abbr:`SME (Small to Medium-sized Enterprises)`,
educational institutions, Municipalities, or local Governments, which
do not use all |product| features and, while it supports extensions to
the infrastructure by adding Roles on other Nodes, it is not meant to
be scalable.

Limitations and Set Up
======================

This Scenario has been designed to serve a precise use case and
therefore has the following architectural limitations:

* It is available for installation **using Ansible only**: it can not
  be installed manually Role by Role, due to configuration tweakings
  done by Ansible

* It supports up to **500 accounts**: adding accounts beyond this
  limit will severly hinder the efficiency of |product| and it is not
  supported

The deployment of |product| Single-Server requires a **Single Node**
and includes only the basic features, without |task|, |docs|, Carbonio
Chats, and |vs| (*"Optional Roles"*). It does not include any service
redundancy, |ha| services.

The Optional Roles mentioned in the previous paragraph can be
installed on separate, additional Nodes (up to three in total), to
prevent the Node to be overloaded.

Please also note that these Roles and functionalities are not
supported and therefore can not be installed in Single-Server:

* Monitoring Directory
* Replica Roles 
* A syslog server

If you need some of them, please consider setting up another scenario.

Requirements
============

Since there is only one Node on which to install |product|, the
Hardware Requirements are more demanding compared to each single Node
in a |product| Multi-Node setup:

* 8 vCPU
* 24 GB memory
* 50 GB disk space for the OS
* Additional disk space for the users e-mails, taking into account the
  quota. Purely as an example, if you have 150 users, each with a
  quota of 5GB, you need to have at least **800GB of disk space**,
  50GB for the OS and at 750 for user's total quota.

.. note:: Installation of this scenario is supported only on the following
   Linux distributions: **Ubuntu 22.04.4 LTS** and **RHEL 8**.

Other software requirements are common to the other installation scenarios
and can be found in the following section:
:ref:`inst-additional-req`.

Finally, the Single-Server does not require any :ref:`internal port
<fw-internal>` to be opened, but make sure that ports for the MTA and
Proxy Roles are remotely accessible to allow for |product| to operate
correctly. Please refer to section :ref:`fw-external` for the complete
list.

.. _scenario-single-playbook:

Ansible Playbook
================

This Single Node scenario can be installed using Ansible : you need to
setup a workstation to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following the directions on setting up
the workstation), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure. 

.. dropdown:: Inventory - "Single-Server" Scenario
   :open:

   :download:`Download_inventory
   </playbook/carbonio-inventory-single>`
   
   .. literalinclude:: /playbook/carbonio-inventory-single

.. note:: To add any of the roles listed as optional, simply remove
   the comment (#) indicating the correct name of the server on which
   to install the Role, based on the directions provided.

Once you edited the inventory, save it in directory
:file:`/opt/carbonio-installation` as
:file:`carbonio-inventory-single`. Now, you can run the script: from
the directory execute the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_ssinstall.carbonio_ssinstall \
   -u root -i carbonio-inventory-single \
   --extra-vars "install_path=zxbot.carbonio_install.carbonio_install"

Antivirus Engine
----------------

The antivirus engine (ClamAV) is automatically installed by Ansible
and is part of the installation procedure. If you already have a
company-wide antivirus engine, you can disable the one installed by
|product|, together with other components by issuing as the
``zextras`` user the following command:

.. code:: console

   zextras$ carbonio prov ms $(zmhostname) \
   -zimbraServiceEnabled amavis \
   -zimbraServiceEnabled antivirus \
   -zimbraServiceEnabled antispam \
   -zimbraServiceEnabled opendkim \
   carbonioAmavisDisableVirusCheck TRUE

To entirely disable ClamAV or carry out other management options, like
modify signature lists or installing a signatures updater, please
refer to Section :ref:`clamav-manage`.
