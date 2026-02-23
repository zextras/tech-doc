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
