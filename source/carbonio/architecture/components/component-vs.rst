.. _component-vs-wsc-install:

Video Server & Video Recording
==============================

Before installing this Component on the |product| infrastructure, make sure
that you installed the :ref:`component-prov-install`, which is a
requirement for this Component.

Install Packages
----------------

This Component consists of *Video Server* and *Video Recording*.

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_architecture/_packages/component-vs-chats.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Check Video Server & Broker
---------------------------

To make sure that videoserver and message broker are connected
successfully, check that in the carbonio-videoserver logs
(:command:`journalctl -u carbonio-videoserver`) you find the line::

  RabbitMQEventHandler: Connected successfullySetup of RabbitMQ event
  handler completed

Video Recording Notes
---------------------

You can enable the Video Recorder at user or COS level: please refer
to sections :ref:`User's configuration <act-conf>` and
:ref:`cos-chat`, respectively, for directions.

A recorded session is temporary stored in directory
:file:`/var/lib/videoserver/` on the Node featuring the |vs| Component:
make sure that this directory has sufficient free space, otherwise
recorded videos can not be stored. As soon as the recording session
terminates, the file will be processed and moved to the Node featuring
the :ref:`component-prov-install`.

.. hint:: You can mount on that location a dedicated disk or
   partition and keep it monitored for space usage.

