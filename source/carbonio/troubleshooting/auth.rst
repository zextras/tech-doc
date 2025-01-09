.. _ts-auth:

================
 Authentication
================

This sections contains procedures to deal with troubles on everyday
activities with the Authentication module.

.. _ts-auth-keys:

Renew Pre-Authentication Keys
=============================

The renewal process of the pre-auth keys is a two-step procedure.

The first is to check whether keys have already been generated, by
using, as the |zu| user, the piped commands:

.. code:: console

   zextras$ carbonio prov -l gad | while read d; do echo gd $d zimbraPreAuthKey; done | carbonio prov -l

In case you receive some output, use the following command, again as
the |zu| user, to regenerate the keys.


.. code:: console

   zextras$ carbonio prov -l gad | while read d; do echo md $d zimbraPreAuthKey \"\"; done | carbonio prov -l
