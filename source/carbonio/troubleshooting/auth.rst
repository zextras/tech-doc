.. _ts-auth:

================
 Authentication
================

This sections contains procedures to deal with troubles on everyday
activities with the Authentication module.

Pre- Authentication Keys
------------------------

In some cases it may be necessary to delete the pre-auth keys generated for access to Carbonio.
Below are the steps required to execute this task

List pre-auth keys
------------------

Pre-auth keys are defined at the domain level. The following command searches all domains to see if pre-auth keys have been defined.

.. code:: cosole

   zextras$ carbonio prov -l gad | while read d; do echo gd $d zimbraPreAuthKey; done | carbonio prov -l


Empty pre-auth keys
-------------------

The following command empties the pre-auth keys for each domain.

.. code:: cosole

   zextras$ carbonio prov -l gad | while read d; do echo md $d zimbraPreAuthKey \"\"; done | carbonio prov -l
