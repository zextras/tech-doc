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