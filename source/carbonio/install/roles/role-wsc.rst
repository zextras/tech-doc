
.. _role-wsc-install:

|wsc|
=====

|cwsc| Role is a multi-layered software that adds the video meeting
and recording functionalities to |product|.

This Role can currently be installed only manually, so please read
Sections :ref:`role-wsc-limits` and :ref:`role-wsc-req` below.

If you plan to install this Role in an existing |product|
infrastructure, please read carefully Section :ref:`wsc-install`.

.. _role-wsc-limits:

Limitations
-----------

In the current release |release|, the following limitation apply to
the installation of the |wsc| Role

* It must be installed manually, there is no Ansible support for the
  installation
* It can not be installed on the same Node as |vs|
* Data from the legacy Chats module can not be exported to new |wsc|
  Role

.. _role-wsc-req:

Requirements
------------

The |wsc| Role is quite complex in terms of both internal architecture
and installation, therefore it requires to pay some attention while
installing it:

* All commands and all file editing activities must be executed as the
  ``root`` user, unless noted differently

* The ``carbonio-user-management`` package must be installed in the
  |product| infrastructure (it is part on the
  :ref:`role-proxy-install` Role)

* |cwsc| requires that some ports be forwarded from the Internet to
  the |vs| and Proxy Nodes, according to the following table:

  .. csv-table::
     :header: "Port", "Protocol", "To Node", "Service"
     :widths: 10 10 20 80

     "20000-40000", "UDP", "|vs|", "Client connections for the audio and
     video streams"
     "5222", "TCP", "Proxy", "Message Dispatcher"

.. _wsc-install:

Installation
------------

The directions in the reminder of this page apply to a new
installation of |product|. If you already have an existing |product|
infrastructure, the procedure is very similar, but you have to take
into account the following points:

* The |vs| or Chats modules may be already installed within the
  infrastructure, but you can keep them: the |wsc| does not share any
  component with them

* There is a *Preparation* phase that requires to install some package
  on other Nodes before starting the |wsc| installation.

  #.  Install the database components on the **Database Node**: please
      follow the instructions to Section :ref:`role-wsc-db-install`
      remembering to bootstrap the Message Dispatcher and the |wsc| databases

  #. Install package :file:`carbonio-ws-collaboration-ui` on the
     :ref:`role-proxy-install` Node

  #. Install package :file:`carbonio-message-broker` on the
     :ref:`role-mesh-install` Node

  #. Install the :ref:`role-vs-wsc-install` Role on a dedicated Node
     or in any Node that does not feature :ref:`role-vs-install`,
     because they are not compatible

Now, depending on how you plan to install |wsc|, the procedure
slightly changes.

If you plan to install |wsc| on a dedicated Node, make sure that you
install :ref:`role-vs-wsc-install` on another dedicated Node, then
follow the installation procedure as it described below, starting from
the next section, :ref:`role-wsc-packages`.

If you plan to install |wsc| on an existing Node, then skip Sections
:ref:`role-wsc-bootstrap` and :ref:`role-wsc-mesh`.

.. _role-wsc-packages:

Install Packages
----------------

This section presents the procedure to install and configure all the
packages and the Node on which to install them. Please remember to
read section :ref:`role-wsc-req` above before starting the actual
package installation.

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-wsc-cb.rst

.. _role-wsc-bootstrap:

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  Node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory Node (:ref:`ldap-admin-password <get-ldap-password>`)

.. _role-wsc-mesh:

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst

Dispatcher DB Migration
-----------------------

Initialise the message dispatcher

.. include:: /_includes/_installation/_roles/dispatcher-migration.rst

Enable |wsc|
------------

|wsc| can be enabled from the |adminui| at account or COS level:
please refer to Sections :ref:`Account / Configuration <act-conf>` and
:ref:`cos-features`, respectively.

.. hint:: If the |wsc| installation is successful, you can optimise
   some values according to the guidelines that you can find in
   section :ref:`wsc-optimise`.

Status Check
============

The following command will output a detailed status of |wsc| and of
all its dependencies.

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq
