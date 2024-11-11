.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-api:

API for |product|
=================

|zx| makes available to developers a couple of APIs to interact with
the current version (|release|) of |product| components and allow for
a programmatic access. To read their documentation, follow the
corresponding URLS:

* `Carbonio <../../../apidoc/api-reference/index.html>`_ is used
  to interact via SOAP with the main functions of |product|

* Carbonio Authentication APIs are divided into `login page API
  <../../../apidoc/carbonio-auth/login-page-api.html>`_ and `SAML
  configuration API
  <../../../apidoc/carbonio-auth/saml-auth-config-api.html>`_ and can
  be used to change the appearance of the login page and SAML access
  configuration

* `Carbonio Backup <../../../apidoc/carbonio-backup/backup-api.html>`_
  allow to undelete blobs.

* `Carbonio Files blob <../../../apidoc/files_blob/index.html>`_, for
  managing the uploading, downloading of BLOB files and links to them

  .. hint:: An How-to for the |file| API is available :ref:`api-files-howto`.

* `Carbonio Files metadata <../../../apidoc/files_meta/index.html>`_,
  to access metadata of |file|\'s items

* `Carbonio Notification push API
  <../../../apidoc/carbonio-notification-push/api.html>`_ are used to
  interact with notifications sent by |product|

* `Carbonio Storages <../../../apidoc/carbonio-storages/storages-api.html>`_ permit
  to upload, download, and delete items from |storage|

* Carbonio WSC API allow to access the `Chats API
  <../../../apidoc/carbonio-ws-collaboration/chats-api.html>`_ and the
  `Meeting API
  <../../../apidoc/carbonio-ws-collaboration/meeting-api.html>`_, used
  for the Chat and WSC meetings

Third-party API
---------------

Most of the software integrated in |product| exposes its own API to
allow for programmatic access to their functionalities. This is the
case of **clamd**, the protocol used by ClamAV. However, clamd defines
also potentially dangerous commands like ``shutdown``, that should
never be exposed. The solution is therefore to use a different
approach, for example using a docker image that acts as a proxy
towards clamd's interface, like for example
https://hub.docker.com/r/benzino77/clamav-rest-api (see also the
related `documentation
<https://github.com/benzino77/clamav-rest-api>`_). This approach has
however not yet been thoroughly tested.
