Obtaining an Auth Token
-----------------------

Authentication starts with a SOAP request to the Account API.
Here is an example curl request with inline JSON credentials:

.. code:: console

   curl -k -X POST https://srv_carbonio.loc/service/soap \
  -H "Content-Type: application/json" \
  -d '{
    "Header": { "context": { "_jsns": "urn:zimbra" } },
    "Body": {
      "AuthRequest": {
        "_jsns": "urn:zimbraAccount",
        "csrfTokenSecured": true,
        "persistAuthTokenCookie": true,
        "generateDeviceId": true,
        "account": {
          "by": "name",
          "_content": "user@example.com"
        },
        "password": "SuperSecretPassword"
      }
    },
    "_jsns": "urn:zimbraSoap"
  }'