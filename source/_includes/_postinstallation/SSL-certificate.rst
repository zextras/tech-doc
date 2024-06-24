.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _install-SSL-cert:

Deploy a Commercial SSL Certificate
===================================

In this section we explain how to add an SSL/TLS certificate to a
|product| installation. |product| supports the installation and
management of *Let's Encrypt* certificates: you install it from the
configure can find directions for that in |adminui|: please refer to
the :ref:`dedicated article <le-procedure>`.


This setup is mandatory if |product| is used in conjunction with
mobile apps; it is also suggested for any installation in order to
avoid the client browser's warning about an invalid certificate upon
connection.

.. seealso:: You can manage SSL **domain** certificates from the
   |adminui|: check out Section :ref:`ap-vhost`.
                  

.. _single-cert-installation:

Commercial Certificate Installation
-----------------------------------

We will describe the procedure by taking into account the following
scenario:

* The server FQDN is `mail.example.com`

* No SSL certificate is available for the domain.

In the remainder, replace `mail.example.com` with your actual server FQDN.

The procedure consists of a few steps and requires console access to
the |product| server.

.. rubric:: Step 1. Certificate Signing Request generation

If you do not have a certificate, and you have to request a new one, you
need to generate a :abbr:`CSR (Certificate Signing Request)`:

.. code:: console

   # /opt/zextras/bin/zmcertmgr createcsr comm -new -subject \
   "/C=IT/ST=VR/L=Yourtown/O=YourCompany/OU=SampleDepartment/CN=mail.example.com" \
   -subjectAltNames mail.example.com

Where the various elements in the subject are the standard fields of
an SSL certificate:

* **C**: the 2-digit country code

* **ST**: State or Province

* **L**: City

* **O**: Organization Name

* **OU**: Organization Unit (Department)

* **CN**: Common Name

.. note:: You can optionally include more than one (alternative) name
   by simply adding to the end of the command one ore more
   ``-subjectAltNames`` options, followed by the name to add.

Once the command is executed these files will be generated:

.. code:: console

  # /opt/zextras/ssl/carbonio/commercial/commercial.key
  # /opt/zextras/ssl/carbonio/commercial/commercial.csr

.. rubric:: Step 2. Get the certificates from your SSL provider

To complete this step successfully, you need to submit the CSR to the
SSL provider, get a commercial certificate in **PEM format**, and
save it as :file:`commercial.crt`.

Moreover, SSL providers supply also the **intermediate certificate**
and the so-called **Root CA** in a bundled certificate file (*"Full
Chain CA"*), that must be saved as
:file:`commercial_ca.crt`.

.. topic:: How to create a Full Chain CA

   However, in some cases, the SSL provider may only provide the
   **intermediate certificate**, in which case you need to create the
   Full CA Chain in order to install the certificate (for further
   information: https://knowledge.digicert.com/solution/SO16297.html)

   If you don't have a full CA chain bundle, download and save the root
   and the intermediate CA from your provider to temporary files, for
   example /tmp/ca_root.crt and /tmp/ca_intermediary.crt, then merge the
   two previously created temporary files into a single one:

   .. code:: console

      # cat /tmp/ca_intermediary.crt /tmp/ca_root.crt > \
      /tmp/commercial_ca.crt

.. rubric:: Step 3. Verification and deploy

.. include:: /_includes/verifycerts.rst
