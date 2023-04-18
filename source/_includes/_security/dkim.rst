.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _dkim-record:

Add a DKIM Record to |product| Installation
===========================================

This section provides directions to add a DKIM record to the DNS of
the domain managed by a |product| installation.

.. topic:: DKIM in a nutshell
	   
   The **D**\omain\ **K**\eys **I**\ dentified **M**\ ail (**DKIM**)
   is a method to verify that an e-mail was sent from a legitimate mail
   server. Each e-mail is marked with a digital signature that can be
   verified by the receiver.

   Technically, a **TXT record** that identifies the SMTP server must
   be added to the domain's DNS configuration.

   .. seealso:: DKIM is an Internet Standard first defined in
      :rfc:`6376`, later updated in :rfc:`8301` and :rfc:`8463`.


Create a DKIM Record
--------------------

In order to create a new DKIM record, two steps are necessary. As
usual, we are using `example.com` in our scenario as the domain name: replace it
with the actual domain name.

.. card:: 

   Step 1: Generate DKIM record
   ^^^^^

   Execute the following command to generate a new DKIM record for the
   domain.

   .. code:: console

      # /opt/zextras/libexec/zmdkimkeyutil -a -d example.com

   The output will be similar to the following::

     DKIM Data added to LDAP for domain example.com with selector D43CB080-8FE0-11EC-88DF-9958FFC5EFF5
     Public signature to enter into DNS:
     D43CB080-8FE0-11EC-88DF-9958FFC5EFF5._domainkey IN TXT ( "v=DKIM1; k=rsa; ""p=MIIBIjANBgkqhkiG9w0BAQEFA
     AOCAQ8AMIIBCgKCAQEA6fn7z208Gj/UVAL29CeKxhyHrRnals/qs4kWxnWuPK+ogDQjZoD0aUIv6QkUX6Y/KSYUd9qHEy1I7pSNIlyS
     ecqeq/YsP5zXzoKD7WmLfE0PGIx0CEtsn4h4MJucm+LNVKziSPVzkVZ0rku15BaBO1bpFd7bvkXMffei3cc2zwrFmFSDVB5P84k1na+
     5p1o4NBq3SDn8fks9r6""CJ7dAZQ3LazNmAgenMldkWC7tv+/25CStiz3QQ4GqCn4tp0VW3hWOQm6tRSe1yHEG10XT2cSieFM1w0GzB
     XZZEedCK1POmFoOKwgqraxJtqiPdM7i+mjUOy7w1uqJa4fyxjbVp0QIDAQAB" ) ; ----- DKIM key D43CB080-8FE0-11EC-88D
     F-9958FFC5EFF5 for example.com


.. card::

   Step 2: Add DKIM record to DNS settings 
   ^^^^^
   Edit the DNS settings of the domain and create a new record as
   follows, using the output of the previous command.

   * Create a new record of type *TXT* with **name**
     *D43CB080-8FE0-11EC-88DF-9958FFC5EFF5._domainkey*

   * As value of the new record, copy and paste the string within the
     ``(`` braces ``)`` and make sure that the value does not contain
     any newline (that is, the value is written on one line)::
       
       v=DKIM1; k=rsa; ""p=MIIBIjANBgkqhkiG9w0BAQEFA
       AOCAQ8AMIIBCgKCAQEA6fn7z208Gj/UVAL29CeKxhyHrRnals/qs4kWxnWuPK+ogDQjZoD0aUIv6QkUX6Y/KSYUd9qHEy1I7pSNIlyS
       ecqeq/YsP5zXzoKD7WmLfE0PGIx0CEtsn4h4MJucm+LNVKziSPVzkVZ0rku15BaBO1bpFd7bvkXMffei3cc2zwrFmFSDVB5P84k1na+
       5p1o4NBq3SDn8fks9r6""CJ7dAZQ3LazNmAgenMldkWC7tv+/25CStiz3QQ4GqCn4tp0VW3hWOQm6tRSe1yHEG10XT2cSieFM1w0GzB
       XZZEedCK1POmFoOKwgqraxJtqiPdM7i+mjUOy7w1uqJa4fyxjbVp0QIDAQAB"

     .. warning:: Depending on the DNS, it is possible that you need
        to remove the double quotes, the white spaces, or both!

Test and Verify
---------------

There are several tests that can be carried out to verify that the
DKIM has been added correctly to the domain DNS and works correctly to
sign the outgoing e-mails.

.. card::

   TXT record test
   ^^^^

   To check that the TXT record has been added to the DNS, issue the
   following command from any Linux box.

   .. code:: console

      # nslookup -type=txt D43CB080-8FE0-11EC-88DF-9958FFC5EFF5._domainkey.example.com

   Make sure that you use the same name used when creating the TXT
   record.

   If the DKIM record has been added correctly, the output contains
   the record, starting with **v=DKIM1**. Otherwise, if the DKIM
   record has not been set correctly, or if there was some issue in
   retrieving it, you will not see the string **v=DKIM1** in the
   output.
   
.. card::

   DKIM service enabled
   ^^^^

   The ``openDkim`` service must be running on the |product|
   installation for the outgoing e-mails to be correctly signed. This
   can be verified in the output of the command

   .. code:: console

      # carbonio prov gs $(zmhostname)|grep -i service

   must contain the line::

     zimbraServiceEnabled: opendkim

.. card::

   E-mail signature test
   ^^^^

   To verify that an outgoing e-mail has been correctly signed, the
   easiest way is to send an e-mail from the domain to a third-party
   address. The e-mail receiver can then look at the source code of
   the e-mail (The option is usually called `View e-mail source code`,
   `Show original`, `Show e-mail headers` or similar in any e-mail
   client).

   In the source code, you should see a line similar to the
   following::

     tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1 ... dkim=pass (2048-bit key) header.d=example.com

   Make sure your actual domain name is present instead of
   ``example.com``.


   
