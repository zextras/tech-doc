Disable Amavis Anti-Virus
=========================

There are scenarios in which an Administrator wants to or needs to
disable |product|'s internal anti-virus engine, ``amavis``, for
example when using an external anti-virus engine or for
troubleshooting some MTA's issue in a test environment.

In these cases, the status of ``amavis`` can be manually disabled from
the CLI using command

.. code:: console

   zextras$ carbonio prov mcf carbonioAmavisDisableVirusCheck TRUE

You can check at any time the status of the variable and of the
service with

.. code:: console

   zextras$ carbonio prov gcf carbonioAmavisDisableVirusCheck

.. note:: If you never modified the value of the variable, this
   command may return no output, meaning that ``amavis`` is running.
