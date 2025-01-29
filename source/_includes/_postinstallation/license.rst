.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The last task to complete before finishing installation, is to
activate the |product| license.


How to obtain a |product| License
---------------------------------

#. Fill the `Form <https://zextras.com/carbonio#contactsales>`_ with:

   - First name
   - Last name
   - Company
   - Email
   - Phone (optional)

#. Add the comments you might have on the **Additional notes** textarea

#. Select a country from the drop-down menu

#. Accept |zx| terms and conditions

#. Click the **Submit** button to proceed

A Sales representative will get back to you shortly.


How to activate a |product| License 
-----------------------------------

You can activate the license from the
command line or from the graphical administrator interface.

.. grid::
   :gutter: 3

   .. grid-item-card:: Activate from CLI
      :columns: 6

      As the ``zextras`` user, issue the following command on the Node
      featuring the :ref:`role-prov-install` Role (if you have more
      than one, execute it on either of them), replacing **TOKEN**
      with your licence token.

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
