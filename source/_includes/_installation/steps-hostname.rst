.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| needs a valid FQDN as hostname and a valid entry in the
:file:`/etc/hosts` file. Therefore, it is necessary to take care of
properly configuring the :file:`/etc/hosts` file, otherwise the services
will not be able to bind to the correct address, leading to a
disruption in |product|\'s functionality.

To configure the file and the hostname, execute these two
commands. First, set the hostname

.. code:: console

   # hostnamectl set-hostname mta1.example.com

then update :file:`/etc/hosts` with IP and hostname

.. code:: console

   # echo -e  "127.0.0.1 localhost\n172.16.0.10 mta1.example.com mta1" >> /etc/hosts

.. hint:: Replace **172.16.0.10** with the local IP of the Node.

You can also simply get the current IP and hostname and save it in the
file :file:`/etc/hosts/`:

.. code:: console

   # echo "$(hostname -I) $(hostname -f)"

.. index:: IPv6

.. card:: IPv6 Support

   In case you need to enable IPv6 on |product|, make sure that the
   :file:`/etc/hosts/` file contains the following line::

     ::1     ip6-localhost ip6-loopback

   .. warning:: The above line **must not contain** references to
      **localhost**, as this would result in disruptions.

      .. parsed-literal::

         ::1     ip6-localhost ip6-loopback :bdg-success:`CORRECT`

         ::1     ip6-localhost ip6-loopback localhost :bdg-danger:`WRONG`
