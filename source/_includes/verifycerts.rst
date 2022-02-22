
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
