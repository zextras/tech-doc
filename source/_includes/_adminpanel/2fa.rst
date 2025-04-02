.. rubric:: 2FA limitations

These are the main limitations for adding 2FA to the login procedure.

* 2FA applies only to those protocols or apps supporting it, for
  example **HTTP** and **HTTPS** but not to **IMAP**, **POP** and
  **SMTP**

* The |adminui| does not support second authentication factor and will
  stop working once 2FA is activated, except for Trusted Network
  scenario (described later) or Service Credentials (see section
  :ref:`auth-credential`

* Selecting **Trust the Device** implies that users must use the same
  browser or app, otherwise they will be required to log in again: if
  a 2FA login is carried out on Chrome, accessing the same page with
  Firefox will fail. More on this in the :ref:`dedicated box
  <trust-ip-dev>` below.


There are 3 main application scenarios for 2FA:

.. card:: 2FA is disabled (default)

   In the default scenario, the second authentication factor is not
   required. This implies that users can access |product| with their
   own **username** and **password**, from any IP, via all supported
   protocols.

.. card:: 2FA is enabled

   This implies that to access |product|, users must provide their own
   **username**, **password**, and the **second factor (OTP)** from
   any IP, via all supported protocols. Trying to access with an
   unsupported protocol results in an automatic failure.

   To deploy this scenario, configure the options as follows:

   #. In the `What to trust?` field, select either **Trust the IP** or
      **Trust the Device**

   #. Leave the **Trusted Networks (IP ranges)** field empty

   #. Click **APPLY TO ALL SERVICES**, then save.

.. card:: 2FA is enabled except for Trusted Networks

   In this case, user must provide different credentials. If they
   connect from outside the trusted networks, they need **username**,
   **password**, and the **second factor (OTP)**. If they are
   initiating the connection from a :term:`trusted network`, it
   depends on which alternative you choose to configure the options:

   .. rubric:: Trusted Networks for all protocols

   #. In the `What to trust?` field, select either **Trust the IP** or
      **Trust the Device**

   #. Enter the subnet to trust in the **Trusted Networks (IP
      ranges)** field, for example ``172.24.0.0/24``. You can add
      multiple, comma-separated subnets.

      .. hint:: Single IP addresses can be trusted using the ``/32``
         suffix, e.g., ``192.168.1.1/32``.

   #. Click **APPLY TO ALL SERVICES**, then save.

   To login, users within the trusted subnet do not require 2FA.

   .. rubric:: Trusted Networks for a specific protocol

   #. In the `What to trust?` field, select either **Trust the IP** or
      **Trust the Device**

   #. Enter the subnet to trust in the **Trusted Networks (IP
      ranges)** field, for example ``172.24.0.0/24``. You can add
      multiple, comma-separated subnets.

      .. hint:: Single IP addresses can be trusted using the ``/32``
         suffix, e.g., ``192.168.1.1/32``.

   #. For each protocol or a specific one, select whether to trust an
      IP or device, then enter an IP range.

.. _trust-ip-dev:

.. card:: *Trust IP* and *Trust Device* options

   There are slight differences between the two options.

   With the **Trust the IP** option active, once a user authenticates
   using the second factor, the current user IP is temporary added to
   the user’s trusted networks, from any of the supported
   protocol. Hence, they do not have to enter the second factor for
   other authentications: for example, we want to give users the
   possibility to trust their home address at the first login.

   What happens at login
     At the first attempt, users must log in with their username,
     password, and OTP. They can check "Trust this device and IP
     address" to mark their own network address as trusted. All future
     requests coming from that IP will be considered valid and will
     not need the second authentication factor. Once the grant period
     is over, it will be necessary to log in again (to webmail or from
     a mobile app) by entering the second factor.

   Services/Protocols
     All services used by the IP will be considered trusted, including
     services that do not support 2FA, for the duration of the trust
     period.

   .. rubric:: Important note on Trusted IP

   With the **Trust the IP** policy, even services and protocols that
   don’t support 2FA could become accessible outside the trusted
   network.

   For example, an admin that wants to allow SMTP and IMAP from the
   user’s home IP can configure that domain to allow the user to

   * authenticate to the WebMail using the OTP

   * add the home IP to the trust IPs

   * use the SMTP or the IMAP from a trusted connection

   * once the trust expires, the user must re-authenticate with the
     WebClient


   With the **Trust the Device** option, once the user authenticates
   using 2FA from any of the supported protocols, the current device
   (browser or mobile device) is temporarily added to the user's
   trusted devices. This allows the user to skip the second
   authentication factor for subsequent logins from the same device
   until the trust period expires (e.g., enabling users to trust their
   browser session or mobile phone after the first login).

   What happens at login
     At the first attempt, users must log in with their username,
     password, and OTP. They can check "Trust this device and IP
     address" to mark their own :term:`trusted device`. All requests
     coming from that browser session or mobile device will be
     considered trusted and will not need the second authentication
     factor. Once the grant period is over, it will be necessary to
     log in again (to webmail or from a mobile app) by entering the
     second factor.
