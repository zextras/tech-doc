.. _component-wsc-install:

|wsc|
=====

|cwsc| Component is a multi-layered software that adds the video meeting
and recording functionalities to |product|.

If you plan to install this Component in an existing |product|
infrastructure, please read carefully Section :ref:`wsc-install`.

.. _component-wsc-limits:

Limitations
-----------

In the current release |release|, the following limitation apply to
the installation of the |wsc| Component

* It can not be installed on the same Node as |vs|
* Data from the legacy Chats module can not be exported to new |wsc|
  Component

.. _component-wsc-req:

Requirements
------------

The |wsc| Component is quite complex in terms of both internal architecture
and installation, therefore it requires to pay some attention while
installing it:

* All commands and all file editing activities must be executed as the
  ``root`` user, unless noted differently

* The ``carbonio-user-management`` package must be installed in the
  |product| infrastructure (it is part on the
  :ref:`component-proxy-install` Component)

* |cwsc| requires that some ports be forwarded from the Internet to
  the |vs| and Proxy Nodes, according to the following table:

  .. csv-table::
     :header: "Port", "Protocol", "To Node", "Service"
     :widths: 10 10 20 80

     "20000-40000", "UDP", "|vs|", "Client connections for the audio and
     video streams"
     "5222", "TCP", "Proxy", "Message Dispatcher"
     "443", "TCP", "Proxy", "WebSocket protocol"

  The WebSocket protocol requires to be explicitly allowed. Please see
  details on Section :ref:`inst-websocket`.

.. _wsc-install:

Installation
------------

The directions in the reminder of this page apply to a new
installation of |product|. If you already have an existing |product|
infrastructure, the procedure is very similar, but you have to take
into account the following points:

* The ``carbonio-videoserver`` and ``carbonio-videoserver-recorder`` packages
  may be already installed within the infrastructure, but you can keep them:
  the |wsc| does not share any component with them. However, note that they
  are marked as |dprc| and will soon be dismissed.

* There is a *Preparation* phase that requires to install some package
  on other Nodes before starting the |wsc| installation.

  #.  Install the database components on the **Database Node**: please
      follow the instructions to Section :ref:`connectors-wsc-db-install`
      remembering to bootstrap the Message Dispatcher and the |wsc| databases

  #. Install package :file:`carbonio-ws-collaboration-ui` on the
     :ref:`component-proxy-install` Node

  #. Install package :file:`carbonio-message-broker` on the
     :ref:`component-mesh-install` Node

  #. Install the :ref:`component-vs-wsc-install` Component on a dedicated Node
     or in any Node that does not feature :ref:`component-vs-install`,
     because they are not compatible

Now, depending on how you plan to install |wsc|, the procedure
slightly changes.

If you plan to install |wsc| on a dedicated Node, make sure that you
install :ref:`component-vs-wsc-install` on another dedicated Node, then
follow the installation procedure as it described below, starting from
the next section, :ref:`component-wsc-packages`.

If you plan to install |wsc| on an existing Node, then skip Sections
:ref:`component-wsc-bootstrap` and :ref:`component-wsc-mesh`.

.. _component-wsc-packages:

Install Packages
----------------

This section presents the procedure to install and configure all the
packages and the Node on which to install them. Please remember to
read section :ref:`component-wsc-req` above before starting the actual
package installation.

First, we install PostgreSQL repository.

.. include:: /_includes/_installation/_repo/pg.rst

Then, we update the list of packages.

.. include:: /_includes/_installation/update-packages.rst

.. include:: /_includes/_installation/warningservicediscoveragent.rst

We are now ready to install all packages.

.. include:: /_includes/_installation/_packages/component-chats-cb.rst

.. _component-wsc-bootstrap:

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh & Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh & Directory
  Node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory Node (:ref:`ldap-admin-password <get-ldap-password>`)

.. _component-wsc-mesh:

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Dispatcher DB Migration
-----------------------

Initialise the message dispatcher

.. include:: /_includes/_installation/_components/dispatcher-migration.rst

Enable |wsc|
------------

|wsc| can be enabled from the |adminui| at account or COS level:
please refer to Sections :ref:`Account / Configuration <act-conf>` and
:ref:`cos-chat`, respectively.

You can enable it also from the command line by running as the
``zextras`` user the command

.. code:: console

   zextras$ carbonio prov mc default carbonioFeatureWscEnabled TRUE

This command enables the chat for the ``default`` COS, but you can
enable it on selected COSes and accounts.

Restart the service

.. code:: console

   # systemctl restart carbonio-ws-collaboration

Status Check
============

The following command will output a detailed status of |wsc| and of
all its dependencies.

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq
