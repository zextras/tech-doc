.. index:: IP change

.. _change-ip:

Change the Private IP address
=============================

This guide helps you in changing the private IP address of a
Single-Server |product| infrastructure.

Introduction
------------

Suppose you are in the following scenario.

You have a Single-Server |carbonio| with IP address **10.0.0.50** and
subnet *10.0.0.1/24*. You need to move it to a different IP in a
different subnet and assign it the new IP address **192.168.10.50**
(subnet *192.168.10.1/24*).

Before starting, make sure that all |product| services are in running
state, that is, when you execute as the ``zextras user`` the command
:command:`zmcontrol status`, all services are shown as ``Running``.

.. note:: If you are on **RHEL 9**, replace with :command:`zmcontrol
   status` with the commands reported in the dedicated :ref:`systemd
   box <rhel-systemd>`.

When you physically change the IP address (e.g., you change the
configuration of the router or switch to serve a new IP to
|product|), you will see that almost all |carbonio| services are
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

.. parsed-literal::

   10.0.0.50 crb-01.example.com crb-01 :bdg-danger:`OLD IP`

   192.168.10.50 crb-01.example.com crb-01 :bdg-success:`NEW IP`

Next, restart all |product| services. As the ``zextras user`` execute

.. code:: console

   zextras@crb-01:~$ zmcontrol restart

After the command completes, you will notice that all services but
``service-discover`` (|mesh|) are running. This is because you need to
manually edit its configuration file,
:file:`/etc/zextras/service-discover/config.json`.

As the ``zextras`` user, replace in this file the ``bind_addr``, so
that the file contains the new IP::

   {
     "bind_addr": "192.168.10.50"
   }

Again, restart |product| as the ``zextras user``.

.. code:: console

   zextras@crb-01:~$ zmcontrol restart

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

.. code:: console

   zextras$ zmcontrol restart

..
   .. _ip-change-pv:

   Modify Preview Component Configuration
   --------------------------------------

   Edit file :file:`/etc/carbonio/preview/config.ini` and replace the
   values of variables **nginx_lookup_servers_full_path_urls** and
   **memcached_server_full_path_urls** with the new IP address
   (**192.168.10.50**) ones.

   .. code-block:: ini

      nginx_lookup_server_full_path_urls = https://192.168.10.50:7072
      memcached_server_full_path_urls = 192.168.10.50:11211

   In case you have multiple Proxy Nodes, add the IP addresses of all
   Proxy Nodes as a comma-separated list, for example (assuming
   **192.168.10.51** is the second Proxy Node's IP).

   .. note:: In case you have a Multi-Server infrastructure, replace the
      192.168.10.50 IP address in the snippets below with the correct IP
      addresses, corresponding to the Proxy Node's IP address(es).

   .. code-block:: ini

      nginx_lookup_server_full_path_urls = https://192.168.10.50:7072,https://192.168.10.51:7072
      memcached_server_full_path_urls = 192.168.10.50:11211,192.168.10.51:11211

   .. seealso::

      More information in Section :ref:`conf-memcached`

.. _ip-change-vs:

Modify |vs| Configuration
-------------------------

Edit file :file:`/etc/janus/janus.jcfg`, search the line with the
variable **nat_1_1_mapping** and replace the value with the new one
(**192.168.10.50**).


.. code-block:: ini

   nat_1_1_mapping = 192.168.10.50
