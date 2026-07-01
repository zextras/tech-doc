
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

Resetting Quota Values to the Inherited Class of Service Value
--------------------------------------------------------------
Administrators can quickly restore quota settings to the value inherited from an account's Class of Service (COS) by using the Reset icon available next to quota-related input fields.
When a quota value has been modified for a specific account, click the Reset icon to discard the account-specific custom value and restore the quota value defined by the account's COS. 
This provides a faster alternative to manually reconfiguring the account.

.. note:: Hovering over the Reset icon displays a tool tip indicating that the field can be reset to its inherited COS value.

Benefits
--------
The reset action simplifies quota management by allowing administrators to:
 1. Quickly recover from incorrect account-specific quota configurations.
 2. Remove temporary quota overrides.
 3. Restore the quota value inherited from the account's Class of Service (COS) with a single click.
 4. Maintain centralized quota management by relying on Class of Service (COS) settings instead of individual account overrides.
 5. Improve visibility and consistency of quota policies across accounts by managing quotas through COS values.
 6. Reduce configuration errors and administrative effort.
