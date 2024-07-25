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

Set up and Limitations
======================

The setup of |product| Single-Server consists of a **Single Node**
including only the basic features, without |task|, |docs|, and
|pv|. It does not include any service redundancy, |ha| services,
while these features are limited:

* HSM is available only on local disks
* |backup| does not include any |file| item.

The Roles that are not part of the Single-Server setup can be
installed on separate, additional Nodes. However, this part is not
covered in this section.

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

Software requirements, including the operating system can be are the
same as for any other |product| setup (see
:ref:`software-requirements`) and so are the :ref:`inst-additional-req`.

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

..
  domande
  1. dove si posiziona l'ansible executor
  2. come incastrare i vari roles per la scalabilita'

Once you edited the inventory, save it in directory :file:`data` as
:file:`carbonio-inventory-single`.  Now, you can run the script: from
the :file:`carbonio-ansible/carbonio-ansible-ssconfig/` directory
execute the command

.. code:: console

   $ ansible-playbook -i ../data/carbonio-inventory-single carbonio-ssreconfig.yml \
     --extra-vars "install_path=zxbot.carbonio_install.carbonio_install"
