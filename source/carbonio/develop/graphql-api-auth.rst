.. _graphql-api-auth:

=============================
 GraphQL API - Authentication
=============================

.. include:: /_includes/_devel/obtain_a_token.rst

The server response contains an authToken, which must be used in all subsequent GraphQL requests.

Example:

.. code:: console

    {"Header":{"context":{"change":{"token":5675},"_jsns":"urn:zimbra"}},"Body":{"AuthResponse":{"authToken":[{"_content":"0_84391e0a087f869d4d8f738686f180f63141aebf_69643d33363a32623030313437392d353832312d346433302d623861322d3030336433633235643536643b6578703d31333a313735393037383736373235313b76763d313a303b747970653d363a7a696d6272613b753d313a613b7469643d31303a313832323632383039383b76657273696f6e3d383a636172626f6e696f3b"}],"lifetime":172799999,"_jsns":"urn:zimbraAccount"}},"_jsns":"urn:zimbraSoap"}

Using the auth token
--------------------

Include it in GraphQL requests using the ZM_AUTH_TOKEN cookie or the Authorization header.

Example: Retrieve Files Metadata

.. code:: console

    curl -k -X POST https://srv_carbonio.loc/service/graphql \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your_authToken>" \
  -d '{"query": "{ files { id name size createdAt owner { name } } }"}'

The query lists files accessible to the authenticated user, including file name, size, creation date, and owner:

Response example:

.. code:: console

  "data":
    "files": 
        "id": "dfb3e5e2-9b0b-45a9-8a40-4e31aa33a6e2",
        "name": "project_plan.pdf",
        "size": 1048576,
        "createdAt": "2025-09-15T08:22:17Z",
        "owner":
          "name": "John Doe",
          "email": "john.doe@example.com"


Another example: Upload a File

File uploads are handled via GraphQL mutations.

.. note::

   A **Mutation** is a write operation on a folder or file. Common actions include:

   - ``createFolder``, ``flagNodes``, ``trashNodes``, ``restoreNodes``, ``moveNodes``, ``copyNodes``, and ``deleteNodes`` – self-explanatory operations for managing folders and files.
   - ``updateNode`` – used to rename a node, update its description, or modify other metadata.


Example using curl:

.. code:: console

    curl -k -X POST https://srv_carbonio.loc/service/graphql \
  -H "Authorization: Bearer <your_authToken>" \
  -F "operations={\"query\":\"mutation ($file: Upload!) { uploadFile(file: $file) { id name size } }\",\"variables\":{\"file\":null}}" \
  -F "map={\"0\":[\"variables.file\"]}" \
  -F "0=@/path/to/file.pdf"

Response example:

.. code:: console

  "data": 
    "uploadFile": 
      "id": "b2f8a6e1-4c4a-4f5c-8e7e-2c1c3b38f1a1",
      "name": "file.pdf",
      "size": 105472


