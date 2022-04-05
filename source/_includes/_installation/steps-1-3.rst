
.. _single-server-install:

Single-Server Installation
==========================

The installation on Ubuntu 20.04 is organised in steps, some of which are preliminary configuration tasks, and some is
optional.

.. _pre-installation-steps:

.. div:: sd-fs-5

   :octicon:`gear` Pre-Installation Steps

.. _installation-step1:
.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Interfaces
   ^^^^^

   We suggest to set up two NICs on the server, and assigning to one
   a local IP address, so that |product| can always use it and rely on
   it even if the main, public IP address changes. This setup is also
   useful for testing purposes or when setting up a demo.

   .. dropdown:: Example: Assign an IP Address to a local NIC.

      Assuming that a NIC identified as **enp0s3** is free on your
      system, for example in Virtualbox use a `Network adapter` of
      type **Internal Network**, you can assign it an IP address in
      the preferred way:

      * use the CLI, for example  :command:`ifconfig enp0s3 172.16.0.10 up`

      * Use netplan.io and add these lines to file
        :file:`/etc/netplan/01-netcfg.yaml`::

           enp0s3:
             dhcp4: false
             dhcp6: false
             addresses: [172.16.0.10/24]

        then issue the command :command:`netplan apply`

.. _installation-step2:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Setting Hostname
   ^^^^^

   |product| needs a valid FQDN as hostname and a valid entry in the
   :file:`/etc/hosts` file. To configure them, execute these two commands.

   1) first, set the hostname

      .. code:: console

         # hostnamectl set-hostname mail.carbonio.local

   2) then update :file:`/etc/hosts`

      .. code:: console

         # echo "172.16.0.10 mail.carbonio.local mail" >> /etc/hosts

.. _installation-step3:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3: DNS Resolution
   ^^^^^

   |product| needs valid DNS resolution for:

   - the domain (MX and A record)
   - the FQDN (A record)

   So make sure that the DNS is correctly configured for both **A**
   and **MX** records.

   You can use any DNS resolution server, including `dnsmasq`,
   `systemd-resolved`, and `bind`.

   .. dropdown:: Example: Set up of dnsmasq

      As an example, we provide here directions to install and
      configure **dnsmasq**. This task is **optional** and suitable
      for demo or testing purposes only.

      .. warning:: On Ubuntu **20.04**, installing and running dnsmasq
         may raise a port conflict over port **53 UDP** with the
         default `systemd-resolved` service, so make sure to disable
         the latter before continuing with the next steps.

      .. code:: bash

         # apt install dnsmasq

      To configure it, add the following lines to file
      :file:`/etc/dnsmasq.conf`::

          server=1.1.1.1
          mx-host=carbonio.local,mail.carbonio.local,50
          host-record=carbonio.local,172.16.0.10
          host-record=mail.carbonio.local,172.16.0.10

      Finally, restart the **dnsmasq** service

        .. code:: console

           # systemctl restart dnsmasq
