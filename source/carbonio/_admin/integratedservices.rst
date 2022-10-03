.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _integratedservices:

Integrated Services of |product|
================================

Several software and functionalities are included by default in
|product| that help manage the flow of emails and intercept malicious
content in the e-mail and in their attachments.  Moreover, permissions
can be assigned to specific users and delegate them for the management
of parts of the |carbonio| server. This section briefly introduces
them.

Anti-Virus and Anti-Spam Protection
-----------------------------------


The **Amavisd** utility is the interface between the |product| |mta|
and the Clam Anti-Virus (ClamAV) and SpamAssassin software, which
provide anti-Virus and anti-Spam features respectively.

Anti-Virus Protection
~~~~~~~~~~~~~~~~~~~~~

**ClamAV** is the de-facto Open Source standard for anti-viruses
software and is the virus protection engine enabled for each
|carbonio| server,

ClamAv is configured to move messages that have been identified as
carrying a virus out from the Inbox into the dedicated *virus
quarantine mailbox*. Update to ClamAv virus signatures are downloaded
by default every two hours.

Anti-Spam Protection
~~~~~~~~~~~~~~~~~~~~

|carbonio| uses **SpamAssassin** to identify unsolicited commercial
e-mail (spam) or e-mail containing malicious content with the help of
signatures stored in either the *BerkeleyDB* or a *MariaDB* database.

The use of the Postscreen function can be activated to provide
additional protection against mail server overload.

