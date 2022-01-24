===========================
 Deploy an SSL certificate
===========================

In this section we explain how to add an SSL/TLS certificate to a
|product| installation, both a :ref:`single server
<single-cert-installation>` and a :ref:`wildcard certificate
<wildcard-cert-installation>`.

This setup is mandatory if |product| is used in conjunction with
mobile apps; it is also suggested for any installation in order to
avoid the client browser's warning about an invalid certificate upon
connection.

.. _single-cert-installation:

Commercial Certificate Installation
===================================

We will describe the procedure by taking into account the following
scenario:

* The server FQDN is `mail.example.com`

* No SSL certificate is available for the domain.

In the remainder, replace `mail.example.com` with your actual server FQDN.

The procedure consists of a few steps and requires console access to
the |product| server.

.. rubric:: Step 1. Certificate Signing Request generation

We start by generating a :abbr:`Certificate Signing Request (CSR)`:

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

  /opt/zextras/ssl/carbonio/commercial/commercial.key
  /opt/zextras/ssl/carbonio/commercial/commercial.csr

.. rubric:: Step 2. Get the certificates from your SSL provider

To complete this step successfully, you need to submit the CSR to the
SSL provider and get a commercial certificate in **PEM format** and
save it as
:file:`/opt/zextras/ssl/carbonio/commercial/commercial.crt`.

Now, download and save the **root** and the **intermediate** CA from
your provider to temporary files, for example :file:`/tmp/ca_root.crt`
and :file:`/tmp/ca_intermediary.crt`, then merge the two previously
created temporary files into a single one:

.. code:: console

   # cat /tmp/ca_intermediary.crt /tmp/ca_root.crt > \
   /opt/zextras/ssl/carbonio/commercial/commercial_ca.crt

.. note:: Most SSL providers provide both the intermediate certificate
   and the so-called `Root CA`. In some cases, however, they may only
   provide the intermediate certificate, in which case the `Root CA`
   certificate must be explicitly requested.

.. rubric:: Step 3. Verification and deploy

Issue the following commands to verify that the certificate and your
private key match:

* become the ``zextras`` user

  .. code:: console

     # su - zextras

* go to the directory where the certificates are stored:

  .. code:: console

     # cd /opt/zextras/ssl/carbonio/commercial

* verify the certificates

  .. code:: console

     # zmcertmgr verifycrt comm commercial.key commercial.crt commercial_ca.crt


If the verification is successful, you can deploy the SSL certificate.

.. code:: console

   zmcertmgr deploycrt comm commercial.crt commercial_ca.crt

Finally, restart |product|.

.. code:: console

   zmcontrol restart

Your certificate should now be installed: verify the certificate
details by running this command:

.. code:: console

   zmcertmgr viewdeployedcrt

.. _wildcard-cert-installation:

Wildcard Certificate Installation
=================================

**Scenario:**

The server FQDN is `mail.example.com`

There is already a wildcard SSL certificate (`*.example.com`) generated on a server other than Carbonio.

**Verification and deploy**

Save the private key in:  ``/opt/zextras/ssl/carbonio/commercial/commercial.key``

Save the commercial certificate in: ``/opt/zextras/ssl/carbonio/commercial/commercial.crt``

Merge the intermediate and the root CA certificate in: ``/opt/zextras/ssl/carbonio/commercial/commercial_ca.crt``

* Verify that your certificate and your private key match:

.. code:: console

  su - zextras
  cd /opt/zextras/ssl/carbonio/commercial
  zmcertmgr verifycrt comm commercial.key commercial.crt commercial_ca.crt

* If the verification is successful, you can deploy your SSL certificate

.. code:: console

  zmcertmgr deploycrt comm commercial.crt commercial_ca.crt

* Restart Carbonio

.. code:: console

  zmcontrol restart

Your certificate should now be installed.
You can verify the certificate details by running this command:

.. code:: console

  zmcertmgr viewdeployedcrt
