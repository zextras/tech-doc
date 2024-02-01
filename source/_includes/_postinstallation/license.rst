.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The last task to complete before the installation is complete, is to
activate |product| license.  You can activate the license from the
command line or from the graphical administrator interface.

.. grid::
   :gutter: 3

   .. grid-item-card:: Activate from CLI
      :columns: 6

      As the ``zextras`` user, issue the following command, replacing
      **TOKEN** with your licence token.

      .. code:: console

         zextras$ carbonio core activate-license TOKEN

   .. grid-item-card:: Activate from |adminui|
      :columns: 6

      Refer to section :ref:`ap-subscriptions` for directions.

   .. grid-item-card::
      :columns: 12

      .. figure:: /img/adminpanel/ap-subscriptions.png
         :width: 99%

         Sample subscription page with enables services.
