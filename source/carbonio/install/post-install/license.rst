.. _license:

Activate license
================

The last task to complete before finishing installation is to purchase
and activate the |product| license. To obtain the license, visit the
`dedicated page <https://zextras.com/get-carbonio>`_ in which you can
find the information to complete the purchase process.

After receiving the license token, you can activate |product| from the
command line or the administration interface.

.. grid::
   :gutter: 3

   .. grid-item-card:: Activate from CLI
      :columns: 6

      As the ``zextras`` user, issue the following command on the Node
      featuring the :ref:`component-prov-install` Component (if you have more
      than one, execute it on either of them), replacing **TOKEN**
      with the licence token provided by the Sales Team.

      .. code:: console

         zextras$ carbonio core activate-license TOKEN

   .. grid-item-card:: Activate from |adminui|
      :columns: 6

      Refer to section :ref:`ap-subscriptions` for directions.

.. _fundamental_internet_requirement:

Fundamental Requirement – Internet Connectivity
===============================================

**Requirement:**

To perform license activation or updates, the |product| server responsible for licensing
must have reliable outbound **internet access over TCP port 443 (HTTPS) to** ``api.zextras.io``.

**Details:**

* This access is **mandatory** for both initial license **activation** and any subsequent license **renewals**.

* Only **outbound connections** are required; **inbound access is not needed**.

* Typically, this applies to the **Mailstore & Provisioning** node, while other nodes (MTA, Proxy, etc.) do not require internet connectivity for licensing.

* Firewalls, proxies, and SSL-inspecting appliances must permit this connection and **trust the endpoint’s SSL certificate**.

