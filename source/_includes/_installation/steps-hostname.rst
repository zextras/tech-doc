.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| needs a valid FQDN as hostname and a valid entry in the
:file:`/etc/hosts` file. To configure them, execute these two
commands. First, set the hostname

.. code:: console

   # hostnamectl set-hostname mta1.example.com

then update :file:`/etc/hosts` with IP and hostname

.. code:: console

   # echo -e "127.0.0.1 localhost\n172.16.0.10 mta1.example.com mta1" > /etc/hosts

You can also simply get the current IP and hostname and save them:


.. code:: console

   # echo "$(hostname -I) $(hostname -f)"

.. hint:: Replace **172.16.0.10** with the local IP of the Node.

It is important to check that in the IPv6 section of ``/etc/hosts`` file
there is NO reference to localhost:

      .. code:: console

         # This must be avoided
         # ::1     ip6-localhost ip6-loopback localhost

      .. code:: console
         
         # This is correct
         ::1     ip6-localhost ip6-loopback
         
