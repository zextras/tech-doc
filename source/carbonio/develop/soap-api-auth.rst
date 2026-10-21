.. _soap-api-auth:

=============================
 SOAP API - Authentication
=============================

.. include:: /_includes/_devel/obtain_a_token.rst

The server response contains an authToken, which must be used in all subsequent SOAP requests.

Example:

.. code:: console

    {"Header":{"context":{"change":{"token":5675},"_jsns":"urn:zimbra"}},"Body":{"AuthResponse":{"authToken":[{"_content":"0_84391e0a087f869d4d8f738686f180f63141aebf_69643d33363a32623030313437392d353832312d346433302d623861322d3030336433633235643536643b6578703d31333a313735393037383736373235313b76763d313a303b747970653d363a7a696d6272613b753d313a613b7469643d31303a313832323632383039383b76657273696f6e3d383a636172626f6e696f3b"}],"lifetime":172799999,"_jsns":"urn:zimbraAccount"}},"_jsns":"urn:zimbraSoap"}

SOAP API Endpoints by Namespace
-------------------------------

Carbonio uses different SOAP endpoints depending on the API being called.
The namespace specified in the request identifies the API, while the endpoint determines the URL to which the request must be sent.

.. list-table::
   :header-rows: 1
   :widths: 30 40 50

   * - Namespace
     - Endpoint
     - Purpose
   * - ``urn:zimbraAccount``
     - ``https://<server>/service/soap/``
     - Account operations, including authentication with ``AuthRequest``.
   * - ``urn:zimbraMail``
     - ``https://<server>/service/soap/``
     - Mail operations, including retrieving folders with ``GetFolderRequest``.
   * - ``urn:zimbraAdmin``
     - ``https://<server>/service/admin/soap``
     - Administrative operations.

Replace ``<server>`` with the hostname or IP address of your Carbonio server.

.. note::

   The namespace is specified in the SOAP request body using the ``_jsns`` attribute.
   For example, an ``AuthRequest`` uses ``urn:zimbraAccount``, while a ``GetFolderRequest`` uses ``urn:zimbraMail``.
   Both requests use the standard ``/service/soap/`` endpoint.
   Administrative requests use ``/service/admin/soap``.


Using the auth token
--------------------

Once you have the token, include it in the header:

.. code:: console

    curl -k -X POST https://srv_carbonio.loc/service/soap \
  -H "Content-Type: application/json" \
  -d '{
    "Header": { 
      "context": { 
        "_jsns": "urn:zimbra", 
        "authToken": "0_c3f0e49a15391cb18285505ddc2adcf2d0c3f388_69643d33363a32623030313437392d353832312d346433302d623861322d3030336433633235643536643b6578703d31333a313735393038303630313433363b76763d313a303b747970653d363a7a696d6272613b753d313a613b7469643d393a3135303032393538373b76657273696f6e3d383a636172626f6e696f3b"
      }
    },
    "Body": {
      "GetFolderRequest": {
        "_jsns": "urn:zimbraMail",
        "folder": { "id": "1" }
      }
    },
    "_jsns": "urn:zimbraSoap"
  }'

.. note::

   - ``curl`` → command-line tool used to send HTTP requests.
   - ``-k`` → ignores SSL certificate validation (useful with self-signed certificates in test environments).
   - ``-X POST`` → specifies the HTTP method (POST is used to send data).
   - ``folder.id = 1`` always refers to the Inbox.
   - The authentication token must be included in ``Header.context.authToken`` for the request to succeed.
   - Ensure that the JSON body is valid.
   - The request returns a JSON response containing the Inbox details, including subfolders and metadata.

What it does
------------

When executed, this command:

- Connects to the Carbonio server (`srv_carbonio.loc`).
- Sends a SOAP request to retrieve information about the folder with ``id = 1`` (typically the Inbox) for the authenticated user.
- Uses the ``authToken`` in the request header for authentication instead of a username and password.
- Returns a JSON object containing the folder details, including messages, metadata, and other folder attributes.
