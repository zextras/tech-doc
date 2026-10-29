This section provides details about the |product| MTA's mail queues,
how to interact with them, and how to extract relevant information.

.. _monit-mta:

Mail Queue Management
=====================

There are cases in which messages sent by users remain in the outgoing
queue and cannot be delivered to their recipients. When this happens, the
MTA queue can be inspected and managed from the command line.

CLI Commands Available
----------------------

The following commands can be used to inspect and manage Postfix queues:

* ``postconf`` displays or modifies the Postfix configuration.
* ``postfix`` is the main Postfix command and can be used to start, stop,
  and reload Postfix, flush queues, and check the configuration.
* ``qshape`` displays the age and domain distribution of messages in
  Postfix queues.
* ``postqueue`` displays and manages Postfix queues.
* ``mailq`` displays the messages currently present in the mail queue.
* ``postsuper`` performs administrative operations on Postfix queues and
  must be run with sufficient privileges.
* ``postcat`` displays the contents of messages stored in Postfix queues
  and must be run with sufficient privileges.

The command examples below are executed as ``root`` on the Carbonio MTA
node, except for ``qshape``, which must be executed as the ``zextras`` user.

**Example**

To filter the displayed queue listing for lines containing a specific
address:

.. code-block:: bash

   /opt/zextras/common/sbin/postqueue -p | grep -F 'mail@example.com'

This command searches the formatted queue listing for matching text, such
as sender or recipient addresses. It does not search message subjects or
bodies and does not delete any messages.

Inspect the Postfix Queue
-------------------------

To display the messages currently present in the Postfix queue, run:

.. code-block:: bash

   /opt/zextras/common/sbin/postqueue -p

If the queue is empty, the command returns:

.. code-block:: text

   Mail queue is empty

The ``mailq`` command can also be used to display the queue:

.. code-block:: bash

   /opt/zextras/common/sbin/mailq

Inspect Queue Distribution with qshape
--------------------------------------

The ``qshape`` command displays the distribution of messages in a Postfix
queue according to their age and sender or recipient domain.

The command must be executed as the ``zextras`` user. Switch to this user:

.. code-block:: bash

   su - zextras

For example, to inspect the hold queue and display the distribution by
sender domain:

.. code-block:: bash

   /opt/zextras/bin/qshape -s hold | head

Example output:

.. code-block:: text

                            T 5 10 20 40 80 160 320 640 1280 1280+
   TOTAL                    0 0  0  0  0  0   0   0   0    0     0

The ``-s`` option displays sender-domain statistics. Without this option,
``qshape`` displays recipient-domain statistics.

View a Message in the Queue
---------------------------

First obtain the queue ID of the message with ``postqueue``. Then use
``postcat`` to inspect its contents.

Replace ``QUEUE_ID`` with the actual message queue ID:

.. code-block:: bash

   /opt/zextras/common/sbin/postcat -q QUEUE_ID

To display additional information, add the ``-v`` option:

.. code-block:: bash

   /opt/zextras/common/sbin/postcat -qv QUEUE_ID

.. note::

   Queue IDs displayed by ``postqueue -p`` may include status suffixes
   such as ``*``, ``!``, or ``#``. These suffixes are not part of the
   queue ID and should be removed when using the ID in other commands.

Flush the Postfix Queue
-----------------------

To request immediate delivery of all queued mail, run:

.. code-block:: bash

   /opt/zextras/common/sbin/postqueue -f

This command requests a new delivery attempt. Messages that cannot be
delivered may remain in the queue.

Requeue Messages
----------------

The ``postsuper`` command can be used to requeue a specific message:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -r QUEUE_ID

To requeue all messages:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -r ALL

Requeuing a message causes Postfix to process it again and may assign it
a new queue ID.

Put Messages on Hold
--------------------

To put a specific queued message on hold:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -h QUEUE_ID

To put all queued messages on hold:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -h ALL

Messages placed on hold are moved to the hold queue and are not processed
for delivery until released.

Release Messages from Hold
--------------------------

To release a specific message from the hold queue:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -H QUEUE_ID

To release all messages from the hold queue:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -H ALL

Released messages are moved to the deferred queue, where they become
available for subsequent delivery attempts.

Delete Messages from the Queue
------------------------------

.. warning::

   Deleting messages from the queue is irreversible. Verify the affected
   messages before running any deletion command.

To delete a single message:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -d QUEUE_ID

To delete all messages from all queues:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -d ALL

To delete all messages from the deferred queue:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -d ALL deferred

To delete all messages from the hold queue:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -d ALL hold

To delete several messages whose queue IDs are stored in a file:

.. code-block:: bash

   /opt/zextras/common/sbin/postsuper -d - < file_with_queue_ids.txt

Delete Messages by Sender Address
---------------------------------

It is possible to identify and delete queued messages associated with a
specific sender address.

The following examples use the sender address ``mail@example.com``.
Replace this address with the sender you want to filter.

Identify Matching Messages
~~~~~~~~~~~~~~~~~~~~~~~~~~

Before deleting messages, display the queue IDs associated with the
specified sender:

.. code-block:: bash

   /opt/zextras/common/sbin/postqueue -p | \
     grep -Ev '^[[:space:]]*\(|^-Queue ID-' | \
     awk 'BEGIN { RS = "" } { if ($7 == "mail@example.com") print $1 }' | \
     tr -d '*!#'

This command processes the formatted queue listing and identifies
messages whose sender address matches the specified value.

The ``tr -d '*!#'`` command removes the following queue-ID status suffixes:

* ``*`` — Message is in the active queue.
* ``!`` — Message is in the hold queue.
* ``#`` — Message is marked for forced expiration.

These suffixes must be removed before passing queue IDs to ``postsuper``.

Delete Matching Messages
~~~~~~~~~~~~~~~~~~~~~~~~

After verifying the returned queue IDs, use the following command to
delete the matching messages:

.. code-block:: bash

   /opt/zextras/common/sbin/postqueue -p | \
     grep -Ev '^[[:space:]]*\(|^-Queue ID-' | \
     awk 'BEGIN { RS = "" } { if ($7 == "mail@example.com") print $1 }' | \
     tr -d '*!#' | \
     /opt/zextras/common/sbin/postsuper -d -

The queue IDs are passed to ``postsuper``, which deletes the corresponding
messages.

.. important::

   This example filters messages by their sender address only. It does
   not select messages by recipient address. Verify the matching queue
   IDs before running the deletion command.

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

  zextras$ /opt/zextras/libexec/zmmsgtrace --help
