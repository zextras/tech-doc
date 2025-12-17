.. _rest-api-auth:

=============================
 REST API - Authentication
=============================

.. include:: /_includes/_devel/obtain_a_token.rst

The server response contains an authToken, which must be used in all subsequent REST requests.

Example:

.. code:: console

    {"Header":{"context":{"change":{"token":5675},"_jsns":"urn:zimbra"}},"Body":{"AuthResponse":{"authToken":[{"_content":"0_84391e0a087f869d4d8f738686f180f63141aebf_69643d33363a32623030313437392d353832312d346433302d623861322d3030336433633235643536643b6578703d31333a313735393037383736373235313b76763d313a303b747970653d363a7a696d6272613b753d313a613b7469643d31303a313832323632383039383b76657273696f6e3d383a636172626f6e696f3b"}],"lifetime":172799999,"_jsns":"urn:zimbraAccount"}},"_jsns":"urn:zimbraSoap"}

Using the auth token
--------------------

Example:

.. code:: console

     curl -k -X GET "https://srv_carbonio.loc/service/home/user@example.com/inbox?fmt=json" \
  --cookie "ZM_AUTH_TOKEN=0_2dc8d8078893890e1233178d5803b44c7ddb76d9_69643d33363a32623030313437392d353832312d346433302d623861322d3030336433633235643536643b6578703d31333a313735393038373939373439323b76763d313a303b747970653d363a7a696d6272613b753d313a613b7469643d31303a313830333934363332363b76657273696f6e3d383a636172626f6e696f3b637372663d313a313b"

.. note::

   - ``curl`` → command-line tool used to send HTTP requests.
   - ``-k`` → ignores SSL certificate validation (useful with self-signed certificates in test environments).
   - ``-X GET`` → specifies the HTTP method (GET is used to retrieve data).
   - ``https://srv_carbonio.loc/service/home/user@example.com/inbox?fmt=json``  
     - ``/service/home/`` → REST endpoint for mailbox data.  
     - ``user@example.com`` → account whose mailbox is being accessed.  
     - ``/inbox`` → specific folder requested (Inbox).  
     - ``?fmt=json`` → response format (JSON in this case, instead of XML, RSS, ICS, etc.).
   - ``--cookie "ZM_AUTH_TOKEN=<authToken>"`` → passes the authentication token obtained from a previous SOAP AuthRequest; the server checks this cookie to authorize the request.
   - The command fetches the content of a user’s mailbox folder (Inbox) in JSON format, authenticated with a valid session token.

What it does
------------

When executed, this command:

- Connects to the Carbonio server (``srv_carbonio.loc``).
- Requests the contents of the Inbox folder for ``user@example.com``.
- Authenticates using the ``ZM_AUTH_TOKEN`` cookie instead of a username and password.
- Returns a JSON object containing the inbox items, including messages, metadata, and other folder attributes.

Essentially, this is the REST equivalent of "list my inbox messages" in Carbonio, using token-based authentication.

Other examples of an authenticated REST request:
------------------------------------------------

List Inbox messages

.. code:: console

    curl -k -X GET "https://srv_carbonio.loc/service/home/user@example.com/inbox?fmt=json" \
    --cookie "ZM_AUTH_TOKEN=<your_authToken>"

Returns ID 260 message as plain text

.. code:: console

    curl -k -X GET "https://srv_carbonio.loc/service/home/user@example.com/?id=260&fmt=txt" \
    --cookie "ZM_AUTH_TOKEN=<your_authToken>"

Get calendar in ICS format

.. code:: console

    curl -k "https://srv_carbonio.loc/service/home/user@example.com/?fmt=ics" \
    --cookie "ZM_AUTH_TOKEN=TOKEN"
