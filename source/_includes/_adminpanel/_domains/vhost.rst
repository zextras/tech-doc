A **Virtual Host** is an alternative name given to a *domain* that can
be used to access the same domain. To be able to use the virtual host,
the name must be registered on the domain's DNS with an ``A`` or
``CNAME`` record.

To each virtual host you can associate an **SSL certificate**.
|product| supports the upload of multiple SSL *domain certificates*
from the |adminui| and associate them to different domains, a
procedure that requires only a few steps.

.. card:: Infrastructure, wildcard, and domain certificates

   During the |product| installation, a self-signed SSL certificate is
   created to allow basic access and configuration. However, before
   you put |product| in a production environment, you should install
   an **infrastructure certificate**.

   The server-side generation of an *infrastructure certificate* or
   even a *wildcard certificate* is a task that can be carried out
   from the CLI only: check out section :ref:`install-SSL-cert` for
   directions.

   If you do not plan to have additional domains configured on
   |product|, you're all done: no additional certificate is needed.

   If you need to configure multiple domains on the same |product|
   infrastructure, you can do it directly from the |adminui|, by
   generating a new certificate or uploading a commercial one that you
   have purchased. Let's Encrypt certificates are also supported and
   can be generated from the |adminui|, see :ref:`the procedure
   <le-procedure>`.

   If you plan to allow IMAP or POP clients to connect to |product|,
   you need to always configure them using the FQDN of the |product|
   infrastructure, for example *mail.example.com*, independent of the
   number (and names) of the domains present on the |product|
   infrastructure.

Select the virtual host, then you can choose:

* **GENERATE A LET'S ENCRYPT CERTIFICATE**: Make sure to :ref:`satisfy the
  requirements <le-procedure>` before clicking the
  :bdg-primary:`GENERATE CERTIFICATE` button. Complete the procedure
  according to the directions :ref:`below <le-procedure>`.


* **UPLOAD A CERTIFICATE**: In this case, you need to provide by yourself
  the three files of the authorisation chain (i.e., the *Domain
  Certificate*, the *Certificate CA Chain*, and the *Private
  Key*). You can either upload a certificate file  or paste the content of the file in the
  corresponding textfields.

  .. note:: If you paste the certificate, remember to add a carriage
     return (CR) at the end of the certificate (i.e., after the
     ``-----END CERTIFICATE-----`` line), like in the following
     screenshot.

     .. image:: /img/adminpanel/ap-cert.png
        :width: 50%

  Click :bdg-primary:`VERIFY` to verify the
  certificates: if everything is correct, notification
  :bdg-success:`The certificate is valid` will appear. To use the
  certificate, click the :bdg-primary-line:`I WANT TO USE THIS
  CERTIFICATE` button to upload and use the certificate. Again, a
  notification will be shown (:bdg-success:`The certificates have been
  saved`). To complete the procedure, restart the Node on which the
  **Proxy** is installed.

You can :red:`REMOVE` or :blue:`DOWNLOAD` the certificates
by clicking the appropriate button above the certificates themselves.
