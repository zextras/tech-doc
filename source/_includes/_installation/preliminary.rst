.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


Before starting with the actual installation, carry out the following
two tasks on **each** Node.

.. card:: Task 1. Configure repositories
                     
   .. include:: /_includes/_installation/step-repo-conf-cb.rst
   .. include:: /_includes/_installation/repo-info.rst

.. card:: Task 2. Setting Hostname
   
   .. include:: /_includes/_installation/steps-hostname.rst

   Care will need to be taken in properly configuring the ``hosts`` file otherwise the services will not be able to bind to the correct address, leading to a disruption in |product|\'s functionality.

.. card:: Naming convention
   
   When naming nodes (in case of a multiserver installation) we suggest looking for a match between the node name and the role(s) it performs, example:

   * **proxy1.example.com** (for a Proxy node)
   * **mta1.example.com** (for an MTA node)

   And so on ...

   This way if you have multiple nodes performing the same role you just need to increase the sequence number:

   * **proxy2.example.com** (for a second Proxy node)
   * **mta2.example.com** (for a second MTA node)

   And so on ...

