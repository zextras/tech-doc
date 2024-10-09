
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

* |cwsc| requires that some ports, which are listed in
  :ref:`fw-ports`, be forwarded on this and on the Proxy Nodes

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

   #. Install package :file:`carbonio-ws-collaboration-ui` on the
      :ref:`role-proxy-install` Node

   #. Install package :file:`carbonio-broker` on the
      :ref:`role-mesh-install` Node

   #. Install the :ref:`role-vs-wsc-install` Role on a dedicated Node or
      in any Node that does not feature :ref:`role-vs-install`, because
      they are not compatible

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

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
     carbonio_adm 127.78.0.10 20000

Restart the service

.. code:: console

   # systemctl restart carbonio-message-dispatcher

Configuration
-------------

If you want to enable mobile notification, you need to configure
mobile notifications and Push Notifications according
to the directions given below.

.. card:: Configure mobile notifications

   The following lines must be added to file
   :file:`/etc/carbonio/message-dispatcher/mongooseim.toml` to properly
   allow notication push::

     [outgoing_pools.http.http_pool.connection]
       host = "http://127.78.0.10:20001"
       request_timeout = 5000

     [modules.mod_event_pusher.http]
       [[modules.mod_event_pusher.http.handlers]]
         pool_name = "http_pool"
         path = "/notifications"

   Then, restart the service.

   .. code:: console

      # systemctl restart carbonio-message-dispatcher

.. card:: Configure Push Notifications

   This service requires two files that will be provided by the |zx|
   Sales representative. They must be saved on the |wsc| Node as
   follows:

   * file `service-account-file.json` must be saved under directory
     :file:`/etc/carbonio/notification-push/android`

   * file `wscassets/auth-key.p8` must be saved under directory
     :file:`/etc/carbonio/notification-push/ios`

   Next, configure them using the following commands

   .. code:: console

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/team-id" "X95YE8AZMB"

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/key-id" "DN8BH5LMKG"

      # consul kv put -token-file="/etc/carbonio/notification-push/service-discover/token" \
      "carbonio-notification-push/apns/topic" "com.zextras.chats"

Enable |wsc|
------------

You need to allow each user to use |wsc|,  either from the |adminui|
or running from the CLI the following command as the ``zextras`` user,
replacing the e-mail address with the one of the user.

.. code:: console

   zextras$ carbonio prov ma john@example.com default carbonioFeatureChatsEnabled TRUE

To let |product| pick up the change, restartg the service

.. code:: console

   # systemctl restart carbonio-ws-collaboration

.. hint:: If the |wsc| installation is successful, you can optimise
   some values according to the guidelines that you can find in
   section :ref:`wsc-optimise`.

Status Check
============

The following command will output a detailed status of |wsc| and of
all its dependencies.

.. code:: console

   # curl -v http://127.78.0.4:10000/health | jq
