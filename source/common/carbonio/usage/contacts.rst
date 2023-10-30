.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

In the Contacts component you can keep track of all the people with
whom you exchange e-mails and group them in address books. Existing
address books appear on the column on the right of the component's
list.  You can create new contact by using the |new| button and
selecting `New Contact`; they will be stored under the `Contacts`
section of the Contacts component. You can also choose under which
address book the new contact is stored. Additionally, :ref:`mail-tags`
can be added to any contacts.

.. note:: Addresses of people to whom you send an e-mail are
   automatically added to the `Emailed Contacts`.

Deleted contacts land in the special `Trash` address book, which keeps
them until you manually empty it. To do so, right-click the address
book and select `Empty trash`.

A right-click on the address book allows to carry out a few action on
it and its content: edit, share, empty, or delete it. Moreover, new
address books can be created.
For each contact, icons allow to carry out different actions: delete,
move, or write an e-mail to the contact.

.. hint:: To move the contacts from one address book to another, you
   can also drag the contact and drop it on the destination address
   book.

If any colleague has shared an address book, you can click the
:bdg-primary-line:`FIND SHARES` button under `Shared Address Book` and
provide the e-mail address. You will see all the address books shared
by the user.

You can search among contacts using the :ref:`search bar
<global-search>`. You can then refine your search by clicking the
:bdg-primary:`ADVANCED FILTER` button. Here you can also choose to
include shared address books in the search.

Configure a CardDav Client
--------------------------

Adding a |product| address book to your favourite CardDAV client is
straightforward and requires only a few steps.

In this scenario, the user *john.smith@example.com* wants to import
in Mozilla's Thunderbird an address book from on the domain
*mail.example.com*. In the remainder, replace these values with
suitable ones.

.. card:: Step 1. New Address book

   On your client, go to the Calendar and select **New Address Book**,
   providing the **Username** and the **Location**, which has format
   ``https://<domain>/dav/username``, so
   *https://mail.example.com/dav/john.smith@example.com*
 
   .. image:: /img/usage/new-addressbook.png
      :align: center
      :width: 40%

.. card:: Step 2. Insert credentials

   Authenticate co |product| by inserting the username and password
   to access the address book.
   
   .. image:: /img/usage/credential-addressbook.png
      :align: center
      :width: 40%

.. card:: Step 3. Select Address Books

   You will be then presented a list, from which to choose the address
   books to import in the client.

   .. image:: /img/usage/choose-addressbook.png
      :align: center
      :width: 40%

.. card:: Other clients

   You are now done! The imported address books will show up in the list of your client.

   .. image:: /img/usage/addressbook-client.png
      :align: center
      :width: 40%
