.. _adminpanel:

=========
|adminui|
=========

|adminui| is the component that allows access to the administration
functionalities of |carbonio| and is installed by default from
|product| 22.11.0 onwards. It is not available for previous versions,
but can be installed after upgrading to that version, see
:ref:`carbonio-upgrade`.

Like for every other component, it can be reached using a
:ref:`supported browser <browser_compatibility>` and point it to
https://mail.example.com:6071/login, replacing `mail.example.com` with
your domain.

To access the |adminui|, the default user is
``zextras@mail.example.com``, whose password should be changed after the
first installation using the command shown in :ref:`Create System User
<create-admin-user>`.

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

      .. figure:: /img/adminpanel/AP-landing-top.png

         The upper part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      In the upper part, clicking on either of the boxes will open the
      |adminui| page for the Accounts and mailing list, respectively.

      The list of Notifications follows: click the `GO TO
      NOTIFICATION` button to open the :ref:`dedicated page
      <ap-notifications>`.      

.. grid:: 1 1 2 2
   :gutter: 3
                 
   .. grid-item::
      :columns: 6

      .. _fig_ap-bottom:

      .. figure:: /img/adminpanel/AP-landing-bottom.png

         The lower part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      In the lower part are shown the versions of |carbonio| and of
      |carbonio| Core for all the servers defined within the
      |carbonio| infrastructure. The button `GO TO MAILSTORES SERVERS
      LIST` allows to open the :menuselection:`Mailstores --> Global
      Servers --> Server List` page (see :ref:`ap-servers`).
      
