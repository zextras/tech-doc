.. _carbonio-api:

===================
 API Documentation
===================

|product| provides a set of APIs that allow developers to integrate external applications, automate operations, and interact with |product| services.

Three API technologies are available: SOAP, REST, and GraphQL. Each provides access to different functionalities and follows its own request and authentication mechanisms.

Use this page to explore the available APIs, identify the interfaces relevant to your integration, and access their technical references.

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

SOAP API
--------

The SOAP API provides access to a wide range of Carbonio operations, including mailbox management, account operations, and administrative tasks.

Explore:
~~~~~~~~

- User APIs
- Mailbox APIs
- Administration APIs

:ref:`Explore SOAP APIs <soap-api>` | :doc:`Authentication guide <soap-api-auth>`

REST API
--------

The REST API exposes HTTP endpoints for interacting with specific Carbonio services. It is suitable for application integrations and service-level automation.

Explore:
~~~~~~~~

- Login and authentication
- SAML configuration
- Backup
- Storage and quotas
- Chats
- File access

:ref:`Explore REST APIs <rest-api>` | :doc:`Authentication guide <rest-api-auth>`

GraphQL API
-----------

The GraphQL API allows clients to retrieve structured data through queries, selecting the fields they need.

Explore:
~~~~~~~~

Files metadata

:ref:`Explore GraphQL APIs <graphql-api>` | :doc:`Authentication guide <graphql-api-auth>`

----

Authentication
--------------

Access to Carbonio APIs requires authentication.
Depending on the API technology, clients use different authentication mechanisms to obtain and provide an authentication token.

The authentication process generally follows these steps:

1. Clients authenticate using the SOAP ``AuthRequest`` or the REST Login API.
2. Successful authentication returns a valid ``authToken``.
3. This token must be included in all subsequent requests:

   - **REST:** via the ``ZM_AUTH_TOKEN`` cookie
   - **SOAP:** inside the request header ``context.authToken`` for ``/service/soap``
   - **GraphQL:** via the ``ZM_AUTH_TOKEN`` cookie or the ``Authorization`` header

For detailed instructions and examples, refer to the authentication guide for each API technology:

.. toctree::
   :maxdepth: 1

   soap-api-auth.rst
   rest-api-auth.rst
   graphql-api-auth.rst

----

API Reference
--------------

Find detailed technical documentation for Carbonio APIs, including available operations, endpoints, request parameters, and response formats.

.. toctree::
   :maxdepth: 1

   API Reference <api-reference>




