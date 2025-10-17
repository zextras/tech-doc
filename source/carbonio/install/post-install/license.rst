.. _license:

Activate license
================

The last task to complete before finishing installation is to purchase
and activate the |product| license. To obtain the license, visit the
`dedicated page <https://zextras.com/get-carbonio>`_ in which you can
find the information to complete the purchase process.

Once you received the license token, you can use it to activate the
|product| from the command line or from the graphical administrator
interface.

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

