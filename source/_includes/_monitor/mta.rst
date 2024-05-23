This section provides details about the |product| MTA's mail queues,
how to interact with them, and how to extract relevant information.

.. _monit-mta:

Mail Queue Management
=====================

There are cases in which messages that users send remain stuck in the
outgoing queue and can not be delivered to the recipient.  When this
happens, you can check the MTA queue in different ways:

* by executing some commands from CLI
* from the |adminui| (see Section :ref:`ap-mta-queue`)
* by using Prometheus/Grafana based dashboards, on which suitable
  alarms can be defined

CLI commands available
----------------------

The following is a list of commands that can be used from the CLI. you
can check their manpage for their use and configuration.

* ``postconf`` is a Postfix command to view or modify the Postfix
  configuration

* ``postfix`` is the main Postfix command, used to start, stop, and
  reload the service; flush the queues; check and upgrade the
  configuration

* ``qshape`` allows to examine Postfix queues in relation to time and
  sender's or recipient's domains

* ``postqueue`` is used to manage queues

* ``postsuper`` allows to delete messages from queues (must be run as
  root)

* ``postcat`` allows to read messages in queues (must be run as root)

.. card:: Example

   .. code:: console

      # /opt/zextras/postfix/sbin/postqueue -p|grep someString | awk \
      '{print $1}' | /opt/zextras/postfix/sbin/postsuper -d -

   This command filters from the queue all messages containing
   ``someString``, then prints only the first field, which is the
   e-mail ID and passes to ``postsuper``, which deletes the messag to
   the queue.

Daily E-Mail Reports
--------------------

If the MTA logs are concentrated on a single |product| Node by
specifying a value for options ``zimbraLogHostname``, it will be
possible to define an entry in ``crontab`` that sends a daily report;
for example, the following entry in crontab will generate a report
every day at 11:30 PM::

  30 23 * * * /opt/zextras/libexec/zmdailyreport -m

The report will contain a lot of useful information, including:

* comprehensive statistics about the processed messages: received,
  delivered, forwarded, deferred, bounced, and so on

* Host/Domain summary: message delivery (top 50)

* Host/Domain summary: messages received (top 50)

* Top 50 senders by message count

* Top 50 recipients by message count

* Top 50 senders by message size

* Top 50 recipients by message size

* Details about message deferral, bounce, andreject

Message tracking
----------------

|product| makes available the ``zmmsgtrace`` utility: it allows to
track the flow of messages, rebuilding it from the log files.
Useful options are::

  --id "msgid"  The e-mail ID of the message
  
  --senders "john.smith\@example.com"    Rebuild the flow of all messages
                                         sent by john.smith\@example.com

  --recipient "john.smith\@example.com"  Rebuild the flow of all messages
                                         received by john.smith\@example.com

All these options accept a regexp as value.

A more detailed help is provided by command

.. code:: console

   $zextras /opt/zextras/libexec/zmmsgtrace --help
