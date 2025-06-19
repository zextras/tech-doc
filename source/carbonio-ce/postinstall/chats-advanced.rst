.. _wsc-adv:

==============
 WSC Advanced
==============

This section contains advanced |wsc| configuration.

.. _wsc_adv-conf:

WSC Configuration
=================

In this section we present advanced configuration options for |wsc|.

.. index:: WSC; user search by CLI

User Search Across Domains
--------------------------

In a multi-domain |product| infrastructure, Administrators can decide
on which domains a user can be found when starting a new chat.

The search on all domains can be activated with CLI command

.. code:: console

   zextras$ carbonio prov mcf carbonioSearchAllDomainsByFeature TRUE

To allow users to search other users only on their domain, use
``FALSE`` instead of ``TRUE``.

.. seealso:: This option is available on the |adminui|, please see the
   :ref:`dedicated box <wsc-user-search>` in the Domain's global
   settings.
