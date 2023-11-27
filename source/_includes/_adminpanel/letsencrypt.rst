
.. card:: Let's Encrypt Requirements

   Before attempting to ask for a Let's Encrypt certificate, make sure
   that:

   #. **Public Service Protocol** and **Public Service Host Name** are
      correctly set in the |adminui|'s :menuselection:`Domain -->
      General Settings`

   #. There is a Virtual Host correctly configured for the domain you
      want the certificate

   #. **A**, **AAAA**, and **CNAME** records are configured in the
      domain's DNS configuration

   #. The domain has a valid |fqdn| that can be resolved from anywhere
      (i.e., the domain must be publicly accessible)

   #. The Proxy Nodes are reachable from the Internet on port **80
      (http)**. In case the proxy can not be directly reached, you
      must add some forwarding rules.

   #. You run all command in this section as the ``zextras`` user
      
   #. The ``zimbraReverseProxyMailMode`` attribute has been set to
      *redirect* at global level. You can verify if this is the case
      with command
   
      .. code:: console

         zextras$ carbonio prov gacf zimbraReverseProxyMailMode
         
      If the output is not *redirect*, you can set it with

      .. code:: console

         zextras$ carbonio prov mcf zimbraReverseProxyMailMode redirect

   #. you have unset the same attribute on the Proxy Nodes
      
      .. code:: console

         zextras$ carbonio prov ms $(zmhostname) zimbraReverseProxyMailMode ""

   #. (Optional) To receive e-mail responses from Let's Encrypt,
      |carbonio| attributes ``carbonioNotificationRecipients`` and
      ``carbonioNotificationFrom`` are defined at global level.

   .. hint:: If you have more than one Proxy Node, execute the
      commands on **each Proxy Node**.

   Once done, execute the following commands to pick up the changes on
   the Proxy Node

   .. code:: console
   
      zextras$ /opt/zextras/libexec/zmproxyconfgen
      zextras$ zmproxyctl restart

To correctly issue a Let's Encrypt certificate for your |product|
installation, you should carry out the following steps.

The starting point is to generate the certificate using the |adminui|
button, as shown in the :ref:`previous section <ap-vhost>`. besides
the message on the bottom right corner, you will receive in a few
minutes an e-mail, provided you set |carbonio| attributes, see list
above, stating the success or failure of the certificate's generation.

.. hint:: You can follow the process by checking the log file
   :file:`/var/log/carbonio/letsencrypt/letsencrypt.log` on the Proxy
   Node, using the :command:`tail -f` command from the CLI.

In case of failure, the e-mail will report the errors encountered that
you need to fix before attempting again. Take into account that if you
continuously ask for a certificate without success, you can be
temporarily be prevented to ask again.

The message *Successfully received certificate* appears in the e-mail
when the issue is successful, together with other information,
including the expiry date, followed by a second confirmatory e-mail.

At this point you can deploy the certificate on your
infrastructure. Log in to the CLI and issue, as the ``zextras user``, the
commands

.. code:: console

   zextras$ /opt/zextras/libexec/zmproxyconfgen
   zextras$ /opt/zextras/bin/zmproxyctl reload

The certificate expires after **90 days**, and, according to `Let's
Encrypt recommendations
<https://letsencrypt.org/docs/integration-guide/#when-to-renew>`_
should to be renewed **30 days** before expiration. You can do so
manually running, as the ``zextras`` user the :command:`certbot renew`
command from the CLI or, if you are confident, routinely from the
crontab.

Once done, run again the two deployment commands

.. code:: console

   zextras$ /opt/zextras/libexec/zmproxyconfgen
   zextras$ /opt/zextras/bin/zmproxyctl reload
