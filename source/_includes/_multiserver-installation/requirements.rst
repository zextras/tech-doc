.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Each node of a Multi-Server must satisfy the Single-Server's
:ref:`software-requirements` and also :ref:`system-requirements` are
valid, but consider that by dividing the services and therefore the
load on more nodes, you may need less resources per node.  We
recommend at least 4GB of RAM on each node, though.

There are no additional requirements, just a few remarks:

* Repositories: All packages required by a multi-server setup are
  available in the same repository as the single server installation,
  hence there is no need of further configuration.

* Acquaintance with the use of CLI is necessary. All commands must be
  issued as the ``root`` user, unless stated otherwise.

* Give meaningful names to the nodes. For example, call them
  proxy.example.com, mta.example.com, and so on. Replace
  ``example.com`` with your domain name.
