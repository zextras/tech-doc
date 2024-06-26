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

Select the virtual host, then click :blue:`VERIFY CERTIFICATE`. In the
dialog, you can choose to use:

* A Let's Encrypt *longChain* Certificate, i.e., including an
  intermediate certificate. Make sure to :ref:`satisfy the
  requirements <le-procedure>` before clicking the
  :bdg-primary:`GENERATE CERTIFICATE` button. Complete the procedure
  according to the directions :ref:`below <le-procedure>`.

* A Let's Encrypt *shortChain* Certificate, without intermediate
  certificate: like the previous case, make sure to :ref:`satisfy the
  requirements <le-procedure>` before clicking the
  :bdg-primary:`GENERATE CERTIFICATE` button. Complete the procedure
  according to the directions :ref:`below <le-procedure>`.

  .. card:: Let's Encrypt's Short and Long Chain certificates.

     Without going into much details, the difference between the two
     types of certificates issued by Let's Encrypt (*"ISRG Root X1"*)
     is the compatibility with older Android clients and SSL
     libraries.

     More technically, the difference is that the Short Chain contains
     two certificates: Let's Encrypt's Root certificate and the one
     issued to your website, signed by the former; while the Long
     Chain three: the same of the Short Chain and an intermediate
     certificate. The *ISRG Root X1* indeed, was issued quite recently
     and may not be known to some browsers, devices, or clients,
     therefore it was decided to add as intermediate certificate
     another root certificate that is well known to clients, to expand
     compatibility.

     .. seealso:: More details and technicalities about the Short
        vs. Long Chain certificates can be found in article `Long
        (default) and Short (alternate) Certificate Chains Explained
        <https://community.letsencrypt.org/t/long-default-and-short-alternate-certificate-chains-explained/>`_.

* A custom certificate. In this case, you need to provide by yourself
  the three files of the authorisation chain (i.e., the *Domain
  Certificate*, the *Certificate CA Chain*, and the *Private Key*) in
  the first or copy the content of the individual files in the
  appropriate fields. Click :bdg-primary:`VERIFY` to verify the
  certificates: if everything is correct, notification
  :bdg-success:`The certificate is valid` will appear. To use the
  certificate, click the :bdg-primary-line:`I WANT TO USE THIS
  CERTIFICATE` button to upload and use the certificate. Again, a
  notification will be shown (:bdg-success:`The certificates have been
  saved`). To complete the procedure: if you are on a Single-Node,
  restart it otherwise you need to restart the node on which the
  **Proxy** is installed.

You can :red:`REMOVE` or :blue:`DOWNLOAD` the certificates
by clicking the appropriate button above the certificates themselves.
