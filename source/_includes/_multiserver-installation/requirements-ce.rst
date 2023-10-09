
The Multi-Server scenario depicted in the previous section is recommended
for a |product| environment that serve around **150 users**.

.. _multi-server-hw-requirements:

Hardware Requirements
~~~~~~~~~~~~~~~~~~~~~

For each node, these are the hardware requirements to comply with. The
**Disk Space** mentioned in the table refers only to the Operating
System and not the data (e-mail quota and e-mail traffic, number of
documents stored, and so on), because space requirements for the data
may vary considerably.

Moreover, you must take into account the following:

* The Node that hosts |storage| (**SRV3**) and therefore the emails,
  is the node requiring more disk space.
* The |file| service requires **4GB** of RAM to start, so make sure
  that the node hosting it (**SRV4**) has at least **6GB** of RAM

Purely as an example, if you give a quota of 5GB to each of the 150
users, you need to assign **780GB of disk space** (30GB for the OS and
at 750 for user's total quota) to **SRV3**.

.. csv-table::
   :header: "Node", "CPUs", "RAM", "Disk Space (OS)"

   "SRV1", "4vCPU", "8GB", "120 GB"
   "SRV2", "4vCPU", "10GB", "50 GB"
   "SRV3", "4vCPU", "16GB", "50 GB"
   "SRV4", "4vCPU", "8GB", "50 GB"

Additional Requirements
~~~~~~~~~~~~~~~~~~~~~~~

Each Node in a Multi-Server installation must satisfy the
:ref:`software-requirements` and the :ref:`more-requirements`.

If you install on RHEL 8, make sure that each node satisfies the
:ref:`rhel-requirements`,
     
The following is a list of requirements that are required for
|product| to operate flawlessly.

* If none of the four nodes is exposed to the Internet, you need to
  forward two ports from the public IP: port **25/smtp** to the Node
  featuring MTA (SRV2) to be able to receive mail, and port
  **443/https** to the node installing the Proxy (SRV2) to allow users
  to access their webmail from a remote location

* In case there are problems in the internal network communication,
  try to disable the firewall and try again: if it works, there was
  probably some firewall rule preventing communication.

* If you plan to enable other protocols (e.g., POP, IMAP) you should
  forward also these ports accordingly. You can refer to section
  :ref:`fw-ports` for a list. Do not open these ports if you do not
  need these protocols!

* Also, for security reasons, port 6071, to access the |adminui|
  should never be exposed on the Internet, but reachable only from a
  VPN tunnel or similar mechanisms

* The same applies for SSH access to the Nodes: it should only be
  enabled from internal/management networks, while any remote access
  must be done via VPN tunnel or equivalent mechanism

* The hostname of each Node must be a |FQDN| that can be internally
  resolved to each other via DNS
