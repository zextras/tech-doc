===========================
 Deploy an SSL certificate
===========================

Server-level installation of a commercial certificate
=====================================================

**Scenario:**

The server FQDN is `mail.example.com`

Still no SSL certificate

**Certificate Signing Request generation**

We start by generating a Certificate Signing Request (CSR):

.. code:: console

  /opt/zextras/bin/zmcertmgr createcsr comm -new -subject "/C=IT/ST=VR/L=Yourtown/O=YourCompany/OU=SampleDepartment/CN=mail.example.com" -subjectAltNames mail.example.com

Where:

* **C** is 2-digit country code

* **ST** indicates State/Province

* **L** is City

* **O** is Organization Name

* **OU** is Department

* **CN** is the Common Name

.. note:: You can optionally include more than one name by simply adding -subjectAltNames, followed by the name(s) you want to add, to the end of the command.

Once the command is executed these files will be generated:

.. code:: console

  /opt/zextras/ssl/carbonio/commercial/commercial.key
  /opt/zextras/ssl/carbonio/commercial/commercial.csr

**Get the certificates from your SSL provider**

Submit the CSR to the SSL provider and get a commercial certificate in PEM format.

Save it as ``/opt/zextras/ssl/carbonio/commercial/commercial.crt``

Now, download and save the root and the intermediate CA from your provider to temporary files, for example ``/tmp/ca_root.crt and /tmp/ca_intermediary.crt``

Merge the two previously created temporary files into a single one:

.. code:: console

  cat /tmp/ca_intermediary.crt /tmp/ca_root.crt > /opt/zextras/ssl/carbonio/commercial/commercial_ca.crt

.. note:: Most SSL providers provide both the intermediate certificate and the so-called "Root CA". In some cases, however, they may only provide the intermediate certificate, in which case the Root CA certificate must be explicitly requested.

**Verification and deploy**

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

Server-level installation of a “wildcard” commercial certificate
================================================================

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
