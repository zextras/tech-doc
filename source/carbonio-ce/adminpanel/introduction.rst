.. _adminpanel:

|adminui| Overview
==================

|adminui| is the component that allows access to the administration
functionalities of |carbonio|.  Like for every other component, it can
be reached using a :ref:`supported browser <browser_compatibility>`
and point it to https\://acme.example:6071/, replacing `acme.example`
with your domain.

To access the |adminui|, you need an account that is marked as
**Administrator**. The installation process creates by default one
Administrator, whose username is ``zextras@acme.example``, but its
password is empty and needs to be configured from the CLI using the
command shown in Section :ref:`change-pwd`. You need to set this
password before being able to access the |adminui|. When a password
expires and the Admin tries to login, an informative dialog will be
show, which allows to change password.

Once logged in, more Global Admins can be added from the |adminui|;
please refer to section :ref:`ap-new-admin` for directions.

.. card:: The ``zextras`` and ``zextras@example.com`` users

   There is a clear distinction between these two users, which are
   intended to execute different tasks:

   ``zextras``
      This the **unix** account of the administrator and must be used to
      carry out administrative tasks from the command line.

   ``zextras@example.com``
      This is the default administrator user to be used to access the
      Admin UI and manage |product| from the web interface.

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
         :width: 100%

         The upper part of Admin Panel's landing page

   .. grid-item::
      :columns: 6

      The upper part contains information about the logged in
      administrator, the version of |product| and, on the top-right
      corner a user menu to be clicked to go to the documentation or
      log out, right above the date and time of the last login.

      Moreover, clicking on either of the boxes will open the
      |adminui| page for the Accounts and distribution list,
      respectively.

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
      Servers --> Server List` page.
