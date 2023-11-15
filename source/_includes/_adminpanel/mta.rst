An |mta| is a software application with the purpose to send e-mail
messages from a server to another one. This section of the |adminui|
allows to configure how |product| manages and interacts with the
e-mails and is organised in :ref:`ap-mta-in`, :ref:`ap-mta-out`, and
:ref:`ap-mta-antivirus`.

.. _ap-mta-in:

Inbound Flow & Security
-----------------------

In this page, it is possible to configure options related to incoming
e-mail traffic and security checks.

.. note:: After you have configured and saved any options, it is
   necessary to reboot the node on which the MTA runs.

.. rubric::  Settings

The first few options allow to define a custom list of file extensions
that will be used to block all attachments. Use the
:bdg-primary-line:`ADD COMMONLY BLOCKED EXTENSIONS` button on the
right-hand side as a shortcut to add a number of common file
extensions that are blocked. You can also manually add any other
file extension.

.. hint:: Entries in the list are separated by a space, so type an
   extension (e.g., **exe**) and press the space bar to add **exe** to
   the list.

Whenever an attachment is blocked, you can enable notifications for
both the administrator and the recipient of the e-mail using the
respective switch.

.. rubric:: Rejection

The next options allow to reject e-mails: when the e-mail appears to
have no sender or recipient, or in case the sender is not
authenticated. This last option is useful to prevent remote forged
connections to access the MTA and send e-mail without being
authenticated.

.. rubric:: Protocol Checks

With the third batch of options, a couple of routine checks of the
SMTP protocol used by the MTA can be enabled, including for the IP and
domain of a client, the presence of a |fqdn| in the address, and HELO
greetings upon a connection is established.

.. _ap-mta-out:

Outbound Flow
-------------

The Outbound Flow page controls which options are applied to the
messages sent from the local domain. 

.. rubric:: General

These options allow on the one side, to add the client's IP and
username to the e-mail header and to require authentication to send
e-mails; while on the other, to define a few parameters used by
the ``MyNetworks`` section of the MTA's configuration.

**Relay Host** allows to route all outgoing e-mail to a server different
from |product|'s. **Fallback Relay Host** will be used in case the
**Relay Host** is unreachable.

.. note:: Setting a **Relay Host** impacts the whole |product|'s
   infrastructure: all outgoing e-mails from all configured domains
   will be forwarded to the **Relay Host**.

.. rubric:: Instances

The bottom part off the page shows information about the enabled
services on the mail servers configured on the |product| installation:
Antispam and Antivirus, Authentication and DKIM.

.. _ap-mta-antivirus:

Antivirus & Antispam
--------------------

Options that appear here concern the Antispam and Antivirus engines.

.. rubric:: Antispam

Whenever an e-mail is marked as spam, its subject can be prefixed with
a given string (``[SPAM]`` or ``***SPAM***`` among the most popular)
and can be either discarded (which means the e-mail is deleted and the
recipient will never receive it) or it will be delivered anyway.

The two options on the left-hand side control when the email should be
simply marked as spam or deleted immediately. The values for both
options (*Low*, *Medium*, and *High*) are relative to the spam score
assigned by SpamAssassin: a score of *20* represents *100%*. The
**Tolerance for Spam Delivery** tolerance is by default (i.e., the *Medium*
value) *33%*, while the **Tolerance for Spam Blocking** is *75%*. This means
that a e-mail with a spam score of ~6.6 will be marked as spam email,
while with spam score 15 will be immediately be deleted. Changing the
value to *Low* or *High* will reduce or raise the threshold to mark or
delete spam e-mails.

For further security, you can check also the outbound traffic and
verify DKIM: If a domain is configured with DKIM, e-mails originating
from that domain which miss a DKIM signature are considered to have
been forged and therefore illegitimate.

.. seealso:: The procedure to configure DKIM on |product| is described
   in Section :ref:`dkim-record`.

.. rubric:: Antivirus Definitions

The default mirror used to download signatures is
``db.us.clamav.net``; it can be supported by other servers or mirrors
by writing their URL in the left-hand side textfield, then click the
:bdg-primary-line:`ADD` button. Existent mirrors can be deleted by
selecting them and clicking the :bdg-primary-line:`REMOVE` button.

Similarly, you can manually add or remove a file containing custom
virus signatures using the textfield on the right-hand side and then
click the :bdg-primary-line:`ADD` or :bdg-primary-line:`REMOVE`
button.

.. hint:: The syntax of the file must comply with the syntax of any
   ClamAV-supported signature formats. See `ClamAV official signature
   documentation <https://docs.clamav.net/manual/Signatures.html>`_
   for more information.

Frequency of signatures update from the mirror can be defined next, and
tuned from a few seconds to several weeks.

.. _ap-mta-queue:

Queue
-----

This page lists statistics about the messages managed by the MTA
system, according to their status. The timestamp of the last update
appears, as well as two button that allow to
:bdg-primary-line:`RESTART SCAN` or to manually
:bdg-primary-line:`FLUSH QUEUES`.

When clicking a server, a dialog opens, containing the content of the
queue, that is, all the messages grouped by their status (Queued,
Corrupted, Deferred, Incoming, and On Hold). Also here you can
:bdg-primary-line:`FLUSH QUEUES`.

Clicking either of the status, a detailed vision of the queued
messages appears. Selecting a messages allows to carry out some
actions: put it on :bdg-primary-line:`HOLD`;
:bdg-primary-line:`RELEASE`, :bdg-primary-line:`REQUEUE`, or
:bdg-primary-line:`DELETE` it.
