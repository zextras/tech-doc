
SMTP Smuggling
==============

This issue is a spoofing attack concerning Postfix and was
discovered recently. Their developers are working to provide a fix for
the issue, but you can prevent your |product| to be affected by
following these steps.

.. hint:: Before actually carrying out the steps, read the article to
   check background information and mitigation:
   https://www.postfix.org/smtp-smuggling.html

In |product|, a modified version of Postfix 3.8.3 is used, so you do
need to change only one of the two variables, ``smtpd_discard_ehlo_keywords``.

#. Login to your |product| as the ``root`` user
#. Go to directory :file:`/opt/zextras/common/conf`

   .. code:: console

      # cd /opt/zextras/common/conf

#. Open file :file:`main.cf` and search for variable
   ``smtpd_discard_ehlo_keywords=``

   there should be no value provided (i.e., there's nothing after the
   ``=``, so add the word **chunking**. The resulting line must read::

     smtpd_discard_ehlo_keywords = chunking

#. Save the file and run, as the ``zextras`` user, the command

   .. code:: console

      # su - zextras -c "zmmtactl reload"
