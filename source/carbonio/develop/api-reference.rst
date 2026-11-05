.. _api-reference:

=============================
 API Reference
=============================

The API reference is organised by API technology (SOAP, REST, and GraphQL) and provides detailed technical information, including request parameters, authentication requirements, and response formats.

Select an API below to access its reference documentation.

.. _soap-api:

SOAP API
~~~~~~~~

SOAP APIs provide access to user-level and administrative operations.

The following table lists the available SOAP API categories:

.. list-table::
   :header-rows: 1
   :widths: 20 20 60

   * - API
     - Access level
     - Description
   * - `Account API <../../../apidoc/api-reference/zimbraAccount/service-frame.html>`_
     - User
     - Operations related to user accounts.
   * - `Mailbox API <../../../apidoc/api-reference/zimbraMail/service-frame.html>`_
     - User
     - Operations related to user mailboxes.
   * - `Admin API <../../../apidoc/api-reference/zimbraAdmin/service-frame.html>`_
     - Administrator
     - Operations for managing accounts, domains, and server configuration.

.. _rest-api:

REST API
~~~~~~~~

REST APIs expose HTTP endpoints for interacting with specific Carbonio services.

The following table lists the available REST API categories:

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - API
     - Description
   * - `Login API <../../../apidoc/carbonio-auth/login-page-api.html>`_
     - Endpoints for login and authentication operations.
   * - `SAML Configuration API <../../../apidoc/carbonio-auth/saml-auth-config-api.html>`_
     - Endpoints for configuring SAML authentication.
   * - `Backup API <../../../apidoc/carbonio-backup/backup-api.html>`_
     - Endpoints for backup operations.
   * - `Files Blob API <../../../apidoc/files_blob/index.html>`_
     - Endpoints for accessing file blobs.
   * - `Storage API <../../../apidoc/carbonio-storages/storages-api.html>`_
     - Endpoints for interacting with storage, including file upload, download, deletion, and copy operations.
   * - `Storage Quota API <../../../apidoc/carbonio-storages/storages-quota-api.html>`_
     - Endpoints for storage quota operations.
   * - `Chats API <../../../apidoc/carbonio-ws-collaboration/chats-api.html>`_
     - Endpoints for chat-related operations.

.. _graphql-api:

GraphQL API
~~~~~~~~~~~

The GraphQL API allows clients to retrieve structured data through queries, selecting the fields they need.

The following table lists the available GraphQL API categories:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - API
     - Description
   * - `Files Metadata API <../../../apidoc/files_meta/index.html>`_
     - GraphQL operations for retrieving files metadata.