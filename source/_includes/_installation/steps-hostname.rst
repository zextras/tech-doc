|product| needs a valid FQDN as hostname and a valid entry in the
:file:`/etc/hosts` file. Therefore, it is necessary to take care of
properly configuring the :file:`/etc/hosts` file, otherwise the services
will not be able to bind to the correct address, leading to a
disruption in |product|\'s functionality.

To configure the file and the hostname, execute these two
commands.

.. note:: Replace the values ``srv1.example.com`` and ``172.16.0.10``
   with values suitable for your setup.

First, set the hostname

.. code:: console

   # hostnamectl set-hostname srv1.example.com

then replace the content of the :file:`/etc/hosts` file with IP and
hostname.

.. code:: console

   # echo -e  "127.0.0.1 localhost\n172.16.0.10 srv1.example.com srv1" > /etc/hosts

You can also simply get the current IP and hostname and save it in the
file :file:`/etc/hosts/`:

.. code:: console

   # echo "$(hostname -I) $(hostname -f)"
