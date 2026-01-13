Multi-Node CLI Execution
========================

In a multi-node Carbonio infrastructure, CLI commands follow different execution
rules depending on the services they interact with.

This article explains these differences and illustrates them with practical
examples. Understanding where to run each command is essential to avoid errors,
incomplete results, or misleading output in multi-node environments.


Types of Carbonio CLI Commands
------------------------------

Carbonio CLI operations can be grouped into the following categories:

* **Mailbox & Provisioning–Bound commands**
  Commands that must be executed on a node hosting the *Mailbox & Provisioning*
  component.

* **Remote-Target commands**
  Commands that can query another server when a target hostname is specified.

* **Node-Specific commands**
  Commands that must be executed on the node where the related component is
  installed.

* **Provisioning commands**
  Infrastructure-wide, node-independent commands.


Mailbox & Provisioning–Bound Commands
-------------------------------------

These commands require the presence of the *Mailbox & Provisioning* component in
order to function.

They are not tied to a specific node instance unless explicitly stated, but they
cannot be executed on nodes that do not host the Mailbox & Provisioning component.

The following Carbonio CLI commands fall into this category:

* ``carbonio admin``
* ``carbonio auth``
* ``carbonio backup``
* ``carbonio config``
* ``carbonio core``
* ``carbonio mobile``
* ``carbonio powerstore``


Example — Retrieving License Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following command retrieves license information for the Carbonio
infrastructure::

  carbonio core getLicenseInfo

This command requires the Mailbox & Provisioning component to be installed on the
node where it is executed.


Scenario
^^^^^^^^

Your Carbonio infrastructure includes multiple nodes that host the Mailbox &
Provisioning component, for example:

* ``srv02.example.com``
* ``srv04.example.com``

and other nodes that do not host it, such as:

* ``srv10.example.com`` (Chats and Tasks)


Correct approach
^^^^^^^^^^^^^^^^

Run the command on any node that hosts the Mailbox & Provisioning component, for
example::

  carbonio core getLicenseInfo

when executed on ``srv02.example.com`` or ``srv04.example.com``.

In all cases, the command returns the same license information, because licensing
data is managed at the infrastructure level.


Incorrect approach
^^^^^^^^^^^^^^^^^^

If you run the same command on a node that does not host the Mailbox &
Provisioning component (for example, ``srv10.example.com``), the command fails
because the required tools are not available on that node.


Remote-Target Commands
----------------------

Some CLI commands allow access to information belonging to another server, as
long as a target hostname is specified.

These commands must still be executed on a node hosting the Mailbox &
Provisioning component, because they rely on tools provided by that component.

This capability applies only to commands that communicate through the Carbonio
configuration or metadata layer, and not to commands that operate on local files
or service-specific data.


Example — Dumping the Configuration of Another Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some commands allow specifying a target node. For example::

  carbonio config dump server srv10.example.com

This command returns all configuration attributes associated with the server
``srv10.example.com``.

You can run this command from ``srv10.example.com``, ``srv01.example.com``, or
any other Carbonio node hosting the Mailbox & Provisioning component, because
the configuration service is shared and does not require local service access.


Node-Specific Commands
----------------------

Node-Specific commands interact directly with the local service instance.

They must be executed on a node hosting the Mailbox & Provisioning component and
cannot retrieve or modify data for another node.

Typical operations that require local execution include:

* Inspecting storage volumes
* Reading local service configuration
* Checking component-specific status or logs
* Running local utilities and maintenance actions


Example 1 — Checking Volumes on a Mailbox & Provisioning Node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following command retrieves all volumes used by the Powerstore subsystem::

  carbonio powerstore getallvolumes

Because Powerstore data is stored locally on the node running the Mailbox &
Provisioning component, this command must be executed directly on that node.


Scenario
^^^^^^^^

You need to know which volumes are used by the Mailbox & Provisioning component
running on:

* ``srv04.example.com``


Correct approach
^^^^^^^^^^^^^^^^

Connect to ``srv04.example.com`` and run::

  carbonio powerstore getallvolumes

Running the same command on another server (for example,
``srv01.example.com``) does not work, because the information is not available
remotely.


Example 2 — Retrieving Backup Information for a Specific Node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following command displays backup information for the local Mailbox &
Provisioning node::

  carbonio backup getBackupInfo

This command returns backup data only for the node on which it is executed.


Scenario
^^^^^^^^

You need to check backup information for the Mailbox & Provisioning component
running on:

* ``srv05.example.com``


Correct approach
^^^^^^^^^^^^^^^^

Connect to ``srv05.example.com`` and run::

  carbonio backup getBackupInfo

Running the same command on a different node displays backup information for
that node instead, because backup data is stored and managed locally.


Provisioning Commands
---------------------

Provisioning commands operate at the infrastructure level rather than on a
specific service instance or server.

They interact with the central provisioning and directory layer, which
represents the global state of the Carbonio environment.

Unlike Node-Specific commands, provisioning commands:

* Do not access local files, services, or storage
* Do not require a hostname parameter
* Can be executed from any node, including nodes that do not host the Mailbox &
  Provisioning component (for example, a VideoServer node)

As a result, provisioning commands:

* Return global, infrastructure-wide data
* Produce the same output regardless of where they are run
* Apply even when the command is executed on nodes that do not host the Mailbox &
  Provisioning component


Example — Listing All Domains
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following provisioning command retrieves all domains configured in the
infrastructure::

  carbonio prov gad

This command can be run from any node, including nodes that do not host the
Mailbox & Provisioning component (for example, a VideoServer node).

It always returns the complete list of domains defined in the Carbonio
infrastructure.
