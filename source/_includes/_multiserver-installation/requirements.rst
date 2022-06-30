.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Each node of a Multi-Server must satisfy the Single-Server's
:ref:`software-requirements` and also :ref:`system-requirements` are
valid, but take into account the following advices:

* By dividing the services and therefore the load on more nodes, less
  resources per node are needed. We recommend at least **4GB** of RAM on
  each node, though.

* The node on which the Logger is installed acts as a log-concentrator
  and therefore gathers log files from all the other nodes. Depending
  on the logging level set on the nodes, the required disk space may
  greatly vary, so it is not easy to provide a minimum or suggested value.

There are no additional requirements, just a few remarks:

* Repositories: All packages required by a multi-server setup are
  available in the same repository as the single server installation,
  hence there is no need of further configuration.

* Acquaintance with the use of CLI is necessary.  All ``carbonio``
  commands must be executed as the ``zextras`` user (these commands
  will feature a ``zextras$`` prompt), while all other commands must
  be issued as the ``root`` user, unless stated otherwise.

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
