.. _adv-admin:


Advanced Administration Tasks
=============================

In this section we describe and outline a few advanced tasks,
providing quick directions to carry them out.

Role-based Access Control
-------------------------

|product| uses a delegation mechanism to allow the principal
administrator to assign roles and permission to other users with the
purpose of sharing with them the administration tasks and duties,
electing them as either **Global** or **Delegated** Administrator, who
have different privileges to configure and manage these features.

In the context of the management of Anti-Virus and Anti-Spam
functionalities, each Administrator, either Global or Delegated, can
access with the personal account and be able to control and manage
them, according to permissions granted.


Server-side Management of E-mails
---------------------------------

|product|\'s |mta| (Postfix)  receives e-mail by means of the SMTP protocol and
forwards it to the correct e-mail queue according to the user's
username (this coincides with the user's e-mail address). In case of
an e-mail whose recipient is a distribution list (i.e., a mailing
list), the e-mail is forwarded to each of the members of the list.

Additional rules can be created directly on Postfix from
the CLI. Examples of restriction rules can be found directly in
Postfix documentation, for example in `Postfix Standard Configuration
Examples
<https://www.postfix.org/STANDARD_CONFIGURATION_README.html>`_. More
examples, depending on the use case, can be found in the official  `Postfix
documentation <https://www.postfix.org/documentation.html>`_.

.. _cli-attachments:

Server-side Attachment Management
---------------------------------

.. include:: /_includes/_admincli/attachments.rst

.. _cos-management:

Management of a COS
-------------------

Each account on |product| is assigned a |cos|, a global object that is
not restricted to a particular domain or set of domains.

The |cos| assigned to an account determines the default attributes
for that account and the features to be enabled or not for it. The COS
controls mailbox quotas, message lifetime, password restrictions,
attachment blocking, and server pool usage.

You can create and edit the classes of services via CLI and soon also
via the new |adminui|, in which the tasks of |cos| management will
feature an helpful wizard that guides the Administrator through the
creation process.

.. code:: console

   # carbonio prov createCos {name} [attribute value ...]


All the attributes that need to be customised can be either added at
the end of the base command above as ``[ attribute value ]`` pairs, or
at a later point with the following command:

.. code:: console

   # carbonio prov modifyCos {name} [attribute value ...]

.. _enable-smime:

S/MIME support
--------------

S/MIME support for all users can be enabled using command

.. code:: console

   zextras$ carbonio config set global enableSmimeEncryption TRUE

Users will then be able to upload certificates to be used for S/MIME
signing; setting it to ``false`` will prevent users from using the
feature.

Additionally, the command below enables the ability of the user to
verify the S/MIME signature.

.. code:: console

   zextras$ carbonio prov mcf carbonioSMIMESignatureVerificationEnabled true

.. index:: Password policies; S/MIME

The access the S/MIME *Certificate Store* from within their Settings
page, users need to supply a password, which is different from the
S/MIME certificate's password. You can set various parameters of this
password from the CLI, by using the following command as the |zu|
user.

.. code:: console

   zextras$ carbonio config set global \
   encryptionPasswordPolicyAttribute <attribute> <value>

The list of all available attributes that can be customised can be
retrieved using command

.. code:: console

   zextras$ carbonio config get global \
   encryptionPasswordPolicyAttribute

The output of the above command is::

  global
        values

                attribute                                                   encryptionPasswordPolicyAttribute
                inheritedValue
                    minLength                                                       8
                    maxLength                                                       100
                    minUpperCase                                                    1
                    minLowerCase                                                    1
                    minDigits                                                       1
                    minPunctuation                                                  0
                    minAlphaChars                                                   0
                    minPunctuationOrDigitChars                                      0
                    requireAlphanumeric                                             true
                    allowedChars
                    allowedPunctuation
                    denyList
                inheritedFrom                                               default
                isInherited                                                 true
                modules
                        ZxCore

The attribute is available only at global level, meaning this password
policy is the same for all configured domains, CoS, and user on the
system.

.. _upstream-proxy:

|product| And HTTP Proxy
------------------------

.. include:: /_includes/_admincli/http-proxy.rst

.. _freshclam-proxy:

Freshclam And HTTP Proxy
------------------------

.. include:: /_includes/_admincli/freshclam-proxy.rst
