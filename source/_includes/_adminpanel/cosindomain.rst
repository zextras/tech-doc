
When |product| is configured with multiple domains, it is possible for
:ref:`ap-global-admins` to limit the amount of accessible Modules, the
quota, and the number of accounts available within a domain by
employing suitable COSes on the server.

In our scenario, the |product| infrastructure defines three COSes:

* **Lite** featuring the Mails, Calendars, and Contacts modules and
  a user quota of 1Gb.

* **Basic** with Mails, Calendars, Contacts, and Chats modules and
  10GB of quota

* **Pro** has full access to all modules and 30Gb of quota

The Global Administrator wants to define a new domain, **acme.com**,
limiting the accounts to **200**, including 50 **Base** and 30
**Pro**.

This scenario can be set up as follows: 

#. Create the new domain (e.g., using the :bdg-primary:`NEW` button)
   and assign it 200 *manageable accounts* and 30Gb of quota

#. Select the domain and in its *General Settings*, scroll to the
   bottom and select the Lite, Basic, and Pro COSes and assign
   them the respective number of accounts (120, 50, and 30), then
   click :bdg-primary-line:`LINK` or :bdg-primary-line:`DUPLICATE`

   .. hint:: By duplicating a COS, it will be named as, e.g.,
      *lite.acme.com* and will be considered as an entirely separated
      COS. Any change to the original COS will therefore **not be
      propagated** to lite.acme.com.

#. In the COS list, which is populated while carrying out step #2,
   select the first one (lite.acme.com) as the default one


