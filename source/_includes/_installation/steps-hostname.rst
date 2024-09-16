.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| needs a valid FQDN as hostname and a valid entry in the
:file:`/etc/hosts` file. Therefore, it is necessary to take care of
properly configuring the :file:`/etc/hosts` file, otherwise the services
will not be able to bind to the correct address, leading to a
disruption in |product|\'s functionality.


To configure them, execute these two commands. First, set the
hostname

.. code:: console

   # hostnamectl set-hostname mail.example.com

then update :file:`/etc/hosts` with IP and hostname

.. code:: console

   # echo "172.16.0.10 mail.example.com mail" >> /etc/hosts

You can also simply get the current IP and hostname and save them:


.. code:: console

   # echo "$(hostname -I) $(hostname -f)"

.. hint:: Replace **172.16.0.10** with the local IP of the Node.

         
