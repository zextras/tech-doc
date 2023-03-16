.. _cli-features:

===========================
 Setting Features from CLI
===========================

In this section we describe a few commands to query of modify the
availability of some |product| component at COS or account level via
the CLI, and therefore is the counterpart of |adminui| sections
:ref:`COS / features <cos-features>` and :ref:`Domains / Accounts /
Edit <ap-accounts>`.

The following attributes are available, that control if the feature is
available to a user or COS. 

.. list-table::

   * - **Attribute and defaults values**
     - **Feature**
   * - carbonioFeatureMailsAppEnabled, ``TRUE``
     - The Mails component is available on :ref:`mobile apps
       <mobile_apps>`.
   * - carbonioFeatureFilesEnabled: ``TRUE``
     - The |file| component is available.
   * - carbonioFeatureFilesAppEnabled: ``TRUE``
     - The |file| component is available on :ref:`mobile apps
       <mobile_apps>`.

In order to modify these values, you can use or adapt the following commands

.. card::

   * Disable the Mails App for account johnsmith\@acme.example.

     .. code:: console

        zextras$ carbonio prov modifyAccount johnsmith@acme.example carbonioFeatureMailsAppEnabled FALSE

   * Check whether the |file| component is enabled in COS `default`.

     .. code:: console

        zextras$ carbonio prov getCos default carbonioFeatureFilesEnabled

        # name default
        carbonioFeatureFilesEnabled: TRUE

