.. _ap-create-user:

=================
 Create Accounts
=================

In this section we provide directions to create a new account for a
user or a Global Administrator, by configuring the most common options.

.. index:: Account; new, Account; create new

.. _ap-new-account:

Create an Account
=================

In order to create a new account, click the :bdg-primary:`+` button: a
dialog window opens and allows you to set up the basic configuration
of the new account.

.. card:: Create New Account *John Smith*

   .. figure:: /img/adminpanel/new-account-details.png
      :align: right
      :scale: 50%

      Account creation interface

   We create the first account for the CEO of ACME Corporation and
   provide the following data.

   * **Name**, **Middle Name Initials**, and **Surname** will be used
     to define the user name. We use only Name (John) and Surname
     (Smith), which result in the JohnSmith **username**.

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

.. index:: Global Admin; new, Global Admin; create new

.. _ap-new-admin:

Create New Global Admin
=======================

To create a new Admin, you need first to create the account, as
explained in the :ref:`previous section <ap-new-account>`. We give
this account the *acme_admin* name. 

Then, from the account list, select the new account, then click the
pencil icon to edit it. 

.. _fig-create-admin:

.. figure:: /img/adminpanel/create-global-admin.png
   :width: 50%

   Create a new Global Admin.

To make *acme_admin* a Global Admin, in the :blue:`Admnistration` tab
and click the switch with label **Global administration**, then
save. The *acme_admin* user is now able to access the |adminui|.
