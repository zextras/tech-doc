.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Each node of a Multi-Server must satisfy the Single-Server's
:ref:`software-requirements`; also :ref:`system-requirements` are
valid.

Additional Requirements
~~~~~~~~~~~~~~~~~~~~~~~

.. tab-set::
    .. tab-item:: Ubuntu
       :sync: ubuntu

       No additional requirement is necessary.

    .. tab-item:: RHEL
       :sync: rhel

       The following additional requirements are needed.

       * An active subscription (you must be able to fetch from
         **BaseOS** and the other main repositories)::

           # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms

       * The **CodeReady** repository enabled::

           # subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

Some more remarks:

* Acquaintance with the use of CLI is necessary.  All ``carbonio``
  commands must be executed as the ``zextras`` user (these commands
  will feature a ``zextras$`` prompt), while all other commands must
  be issued as the ``root`` user, unless stated otherwise.

  .. note:: The ``zextras`` user is created during the |product|
     installation process, it is not necessary to create it
     beforehand.

* Commands or groups of commands may be different between Ubuntu and
  RHEL 8. This is shown by blue tabs: click on the tab of your choice
  to find the correct command.
* When no such tabs are given, the commands to run are the same on
  Ubuntu and RHEL 8.

* Give meaningful names to the nodes. For example, call them
  `proxy.example.com`, `mta.example.com`, and so on. Replace
  ``example.com`` with your domain name.

* During the installation procedure, you will need to write down some
  configuration options and their value, because they will be needed
  in the setup of the next nodes. These information are summarised at
  the end of each node's installation: copy them to a safe place and
  keep them at hand until the end of the installation. Example of
  values include: the IP address (public or private) of a node or the
  password of a database user.

* During the installation procedure, you will need to write down some
  configuration options and their value, because they will be needed
  in the setup of the next nodes. These information are summarised at
  the end of each node's installation: copy them to a safe place and
  keep them at hand until the end of the installation. Example of
  values include: the IP address (public or private) of a node or the
  password of a database user.

* Depending on the Roles installed on each Node, you need to open in
  your firewall the ports listed in ref:`fw-ports` for all the
  services you will offer.
