.. _carbonio-api:

=============
 API Overview
=============

|product| provides multiple API interfaces to integrate, extend, and automate its services.
Developers can choose between SOAP, REST, and GraphQL depending on their use case, preferred
data format, and level of control.
This page introduces all available API families and serves as the main entry point
for the entire |product| API documentation.


API Types
---------

.. list-table::
   :header-rows: 1

   * - API Type
     - Best For
     - Advantages
     - Notes
   * - **SOAP**
     - Full-featured operations, admin tasks, mailbox control
     - Very complete, stable
     - Most extensive API set
   * - **REST**
     - User-facing services, integrations, automation
     - Simple, widely supported
     - Resource-oriented
   * - **GraphQL**
     - Custom data retrieval, optimized queries
     - Fetch exactly what you need
     - Requires schema knowledge


Authentication
--------------

Access to most Carbonio services requires authentication.

1. Clients authenticate using the SOAP ``AuthRequest`` or the REST Login API.
2. Successful authentication returns a valid ``authToken``.
3. This token must be included in all subsequent requests:

   - **REST:** via the ``ZM_AUTH_TOKEN`` cookie
   - **SOAP:** inside the request header ``context.authToken`` for ``/service/soap``
   - **GraphQL:** via the ``ZM_AUTH_TOKEN`` cookie or the ``Authorization`` header

For more details on how each API type handles authentication with the authToken, see the dedicated documentation:

.. toctree::
   :maxdepth: 1

   soap-api-auth.rst
   rest-api-auth.rst
   graphql-api-auth.rst


API Reference Index
-------------------

Below is the complete list of Carbonio API categories.

.. grid:: 2 2 3 3
   :gutter: 3

   .. grid-item-card:: SOAP APIs – User Level
      :link: ../../../apidoc/api-reference/zimbraAccount/service-frame.html
      :link-type: url
      :class-title: sd-font-weight-bold

      Operations available to end users:

      - Account APIs

   .. grid-item-card:: SOAP APIs – User Level
      :link: ../../../apidoc/api-reference/zimbraMail/service-frame.html
      :link-type: url
      :class-title: sd-font-weight-bold

      Operations available to end users:

      - Mailbox APIs


   .. grid-item-card:: SOAP APIs – Admin Level
      :link: ../../../apidoc/api-reference/zimbraAdmin/service-frame.html
      :link-type: url
      :class-title: sd-font-weight-bold

      Administrative APIs for managing:

      - Accounts
      - Domains
      - Server Configuration

   .. grid-item-card:: REST APIs
      :link: ../../../apidoc/carbonio-auth/login-page-api.html
      :link-type: url
      :class-title: sd-font-weight-bold

      REST endpoints for:

      - Login & Authentication

   .. grid-item-card:: REST APIs
      :link: ../../../apidoc/carbonio-auth/saml-auth-config-api.html
      :link-type: url
      :class-title: sd-font-weight-bold

      REST endpoints for:

      - SAML Configuration

   .. grid-item-card:: REST APIs
      :link: ../../../apidoc/carbonio-backup/backup-api.html
      :link-type: url
      :class-title: sd-font-weight-bold

      REST endpoints for:

      - Backup

   .. grid-item-card:: REST APIs
      :link: ../../../apidoc/carbonio-storages/storages-api.html
      :link-type: url
      :class-title: sd-font-weight-bold

      REST endpoints for:

      - Storage

   .. grid-item-card:: REST APIs
      :link: ../../../apidoc/carbonio-ws-collaboration/chats-api.html
      :link-type: url
      :class-title: sd-font-weight-bold

      REST endpoints for:

      - Chats

   .. grid-item-card:: REST APIs
      :link: ../../../apidoc/carbonio-ws-collaboration/meeting-api.html
      :link-type: url
      :class-title: sd-font-weight-bold

      REST endpoints for:

      - Meeting

   .. grid-item-card:: GraphQL APIs
      :link: ../../../apidoc/files_meta/index.html
      :link-type: url
      :class-title: sd-font-weight-bold

      GraphQL operations for:

      - Metadata


   .. grid-item-card:: GraphQL APIs
      :link: ../../../apidoc/files_blob/index.html
      :link-type: url
      :class-title: sd-font-weight-bold

      GraphQL operations for:

      - Blob access


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

