.. _upgrade-ansible:

=======================
 Upgrade Using Ansible
=======================

This section describes how to upgrade an existing |product| installation using an Ansible playbook.

Before starting the procedure, make sure you meet all the requirements described in
:ref:`up-ansible-req`.

.. _up-ansible-req:

Requirements & Preliminaries
============================

Before starting the upgrade procedure with Ansible, take the following points into account:

* The latest version of the ``carbonio_upgrade`` Ansible Galaxy collection must be installed.
* This upgrade procedure also works if Carbonio was originally installed manually, as long as the
  inventory is correctly filled with your infrastructure data.
* The current Carbonio version is not relevant:
  you can upgrade from any supported version and the system will be upgraded to the
  latest available release.
* The Ansible Galaxy collection updates **all system packages** available from the
  enabled repositories, not only Carbonio packages.
  To avoid unintended upgrades, disable or comment out any repositories you do not
  want Ansible to use before running the playbook.
* The upgrade procedure does **not** modify the chat system currently in use:

  * If you are using legacy Chats, they will be left untouched.
  * Legacy Chats will not be removed, set to read-only, or migrated to the new Chats
    system.

Install or Upgrade the ``carbonio_upgrade`` Collection
------------------------------------------------------

To install or update the ``carbonio_upgrade`` Ansible Galaxy collection, run the
following command:

.. code-block:: bash

   ansible-galaxy collection install zxbot.carbonio_upgrade -U

The ``-U`` flag ensures that the collection is installed if not already present, or
updated to the latest available version if it is already installed.

This command installs all the required Ansible infrastructure needed to perform the
Carbonio upgrade.

.. include:: /_includes/_upgrade/run-upgrade.rst


Specific upgrade Paths
----------------------

If you are upgrading from older |product| releases or need to handle
special inventory configurations, see:

:ref:`up-ansible-old-rel`


.. toctree::
   :maxdepth: 1
   :hidden:

   ansible-older
