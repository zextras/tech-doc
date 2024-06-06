.. _cli-analytics:

======================
 Analytics Management
======================

|zx| collects anonymous usage data of |product| with the purpose to
create metrics and improve the product itself and the overall User
Experience.

There are two attributes that control the collection of usage data,
and both are **disabled** by default, meaning that no usage data is
collected and sent to |zx| without the explicit consent of the
|product| Administrators.

The first attribute is called ``carbonioSendAnalytics``, which is
available only to :ref:`ap-global-admins` and is part of the global
configuration, i.e., it is valid for the whole |product|
infrastructure.

To get its current value, use command

.. code:: console

   zextras$ carbonio prov gcf carbonioSendAnalytics

To enable the analytics, use command

.. code:: console

   zextras$ carbonio prov mcf carbonioSendAnalytics TRUE

To disable, replace :command:`TRUE` with ``FALSE``.
 
The other attribute is available at COS and Account level and is
available to the :ref:`ap-domain-admins`.

To get its current value for the COS named *default*, use command

This attribute can also be modified from the |adminui| by using the
*Allow data analytics* switch under :menuselection:`Admin Panel -->
Privacy` (see Section :ref:`ap-privacy`).

.. code:: console

   zextras$ carbonio prov gc default carbonioPrefSendAnalytics

To enable the analytics in the same COS, use command

.. code:: console

   zextras$ carbonio prov mc default carbonioPrefSendAnalytics FALSE

To disable, replace :command:`TRUE` with ``FALSE``.
