.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The installation on Ubuntu 20.04 is organised in steps, some of which
are preliminary configuration tasks, and some is optional.

.. _installation-step1:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Setting Hostname
   ^^^^^

   |product| needs a valid FQDN as hostname and a valid entry in the
   :file:`/etc/hosts` file. To configure them, execute these two
   commands. First, set the hostname

      .. code:: console

         # hostnamectl set-hostname mail.carbonio.local

   then update :file:`/etc/hosts`

      .. code:: console

         # echo "172.16.0.10 mail.carbonio.local mail" >> /etc/hosts

      .. hint:: Replace **172.16.0.10** with the actual management IP
         to be assigned to the server.
