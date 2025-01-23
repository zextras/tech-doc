.. _carbonio-api:

=====
 API
=====

This section is dedicated to developers who want to interact with
|product| using the available APIs.

.. grid:: 1 2 2 3
   :gutter: 3

   .. grid-item-card:: |product| Account, Admin, and Mail API
      :columns: 12 12 12 12
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center
      :link: ../../../apidoc/api-reference/index.html

      This set of API is used to interact via SOAP with the main
      functions of |product|

   .. grid-item-card:: |product| Authentication
      :columns: 12 12 12 12
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center

      .. grid:: 1 1 1 1
         :gutter: 2

         .. grid-item-card:: |product| Login page
            :columns: 6 6 6 6
            :class-title: sd-font-weight-bold sd-fs-4
            :link: ../../../apidoc/carbonio-auth/login-page-api.html

            Interact with |product| login process and customise the
            appearance of the login page

         .. grid-item-card:: SAML configuration
            :columns: 6 6 6 6
            :class-title: sd-font-weight-bold sd-fs-4
            :link: ../../../apidoc/carbonio-auth/saml-auth-config-api.html

            Modify the SAML configuration

   .. grid-item-card:: |file|
      :columns: 12 12 12 12
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center

      .. grid:: 1 1 1 1
         :gutter: 2

         .. grid-item-card:: |file| blob
            :columns: 6 6 6 6
            :class-title: sd-font-weight-bold sd-fs-4
            :link: ../../../apidoc/files_blob/index.html

            Manage the upload and download of BLOB files and links
            to them

         .. grid-item-card:: |file| metadata
            :columns: 6 6 6 6
            :class-title: sd-font-weight-bold sd-fs-4
            :link: ../../../apidoc/files_meta/index.html

            Access metadata of |file|\'s items

      An how-to for the |file| API is available in section
      :ref:`api-files-howto`

   .. grid-item-card:: |wsc|
      :columns: 12 12 12 12
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center

      .. grid:: 1 1 1 1
         :gutter: 2

         .. grid-item-card:: Chats
            :columns: 6 6 6 6
            :class-title: sd-font-weight-bold sd-fs-4
            :link: ../../../apidoc/carbonio-ws-collaboration/chats-api.html

            Interact with the Chats API

         .. grid-item-card:: Meeting
            :columns: 6 6 6 6
            :class-title: sd-font-weight-bold sd-fs-4
            :link: ../../../apidoc/carbonio-ws-collaboration/meeting-api.html

            Create and modify meetings and  related features

   .. grid-item-card:: Storages
      :columns: 12 12 6 6
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center
      :link: ../../../apidoc/carbonio-backup/backup-api.html

      Manage the upload, download, and deletion operations of items in |file|

   .. grid-item-card:: Backup
      :columns: 12 12 6 6
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center
      :link: ../../../apidoc/carbonio-backup/backup-api.html

      Undelete blobs from |backup|

   .. grid-item-card:: Third-party API
      :columns: 12 12 12 12
      :class-title: sd-font-weight-bold sd-fs-4 sd-text-center

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

.. toctree::
   :maxdepth: 1
   :hidden:

   files-howto.rst
