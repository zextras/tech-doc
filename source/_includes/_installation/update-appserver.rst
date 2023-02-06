.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _upgrade-appserver:

AppServer Nodes
~~~~~~~~~~~~~~~

On nodes with the AppServer (**SRV5** and **SRV6** in our
scenario), stop the zmcontrol service

.. code:: console

   zextras$ zmcontrol stop

Then, upgrade the node following the :ref:`upgrade-single`.

Finally, as the ``zextras`` user, restart the mailbox service.

.. code:: console

   zextras$ zmcontrol start
