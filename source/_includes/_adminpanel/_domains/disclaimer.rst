To add a disclaimer to e-mails, use either textfield present in the
page. The text written in the left-hand side will be appended to
e-mails of users that have the mail editor set for plain-text, while
the text written in the right-hand side is for user using the
rich-text editor.

Please check the |product|'s :ref:`global settings <global-settings>`
for further configuration.

The text can contain for example a legal, confidentiality, or
copyright notice: an example in text::

  This email and any files transmitted with it are confidential and
  are for the sole use of the individual or entity to which they are
  addressed. If you received this email in error, please notify your
  system administrator.

One example in HTML::

  <h2>Contacts</h2>
  <p>Company Phone: +00 123 456 7890</p>
  <p>Company e-mail: info@example.com</p>

Every time you enable or disable the disclaimer or change the text,
you need to issue the command as the ``zextras`` user on every Node
featuring the :ref:`MTA role <role-mta-install>`

.. code:: console

   zextras$ /opt/zextras/libexec/zmaltermimeconfig

.. seealso:: Domain disclaimer can be managed from the CLI as well,
   please refer to Section :ref:`disclaimer-cli`.
