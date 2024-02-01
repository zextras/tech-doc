.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


Before starting with the actual installation, carry out the following
tasks *on* **each** *of the six nodes*.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Task 1: Configure repositories
   ^^^^^

   .. include:: /_includes/_installation/step-repo-conf-ce.rst
   .. include:: /_includes/_installation/repo-info.rst

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Task 2: Setting Hostname
   ^^^^^
   
   .. include:: /_includes/_installation/steps-hostname.rst

   It is mandatory to configure the hostname, especially on the
   Directory-Server node, otherwise the services will not be able to
   bind to the correct address, leading to a disruption in
   |product|\'s functionality.
