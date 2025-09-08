
Activate license
================

The last task to complete before finishing installation is to
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

#. Tick the CAPTCHA *I'm not a robot*, select the images, and click
   :bdg-primary:`VERIFY`

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
      featuring the :ref:`component-prov-install` Component (if you have more
      than one, execute it on either of them), replacing **TOKEN**
      with the licence token provided by the Sales Team.

      .. code:: console

         zextras$ carbonio core activate-license TOKEN

   .. grid-item-card:: Activate from |adminui|
      :columns: 6

      Refer to section :ref:`ap-subscriptions` for directions.

