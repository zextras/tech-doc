.. index:: AD autoprovisioning, autoprovisioning

.. _ad-auto:

Automatic User Provisioning with AD
===================================

The purpose of this section is to set up |product| to poll an existing
external LDAP or AD server, collect the existing users from there and
create account with the same username on |product|. Once the feature
has been configured, every user that exists on the LDAP or AD will be
able to login directly to |product|.

.. _ad-auto-scenario:

Scenario
--------

The scenario we present here consists of an Active Directory Server
with the following configuration.

* Network IP address is **128.24.0.50**.

* The users that will be able to login to |product| belong to the
  **test247** group.

* The *test247* group belongs to the **zextraslab.ad** domain.

* There is an administrative user with credentials

  * *AdminBindDn*: **CN=Auto Provisioning,CN=Users,DC=zextraslab,DC=ad**

  * *BindPassword*: **a_very_stron_pass!**

Moreover, for the set up, we need also the following configuration
option.

* *BindDn*: **autoprovisioning@zextraslab.ad**

* A domain on which to bind in the form of SearchBase: **DC=zextraslab, DC=ad**

* A correct search filter:
  **CN=test247,CN=Users,DC=zextraslab,DC=ad**. By using this filter,
  all user in AD's grou

Additionally, on |product| we will use domain **test.auth** for the
purpose of authenticating users and we will set a time interval of 1
minute, called **provisioning polling interval**, used to synchronise
users in |product| and in the external AD.

.. _ad-auto-procedure:

Procedure
---------

To configure auto provisioning, follow the procedure in this section;
to complete it successfully, remember that all the commands below must
be run as the ``zextras`` user on a Node featuring the **Mailstore &
Provisioning** Role.

..  hint:: Make sure that all relevant information are enclosed in
    quotes, to prevent any issue with non-escaped characters.

We start by defining the domain used for authentication.

.. code:: console

   zextras$ carbonio prov cd test.auth

Now, configure the AD auto provisioning.

.. code:: console

   zextras$ carbonio prov md test.auth zimbraAutoProvAccountNameMap samAccountName
   zextras$ carbonio prov md test.auth zimbraAutoProvAttrMap description=description
   zextras$ carbonio prov md test.auth zimbraAutoProvAttrMap displayName=displayName
   zextras$ carbonio prov md test.auth zimbraAutoProvAttrMap givenName=givenName
   zextras$ carbonio prov md test.auth zimbraAutoProvAttrMap cn=cn
   zextras$ carbonio prov md test.auth zimbraAutoProvAttrMap sn=sn
   zextras$ carbonio prov md test.auth zimbraAutoProvAuthMech LDAP
   zextras$ carbonio prov md test.auth zimbraAutoProvBatchSize 4000

Configure the AD server from which to fetch the usersm using the data
provided in the :ref:`ad-auto-scenario` above.

.. code:: console

   zextras$ carbonio prov md test.auth zimbraAutoProvLdapAdminBindDn \
   "CN=Auto Provisioning,CN=Users,DC=zextraslab,DC=ad"
   zextras$ carbonio prov md test.auth zimbraAutoProvLdapAdminBindPassword 'a_very_stron_pass!'
   zextras$ carbonio prov md test.auth zimbraAutoProvLdapBindDn auto provisioning@zextraslab.ad
   zextras$ carbonio prov md test.auth zimbraAutoProvLdapSearchBase DC=zextraslab,DC=ad

Define the correct search filter, so all accounts in the group
**test247** will be fetched.

.. code:: console

   zextras$ carbonio prov md test.auth zimbraAutoProvLdapSearchFilter \
   "(memberOf=CN=test247,CN=Users,DC=zextraslab,DC=ad)"

Enter the IP address or hostname of the ad server.

.. code:: console

   zextras$ carbonio prov md test.auth zimbraAutoProvLdapURL \
   ldap://128.24.0.50:3268

Set the operation mode to **EAGER**.

.. code:: console

   zextras$ carbonio prov md test.auth zimbraAutoProvMode EAGER

Finally, set the provisioning polling interval to 1 minute for domain
``test.auth``.

.. code:: console

   zextras$ carbonio prov ms $(zmhostname) \
   zimbraAutoProvPollingInterval "1m" +zimbraAutoProvScheduledDomains \
    "test.auth"

At this point, configuration of auto provisioning is complete. You
should be able to find in the :file:`/opt/zextras/log/mailbox.log`
file messages that show activities relates to auto provisioning, for
example::

  2024-06-26 15:59:13,386 INFO  [AutoProvision] [] autoprov - Auto provisioning accounts on domain test.auth
  2024-06-26 15:59:13,406 INFO  [AutoProvision] [] autoprov - 3 external LDAP entries returned as search result
  2024-06-26 15:59:13,406 INFO  [AutoProvision] [] autoprov - auto creating account in EAGER mode: john@test.auth, dn="CN=paolo rossi,CN=Users,DC=zextraslab,DC=ad"
  2024-06-26 15:59:13,637 INFO  [AutoProvision] [] autoprov - auto provisioned account: john@test.auth
  2024-06-26 15:59:13,637 INFO  [AutoProvision] [] autoprov - auto creating account in EAGER mode: jane@test.auth, dn="CN=test01,CN=Users,DC=zextraslab,DC=ad"
  2024-06-26 15:59:13,639 INFO  [AutoProvision] [] autoprov - auto provisioned account: jane@test.auth
  2024-06-26 15:59:13,639 INFO  [AutoProvision] [] autoprov - auto creating account in EAGER mode: alice@test.auth, dn="CN=mario,CN=Users,DC=zextraslab,DC=ad"
  2024-06-26 15:59:13,641 INFO  [AutoProvision] [] autoprov - auto provisioned account: alice@test.auth
  2024-06-26 15:59:13,641 INFO  [AutoProvision] [] autoprov - Auto Provisioning has finished for now, setting last polled timestamp: 20240626155913.404Z
  2024-06-26 15:59:13,642 INFO  [AutoProvision] [] autoprov - Sleeping for 1000 milliseconds

If you see messages similar to these, which show that accounts are
fetched from the AD server, then provisioning was successfully
configured and you can proceed with the last point: configure
Authentication using an :ref:`auth-ext-ad`.

Troubleshooting
---------------

In case you do not see any account being fetched, please double check
that all the data you supplied is correct, especially credentials of
AD's  administrative user, IP or hostname, and ports.
