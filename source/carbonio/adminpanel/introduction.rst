.. _adminpanel:

|adminui| Overview
==================

|adminui| is the component that allows access to the administration
functionalities of |carbonio|.  Like for every other component, it can
be reached using a :ref:`supported browser <browser_compatibility>`
and point it to https\://acme.example:6071/, replacing `acme.example`
with your domain.

To access the |adminui|, you need an account that is marked as
**Administrator**. After the first installation, only the default
Global Admin exists, whose username is ``zextras@acme.example``, but
its password is empty and needs to be configured from the CLI using
the command shown in Section :ref:`manage-admins`. When a password
expires and the Admin tries to login, a dialog will be show, which
informs of the expired password and allows to change it.

Once logged in, more Admins can be added from the |adminui|;
please refer to section :ref:`ap-new-admin` for directions.

|adminui| allows to manage the |product| domains, mailstores,
accounts, |cos|, and privacy settings. The overall organisation of the
panel is similar to the others components: a the *Top Bar* allows
quick creation of a new domain or COS by clicking the |create| button,
while navigation items are on the left-hand column.

The landing page is shown in :numref:`fig_ap-top` and
:numref:`fig_ap-bottom`.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item::
      :columns: 6
      
      .. _fig_ap-top:

      .. figure:: /img/adminpanel/AP-landing-top-cb.png
         :width: 100%

         The upper part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      The upper part contains information about the logged in
      administrator, the version of |product| and, on the top.right
      corner. the date and time of the last login.
      
      Moreover, clicking on either of the boxes will open the
      |adminui| page for the Accounts and distribution list,
      respectively.

      The list of Notifications follows: click the `GO TO
      NOTIFICATION` button to open the :ref:`dedicated page
      <ap-notifications>`.

      A banner will be shown in case the Maintenance is expired, which
      upon clicking will take you to the :ref:`ap-subscriptions` page
      where you can check the license details and enter a new token.

.. grid:: 1 1 2 2
   :gutter: 3
                 
   .. grid-item::
      :columns: 6

      .. _fig_ap-bottom:

      .. figure:: /img/adminpanel/AP-landing-bottom.png
	 :width: 100%

         The lower part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      In the lower part are shown the versions of |carbonio| and of
      |carbonio| Core for all the servers defined within the
      |carbonio| infrastructure. The button `GO TO MAILSTORES SERVERS
      LIST` allows to open the :menuselection:`Storage --> Global
      Servers --> Server List` page (see :ref:`ap-storage`).


