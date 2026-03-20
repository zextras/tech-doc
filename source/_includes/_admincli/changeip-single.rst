.. _change-ip:

Change the Private IP address
=============================

This guide helps you in changing the private IP address of a |product| infrastructure.

Suppose you are in the following scenario.

+-------------------+-------------------+----------------------+
|                   | Current           | New                  |
+===================+===================+======================+
| IP Address        | 10.0.0.50         | 192.168.10.50        |
+-------------------+-------------------+----------------------+
| Subnet            | 10.0.0.1/24       | 192.168.10.1/24      |
+-------------------+-------------------+----------------------+


You have a Single-Server |product| with IP address **10.0.0.50** and
subnet *10.0.0.1/24*. You need to move it to a different IP in a
different subnet and assign it the new IP address **192.168.10.50**
(subnet *192.168.10.1/24*).

Before starting, make sure that all |product| services are in running
state.

When you physically change the IP address you will see that almost all |product| services are
stopped, because they can not bind to the (new) IP address.

To fix the problem, here are the steps to change |product|
configuration, keeping in mind that:

* If you want to change IP address, but not the subnet (e.g., the new
  IP address is 10.0.0.135), you need to only carry out the directions
  in Section :ref:`ip-change-net`

* If you want to change IP Address **and** the subnet, you need to
  follow the instructions in both Sections, :ref:`ip-change-net` and
  :ref:`ip-change-mta`

In all cases, execute also the tasks listed in Section
:ref:`ip-change-vs`.

.. _ip-change-net:

Modify Network Configuration
----------------------------

The first step is to edit, as the ``root`` user, the
:file:`/etc/hosts` file and replace the old IP with the new IP.

.. code-block:: text

   OLD IP
   10.0.0.50 crb-01.example.com crb-01

   NEW IP
   192.168.10.50 crb-01.example.com crb-01

Next, restart all |product| services.

.. include:: /_includes/_general/carbonio-restart.rst

After the command completes, you will notice that all services but
``service-discover`` (|mesh|) are running. This is because you need to
manually edit its configuration file,
:file:`/etc/zextras/service-discover/config.json`.

As the ``zextras`` user, replace in this file the ``bind_addr``, so
that the file contains the new IP::

   "bind_addr": "192.168.10.50"

Restart the **service-discover** service:

.. code:: console

   systemctl restart service-discover.service

.. _ip-change-mta:

Modify MTA Configuration
------------------------

In case of a subnet change, it is necessary to regenerate the MTA
configuration as well. As the ``zextras`` user, verify that the
networks on which the MTA operates include the old one (*10.0.0.50*),
for example:

.. code:: console

   zextras$ postconf mynetworks
   mynetworks = 127.0.0.0/8 [::1]/128  10.0.0.50/24

You need to modify that configuration to include the new subnet
(*192.168.10.1/24*) using the command

.. code:: console

   zextras$ carbonio prov ms crb-01.example.com zimbraMtaMyNetworks \
   '127.0.0.0/8 [::1]/128 192.168.10.1/24'

Reload the MTA service

.. code:: console

   zextras$ postfix reload

Finally, Restart |product|

.. include:: /_includes/_general/carbonio-restart.rst

.. _ip-change-vs:

Modify |vs| Configuration
-------------------------

Edit file :file:`/etc/janus/janus.jcfg`, search the line with the
variable **nat_1_1_mapping** and replace the value with the new one
(**192.168.10.50**).


.. code-block:: ini

   nat_1_1_mapping = 192.168.10.50

.. note::

   In a real-world deployment, the value of ``nat_1_1_mapping`` is
   typically a **public IP address** (used for NAT), rather than a
   private one as shown in this example.