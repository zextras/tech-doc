|product| can renew the certificates :ref:`manually <le-manual-renew>`
using the standard ``certbot`` interface or :ref:`automatically
<le-auto-renew>`.

.. warning:: You need to use the :command:`certbot` command shipped by
   |product|, not the one provided by other clients, like certbot or acme.

.. _le-manual-renew:

Manual renewal
--------------

.. hint:: Commands for the manual renewal must be issued as the
   ``zextras`` user.

The manual renewal amounts to launch command :command:`certbot renew`
on the Node installing the Proxy Role.

In case your |product| infrastructure has multiple Proxy Nodes,
first find the one which is responsible for the certificate
management, using command

.. code:: console

   zextras$ certbot certificates

If the output contains something like the following, you are on the right
Node::

  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Found the following certs:
  Certificate Name: example.com
  Serial Number: serial number
  Key Type: ECDSA
  Domains: demo.zextras.io
  Expiry Date: 2024-01-31 12:50:33+00:00 (VALID: 14 days)
  Certificate Path: certificate path /fullchain.pem
  Private Key Path: private key path /privkey.pem
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

To renew the Let's Encrypt certificate, issue command

.. code:: console

   zextras$ certbot renew

This command attempts to renew any previously-obtained certificates
that expire in less than 30 days.

.. _le-auto-renew:

Automatic renewal
-----------------

.. hint:: Commands for the automatic renewal must be issued as the
   ``root`` user.

In order to automatically renew the Let's Encrypt certificate,
|product| makes available two facilities:
``carbonio-certbot.timer``, disabled by default, and
``carbonio-certbot.service``.

.. index:: certbot; timer

To check the status of the timer, launch command

.. code:: console

   # systemctl status carbonio-certbot.timer

If the output is like the following, the timer is disabled::

  ● carbonio-certbot.timer - Run Carbonio Certbot twice daily
      Loaded: loaded (/lib/systemd/system/carbonio-certbot.timer; disabled; vendor preset: enabled)
      Active: inactive (dead)
     Trigger: n/a
    Triggers: ● carbonio-certbot.service

To enable the timer, issue command

.. code:: console

   # systemctl enable --now carbonio-certbot.timer

The command :command:`systemctl status carbonio-certbot.timer`
should now appear as **active** in its output, for example::

  Active: active (waiting) since Wed 2024-01-17 10:28:34 UTC; 3min 30s ago

If you now list all the timers, you will see when the certbot last
run and when it will run next

.. code:: console

   # systemctl list-timers --all 

You will see in the output::

  NEXT                        LEFT          LAST                        PASSED       UNIT                         ACTIVATES                     
  Wed 2024-01-17 20:37:58 UTC 3h 34min left Wed 2024-01-17 06:21:59 UTC 10h ago      carbonio-certbot.timer       carbonio-certbot.service  

Finalise Renewal
----------------

Once the certificate has been renewed, run the two deployment commands

.. code:: console

   zextras$ /opt/zextras/libexec/zmproxyconfgen
   zextras$ /opt/zextras/bin/zmproxyctl reload


In case you have multiple Proxy Nodes, run the two commands on all
Proxy Nodes.
