=========
 Install
=========

This section contains all information necessary to install Carbonio
within your infrastructure, starting from the requirements.

The core of this section is the description of the installation
scenarios we envisioned and their deployment: the basic installation
on a Single-Server, followed by more complex Multi-Node scenarios from
3 to 15 Nodes.

As you will see in the next pages of this documentation, there are two
alternatives to install |product|:

* A **manual procedure**: connect to each node using :command:`ssh` and
  execute some operations, summarised in this
  schema:

  #. Configure repositories

  #. Set Hostname

  #. System Upgrade & Packages Installation

  #. Configure PostgreSQL (only on Database node)

  #. Bootstrap Carbonio

  #. Setup Carbonio Mesh

  #. Database boostrap (only on Database node)

  #. Run Pending setups

  #. Verify that installed services are up & running

  Some roles may require additional installation steps or specific checks.

* By using a deployment tool (**Ansible**) that can be installed on
  your workstation or on a dedicated one (called *control node*),
  capable of accessing the virtual machines on which |product| will be
  installed by exchanging an SSH key pair. This mode of installation
  is suggested on complex infrastructures consisting of multiple
  nodes, on which a manual installation is more error prone, due the
  vast number of tasks.

  To use this mode you will need to download a playbook and fill out
  an inventory file with the list of target :term:`Nodes <Node>` on which you
  install |product|.

  The playbook will take care of the installation steps, controlling
  the start of services and drastically reducing the chance of errors.

.. card:: Table of Contents

   .. toctree::
      :maxdepth: 1

      architecture
      requirements
      preliminary
      roles
      scenarios
