.. _ap-create-user:

=================
 Create Accounts
=================

In this section we provide directions to create a new account or
shared account, by configuring the most common options. You can then
further configure the user features and data: have a look at the full
list of options for a new account can be found in section
:ref:`ap-accounts`.

If you want to create a *Global Admin* or *Delegated (Domain) Admin*,
please create a new account, then refer to section
:ref:`ap-new-admin`, where you can also find information about
administrator's :term:`rights` (permissions), their management, and
the various types of administrators.

.. index:: Account; new, Account; create new

.. _ap-new-account:

Create an Account
=================

In order to create a new account, click the :bdg-primary:`+` button: a
dialog window opens and allows you to set up the basic configuration
of the new account.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Step 1: Create New Account *John Smith*
      :columns: 12 12 6 6

      We create the first account for the CEO of ACME Corporation and
      provide the following data.

      * **Name**, **Middle Name Initials**, and **Surname** will be
        used to define the user name.  We use only Name (John) and
        Surname (Smith), which result in the JohnSmith **username**.

        If the name or surname contain non-ASCII characters, an
        automatic mapping will be enforced: for example, ``ä``, ``à``
        will become ``a``. When there is no mapping available, message
        :red:`Auto fill user is disabled` will be displayed: in this
        case, the username must be filled manually. This is the case
        for example, for letters using diacritics, cedillas or
        German's ``ß``.

        .. hint:: You can change the automatically generated username at
           will, for example to match company policies.

      * **Password** is the one used by John for the first login **only**

      * **User will change password on the next login** requires that John,
        after the first log in (and before accessing his mailbox) must
        change the password.

      We also explicitly configure the **Account Status** (see :ref:`the
      list of possible values <ap-account-status>`), but do not change
      the **Default COS**.
      Click the :bdg-primary-line:`CREATE WITH THESE DATA` button to
      create the account

      .. note:: When assigning a COS to a user, all the values defined
         in that COS will be inherited by the user. They can be later
         changed on a user basis later, when editing the account.

   .. grid-item::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-details.png

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: (Optional) Step 2: Send OTP or grant rights to
      *John Smith*
      :columns: 12 12 6 6

      Once the account has been created, you can optionally create an
      OTP code for John Smith, that he can use to quickly access his
      account.

      You can also give the account administrative rights, that you
      can customise. In this case, the account creation procedure
      continues and allow to grant Global Administration Rights (see
      Section :ref:`ap-new-admin`) or Delegated rights (see Section
      :ref:`ap-admin-roles`.

   .. grid-item-card::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-otp.png
         :scale: 50 %

.. index:: ! Shared Account, Account; Shared, Shared Account; new

.. _ap-shared-account:

Create a Shared Account
=======================

In order to create a new Shared Account, first :ref:`create a new
account <ap-new-account>`, then select the account and click the
:bdg-primary-line:`EDIT` button. In the :blue:`DELEGATES` tab you can
configure who has access to the account and assigned rights in two
ways: a *Simplified* and an *Advanced* View.  There are small
differences in the two views, the most relevant is how to set the
permission.

.. hint:: Details on the rights that can be granted can be found
   :ref:`in the box <delegates-rights>`.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Simplified View
      :columns: 12 12 6 6

      In the *Simplified View*, select a user or group, then the
      permission and click the :bdg-primary-line:`ADD THE ACCOUNT`
      button to add it as a delegate. The delegated accounts will
      appear at the bottom of the tab.

   .. grid-item-card:: Advanced View
      :columns: 12 12 6 6

      In the *Advanced View*, click :bdg-primary-line:`ADD NEW +`, then
      select an existing user or group (Distribution List). Proceed to
      the next tab (:bdg-primary-line:`SET RIGHTS)` and select the
      right to be assigned to the user or group from the drop-down
      menu.

.. note:: The user who delegates and the user who is the delegated can
   not share the same account; in other words, it is not possible to
   add as a delegated user the same account of the user who is
   delegating.

.. index::
   single: Delegate Rights
   see: User Permissions; Delegate Rights

.. _delegates-rights:

.. card:: Available Delegate's Rights

   The Rights that can be granted to a user are basically to read,
   write, and send emails, and to access e-mails folders. Rights can
   be granted when :ref:`editing an account <ap-accounts>`, in the
   dedicated :blue:`Delegates` tab. Rights can be granted using a
   *Simplified* or an *Advanced* method.

   The *Simplified* method permissions are granted using checkboxes:

   * read, access with no permission to change
   * read/write, full read and write permission
   * send, the recipient will see as sender the selected user
   * send on behalf, similar to the previous. the recipient will
     see the the sender's e-mail preceded by the string *On
     behalf of*

   In the *Advanced* method, rights are given in a slight different
   way and can be defined in a more granular way. In the :blue:`SET
   RIGHTS` step it is possible to grant the following rights: **Send
   Mails only**, **Read Mails only**, **Send and Read Mails**,
   **Manage** and **Send, Read, and Manage Mails (all of the
   above)**. Depending on the choice, the bottom part will show
   additional options, according to the following table.

   .. list-table::

      * - Option
        - Additional options
      * - Send Mails only
        - Send, Send on Behalf of
      * - Read Mails only
        - folders to share
      * - Send and Read Mails
        - Send, Send on Behalf of; folders to share
      * - Manage
        - Folders to share
      * - Send, Read, and Manage Mails
        - Send, Send on Behalf of; folders to share

