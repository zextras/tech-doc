.. _install:

=========
 Install
=========

This section describes how to install |product| in your infrastructure.

As explained in the following pages, |product| is deployed using **Ansible**, a configuration management and automation tool.
Ansible can be installed either on your local workstation or on a dedicated machine (the **control node**).
From there, it connects to the target virtual machines via SSH using a key pair and performs the installation automatically.

This deployment method is designed to ensure consistency and repeatability across all systems involved.

To proceed, you need to:

- Download the provided **Ansible playbook**

- Configure the **inventory file** with the list of target nodes where |product| will be installed

The playbook orchestrates the entire installation process, manages service startup, and ensures a reliable and consistent deployment across your infrastructure.

.. card:: Table of Contents

   .. toctree::
      :maxdepth: 1

      requirements
      preliminary
      ansible
      ansible-install
      examples.rst
      post-install

