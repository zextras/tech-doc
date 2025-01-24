.. _activereplica:

===============
 |carbonio| HA
===============

The |product| architecture is mostly based on services that make nodes
*stateless*, redundant, and clustered *by design*.  The only
**stateful** service is the *Mailstore*, due to the fundamental role
it plays in storing metadata, binary blobs, and connection cache.

While this situation could represent a *single point of failure*, a
replica mechanism |product| can be added, that drastically increases
the availability of the Mailstore service.

How it works
============

**Active Replica** is the foundation of the |ha| mechanism described
above, which is an account-based, real-time replication mechanism that
allows |product| to keep multiple instances of a mailbox within
different Mailstores.

The Replica part is in charge of encoding and transmitting all the
transactions of the account to an :ref:`event-streaming queue
<role-es-install>`.  Once processed by the Replica, the events are
consumed by one agent, or even by multiple agents, in the destination
Mailstore.  *Active* means that the destination Mailstores are
**active Nodes**, reducing the need for dedicated resources that store
the passive node of the clusters.  This also improves the overall
performance of the promotion stage, since the service is already up
and running.

Active Replica Requirements
===========================

There are **two requirements** to satisfy to be able to install the
Active Replica.

#. The |product| subscription must include the HA module. The HA is
   licensed “for enabled accounts”.  The license can be verified with command

   .. code:: console

      zextras$ carbonio core getLicenseInfo | grep -e ZxHA -e ha_basic -A2

               ZxHA                                    
                   quantity                                                    1000
                   licensed                                                    true
      --
                   name                                                        ha_basic
                   quantity                                                    1000
                   enabled                                                     true

#. All the primary volumes of the mailbox **must be configured** as
   :ref:`Centralized Storage <pws_centralized_storage>`.

Enabling Active Replica
=======================

To enable Active Replica you need to configure the endpoints of all
the streamer nodes, using either their IPs or FQDNs, which are
supposed to expose port **9092** reachable from each of the other
Mailstores.

.. card:: Example

   Suppose the infrastructure uses the following nodes

   * ``event1.example.com`` with IP ``10.0.10.11``
   * ``event2.example.com`` with IP ``10.0.10.13``
   * ``event3.example.com`` with IP ``10.0.10.14``

   Either of the following commands must be executed

   .. code:: console

      zextras$ carbonio config set global brokers "event1.example.com:9092,event2.example.com:9092,event3.example.com:9092"

   Or

   .. code:: console

      zextras$ carbonio config set global brokers "10.0.10.11:9092,10.0.10.12:9092,10.0.10.13:9092"

To verify that the settings have been applied and the service operates
correctly, you can use the commands presented in section :ref:`ar-ts`
below.

Active Replica Usage
====================

A number of CLI commands can be used to carry out routine operations
with the Active Replica: :ref:`initialise <ar-init>`, :ref:`monitor
<ar-monit>`, :ref:`promote <ar-promo>`, and :ref:`delete <ar-del>` a
Replica.

Limitations of the Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The command presented in this section **do not support**:

* regular expressions in the account name: ``john.doe@example.com`` is
  supported, while ``john*@example.com`` or ``?ohn@example.com`` are not

* distribution lists 


.. _ar-init:

Replica Initialisation
----------------------

To replicate a mailbox to another Mailstore you can use the
:command:`setAccountDestination` command, which needs as parameters

* the destination Mailstore's FDQN  (e.g., *mailstore1.example.com*)
* the priority of the nodes. This information can be used in case the same
  account has been replicated more than once, to identify the first to
  be used. A lower value means a higher priority (e.g., a Replica with
  value *10* has a higher priority than Replicas with values *11*,
  *20*, or *100*)
* the account to replicate. Multiple accounts are also available,
  either comma separated on the command line or from an input file,
  with one account per line. In the remainder, we call this file
  :file:`/tmp/accounts`, which consists of two lines:
        
  | john.doe@example.com
  | jane.doe@example.com

Example of valid commands are:

.. code:: console
   
   zextras$ carbonio ha setAccountDestination mailstore1.example.com 10 accounts user1@customer.tld,user2@customer.tld 


.. code:: console

   zextras$ carbonio ha setAccountDestination mailstore1.example.com 10 input_file /tmp/accounts

The Global Administrator will receive a notification as soon as the
replica initialisation is completed.

.. _ar-monit:

Replica Monitoring
------------------

To monitor the status of a replica, you can use the
:command:`getAccountStatus` command and refine the output by providing
either of the following parameters:

* ``mailHost``, to verify the status of all the replicated
  accounts active in the *source mailstore*
  
* ``replicaServer``, to verify the status of all the accounts
  replicated on a *specific mailstore*
  
* ``accounts``, to limit the list to a (comma separated) subset of
  *accounts*
  
* ``domains``, to limit the list to all the replicated accounts of one
  ore more (comma separated) domains
  
* ``accountStatus``, to list only accounts with active or paused
  replica on the *source Mailstore*
  
* ``replicaStatus``, to list only accounts with available or
  unavailable replica on the *destination Mailstore*
  
Without any parameter, the command will show the status of all the
accounts configured for the Replica.  For each account, the output
reports:

.. code:: 
   
   accountId            eg. 9e94f5e0-8e0d-4f61-93aa-00747ac3dba6
   accountName          eg. user@demo.zextras.io
   accountMailHost      eg. mbox1.demo.zextras.io
   paused               true|false
   mailboxId            mailboxId of the local MariaDB
   sequence             value of sequence in the local MariaDB (on the source)
   itemId               value of highest itemId in the local MariaDB (on the source)

Then, for each replica:

.. code::
   
   replicas
   accountId         eg. 9e94f5e0-8e0d-4f61-93aa-00747ac3dba6
   itemId            value of highest itemId in the local MariaDB (on the replica)
   sequence          value of sequence in the local MariaDB (on the replica)
   mailboxId         mailboxId of the local MariaDB (on the replica)
   destination       address of the current mailstore that host the replica
   available         true|false
   priority          prority of the replica
   canConnectToKafka status of connection to kafka

.. _ar-promo:

Replica Promotion
-----------------

The architecture of Active Replica allows for a quick promotion of a
replica at any time. Indeed, since all the metadata are synchronously
replicated in the event queue and the blobs are stored in the
centralised volume, the Administrator can trigger the promotion even
if the source Mailstore is offline (e.g., the Mailstore is in
maintenance mode, there is a hardware failure o a network problem, and
so on).

To promote an account, Administrators can use the
:command:`promoteAccounts` command and refine the output by providing
either of the following parameters:

* ``accounts``, to promote one or more (comma separated)  accounts,
  using the first replica (lowest priority) 
* ``input_file``, to promote accounts for a file (one per line), using
  the first replica (lowest priority)
* ``source_mail_host``, to promote all the accounts hosted by a
  specific Mailstore

Example of valid commands are:

* Promote accounts

  .. code:: console

     zextras$ carbonio ha promoteAccounts accounts alice.doe@example.com,bob.doe@example.com

* Promote accounts stored in a file
  
  .. code:: console

     zextras$ carbonio ha promoteAccounts input_file /tmp/accounts

* Promote all accounts on a mailstore
  
   .. code:: console

      zextras$ carbonio ha promoteAccounts source_mail_host mbox1.example.com

Global Admin will receive a notification as soon as the replica promotion is completed.
   
.. _ar-del:

Replica Deletion
----------------

The Administrator can delete the replicated metadata anytime, using
the :command:`removeAccountDestination` command, by providing either
of the following parameters:

* ``destination``, to specify which is the Mailstore from where you
  want to delete the replica
* ``accounts``, also multiple (comma separated) accounts or an input
  file (with multiple accounts, one per line), to specify which
  account metadata must be deleted

