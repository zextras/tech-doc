
Mail Transfer Agent
===================

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

.. _apt-mta-postscreen:


Postscreen Tuning
-----------------

This section allows to tweak some MTA parameters using *postscreen*, a
Postfix's feature to enhance performances by filtering out unwanted incoming
connections to the STMP server.

.. card:: The available *Actions*

   In the Postscreen Tuning section an **Action** is an operation made
   on an incoming e-mail whenever a test reaches a given
   threshold. That is, for example, when the incoming e-mail is marked
   as coming from a blacklisted source or contains some unwanted
   features.

   There are three values that the various *Action*\s listed in this
   section (*Blacklist Action*, *DNS Blacklist Action*, *Bare Newline
   Action*, *NonSMTP Command Action*, and *Pipelining Action*) can
   assume:

   * **Ignore**. This is the default action: simply ignore the result
     of the test, but allow other tests to be carried out on the
     e-mail. Tests will be executed again in case the client connects
     again in the future

     .. hint:: This option is useful for testing and collecting
        statistics without blocking mail.

   * **Enforce**. The e-mail is rejected (with an SMTP 550 reply) and
     some of the e-mail's data (helo, sender, and recipient) are
     logged. Other tests will be carried out on the e-mail, and tests
     will be executed again in case the client connects again in the
     future

   * **Drop**. The incoming connection is immediately dropped (with an
     SMTP 521 reply). Tests will be executed again in case the client
     connects again in the future.

.. rubric:: Blacklisting

The two settings allow to define a range of IP addresses and the
policy to apply to them. The default is to **Ignore** addresses in the
``permit_mynetworks`` range (which is the one defined in Postfix
configuration). This means that only these IP addresses are allowed.

.. rubric:: DNS Blacklisting

Settings in this section allow to implement on the |product|
infrastructure *Realtime BlackLists* (RBLs) to help reducing
unsolicited e-mails (i.e., e-mails containing spam, phishing, viruses,
and other malware) from remote servers that are known to send this
kind of e-mail. These options are available:

DNS Blacklist Sites
  Takes an URL that provides blacklists

  .. hint:: Multiple URLs can be provided as a comma-separated list or
     URLs, for example
     ``zen.spamhaus.org,dnsbl.sorbs.net,b.barracudacentral.org``.

The other options determine how the blacklist treats the scanned
e-mails and how often the RBLs are updated. In particular:

DNS Blacklist Threshold
  The lower score that will fire the Action on the e-mail.

DNS Blacklist Whitelist Threshold
  This option allows an incoming connection to skip some tests related
  to the protocol if its IP address is not included in one the
  configured blacklists.

DNS Blacklist Min TTL, DNS Blacklist Max TTL, DNS Blacklist TTL
   The *Time To Live* values allow to define for how long an incoming
   client, which is not present in any blacklist, is allowed to skip
   the tests.

.. rubric:: Tuning

This part contains some advanced options. For each of them you can
also specify the action to be carried out and the TTL.

Bare Newline
  A *Bare New Line* is a line from an e-mail that ends with an
  ``<LF>`` sequence, instead of the standard ``<CR><LF>``. While this
  is not a problem or a threat, it may enable SMTP smuggling (see
  https://www.postfix.org/smtp-smuggling.html for more information).

NonSMTP Command
  Define what to do when the client sends commands that violate the
  standard SMTP protocol.

Pipelining
  *Pipelining* is formally defined in :rfc:`2920` and refers to the
  ability of an SMTP server to process multiple commands send by a
  connecting client, as opposed as the standard process in which the
  client must wait for a reply or answer from the server before being
  allowed to send another command. Enabling this option is
  resource-consuming, because a client that passes this test is
  required to disconnect and reconnect to be able to communicate with
  the SMTP server.

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

.. _ap-mta-adv:

Advanced
--------

In this section you can configure logging and some advanced options.

.. rubric:: Logging

Options in the *logging* section allow to define the verbosity (log
level) for Amavis and TLS activity of SMTP and LMTP clients. For the
*SAS Log level for Amavis*, choose either to log only informative
(INFO) messages or all messages, while for the other the lower the
value, the less messages will be saved.

.. rubric:: Tuning

These options concern the threads used by antivirus, LMTP, and MILTER
processes, and the maximum size of an e-mail message.

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

.. _ap-mta-single:

Single Server
=============

Options in this section are configured on each server separately.

General
-------

The first option is to enable authentication for the MTA server. It
should always be active, because otherwise anyone can access it and
use it to send email, without the need for an account.

The **My Network** option is the same used by postfix: Clients
connecting from from the subnets that are specified in this option
will be allowed to send e-mails skipping some checks (antivirus and
Antispam). Clients connecting from outside these subnets will be
allowed to send e-mail using this server only after passing these
checks.

It is then possible to provide a **Relay Host**: |product| will then
forward all the e-mails to this server, which will then take care of
all checks and of the actual delivery of the e-mail to the recipients.

In case the server does not deliver e-mails to other remote servers on
the Internet (i.e., it is used only for local e-mail delivery), junk
and Spam levels can be reduced, while some checks can be disabled: the
outbound messages, DKIM status and Antivirus.

The **Logging** option are the same that are defined in
:menuselection:`MTA --> Advanced` (See :ref:`ap-mta-adv`).
