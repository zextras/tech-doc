.. _license:

Activate license
================

Carbonio requires a valid subscription license issued by Zextras. The 
license unlocks enterprise features, enforces mailbox limits, and governs 
the pay-per-use models. 

The last task to complete before finishing 
installation is to purchase and activate the |product| license. To 
obtain the license, visit the 
`dedicated page <https://zextras.com/get-carbonio>`_ in which you can
find the information to complete the purchase process.

The license activation process includes:

- Each installation must be activated with a license token.
- During activation, the Carbonio server communicates securely with `https://api.zextras.io` over **HTTPS (TCP/443)**.
- The server sends the token and system information, and receives back a digital license file that enables the purchased features.

After receiving the license token, you can activate |product| from the
command line or the administration interface.

Prerequisites
-------------
Before you begin activating the |product|, make sure you have the following connectivity and security requirements:

- **Endpoint**: Make sure the endpoint is set to `api.zextras.io`
- **Protocol/Port**: Carbonio Advanced license activation requires outbound internet access on **TCP port 443 (HTTPS)** to the Zextras licensing API endpoint.
- **Direction**: Must have outbound HTTPs access. Indbound access is not required.

.. grid::
   :gutter: 3

   .. grid-item-card:: Activate from CLI
      :columns: 6

      To activate |product| from the CLI:

      #. Execute the following commands on the Node
         featuring the :ref:`component-prov-install` Component (if you have more
         than one, execute it on either of them):
      
         .. code:: console

            su - zextras
            carbonio core activate-license <TOKEN>
      
         .. note::

            Replace the **TOKEN** with the licence token provided by the Sales Team.

      #. Check license status by executing the below command:

         .. code:: console

            carbonio core getLicenseInfo

   .. grid-item-card:: Activate from |adminui|
      :columns: 6

      To activate |product| from the admin panel:

      #. Navigate to **Subscriptions**. 
         The **Subscriptions** page opens.
      #. Enter the License Token.
      #. Click **Confirm** to activate.


Next steps
----------

Once you complete the above steps, |product| will be activated with a valid license and ready for use.

Troubleshooting license activation
==================================

Common issues
-------------

While performing the above steps to activate the license, you may face certain issues that will hinder your chance to perform a seamless license activation. Some of the most common issues include:

- Firewall blocking outbound HTTPS
- Non-configuration or misconfiguration of the Proxy
- External names not resolved by DNS
- SSL interception breaking TLS handshake
- Proxy with Self‑Signed Certificates
- Transparent Proxy Interception

Look for the Error code
-----------------------

Any of the above issues will return a `404 error code` while executing the license activating command.

Root causes of common issues
----------------------------

Any issue during license activation can happen due to multiple causes. Below are the main reasons behind some of the common issues:

- **Firewall blocking outbound HTTPS**: The outbound HTTP requests can be blocked by the firewall if it doesn't comply with the firewall rules. An example firewall rule can be in the form of `iptables -A OUTPUT -p tcp -d api.zextras.io --dport 443 -j ACCEPT iptables -A OUTPUT -p tcp --dport 443 -j REJECT`.

- **Proxy with Self‑Signed Certificates**: If the proxy requires HTTPS and uses a self‑signed certificate, it's CA must be imported on all application servers. Failure to do that will make the license activation unsuccessful. Refer to `Trusted Self-Signed Certificates <https://docs.zextras.com/carbonio/html/admincli/advancedadmin.html#trust-self-signed-certificates>` for importing CA on application servers in this case.

- **Transparent Proxy Interception**: If a transparent proxy replaces the certificate (e.g., Fortinet), OpenSSL checks may show the proxy’s certificate instead of Zextras's one. In this case as well, the CAs must be imported on all application servers. Refer to `Trusted Self-Signed Certificates <https://docs.zextras.com/carbonio/html/admincli/advancedadmin.html#trust-self-signed-certificates>` for importing CA on application servers in this case.

Solution
--------

Troubleshooting any server issue during license activation involves the following steps:

1. DNS and Connectivity Verification
************************************

Resolving DNS and testing HTTPs connection is one of the most prominent ways to troubleshoot HTTPs or DNS issues. Execute the following command to resolve DNS:

.. code:: console

   nslookup api.zextras.io

Execute the following command to test HTTPs:

.. code:: console

   curl -v https://api.zextras.io --max-time 10
   nc -vz api.zextras.io 443

2. Checking Logs
****************

Check the logs from the following areas to identify the errors:

- /opt/zextras/log/mailbox.log
- /opt/zextras/log/freshclam.log


