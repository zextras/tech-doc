.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _pws_hsm:

Hierarchical Storage Management
===============================

The HSM feature requires a separate license (called **Storages HSM**
in the |adminui|\' s *Subscriptions* section), therefore it may not be
available on your |carbonio| installation.

:term:`HSM` is a data storage technique that moves data between
different stores according to a defined policy.

The most common use of the HSM technique is the move of *old* data
from a *faster-but-expensive* storage device (the :term:`Primary
Volume`) to a *slower-but-cheaper* one (the :term:`Secondary Volume`)
based on the following premises:

- Fast storage is more expensive than slow storage
   
- *Old* data are on average much less frequently accessed than *new*
  data

Therefore, storing old data on slower storage devices is acceptable,
as users can afford to wait more time to retrieve a (very) old item
(e.g., a mail or a document stored in Files), while they want that
recent items be always available quickly. The advantages of HSM are
clear: on the one side, lowering the overall storage cost since only a
small part of your data needs to be on costly storage, and on the
other side improving the overall user experience.

.. _pws-policies:

Defining Policies
-----------------

An HSM policy is a string that describes what should be moved, for
example::

  all:before:-20days

When this policy is applied, all the messages arrived **before** 20
day ago are moved: if today is March 21st, this means all items whose
date is before March 1st will be moved.


A policy can consist of a single rule that is valid for all item types
(*Simple* policy) or multiple rules valid for one or more item types
(*Composite* policy).

.. rubric:: Accounts and Domains
            
Contrary to the policies that can be defined in the |adminui| (see
section :ref:`create-hsm-policy`), from the CLI you can create a policy that is
applied only on given accounts or domain, for example the policy::

  all:before:-10days domain:example.com

will move all items older than *10* days that are in the domain
*example.com*; policy::

  all:before:-30days account:john.doe@example.com

will move all items older than *30* days that belong to the account
*john.doe@example.com*.

.. rubric:: Source and Destination Volumes

It is possible to choose the source volume(s) and the destination
volume for a policy. By default, if neither of them is specified in a
policy, items are moved from the Primary Volume to the Current
Secondary Volume.  

.. note:: In a policy can appear multiple comma-separated Source Volumes but
   only **one** Destination Volume.

If you define only Source Volume(s), the items will be moved to the
*Current Secondary Volume*, while if you specify only the Destination
Volume, all the items from the **Primary Volume. In the policy you
need to used the **ID** of the volume, that you can retrieve using
command :command:`carbonio powerstore getallvolumes`. Here are some
examples::

  all:before:-10 source:1,2 destination:3
  
All items older than **10 days** from **Volumes 1 and 2** will be moved to
**Volume 3**.

::

  all:before:-10 source:1
  
All items older than **10 days** from **Volume 1** will be moved to
the **Current Secondary Volume**, regardless of its id.

::

  all:before:-10 destination:3
  
All items older than **10 days** from the **Primary Volume** will be
moved to **Volume 3**.

.. _pws-manage-policy:
   
Policies Management
-------------------

|carbonio| defines three CLI commands for the management of policies:

#. :command:`carbonio powerstore getHsmPolicy`

   This command takes no parameter and lists all the policies defined.

#. :command:`carbonio powerstore setHsmPolicy`

   This command takes one parameter, which is the string containing
   the policy and **replaces** the new policies to **all the
   existent** policies, so use it with care!

#. :command:`carbonio powerstore +setHsmPolicy`

   This command takes one parameter, which is the string containing
   the policy and **adds it** after all the other existent policies,
   if any.

The policies are evaluated in the order in which they are
displayed. For example, suppose you have one Primary Volume (with id
**1**), two Destination Volumes (with id **3** and **5**), and a few
domains, one of which with high traffic (**example.com**). If you
define the following policies::

  all:before:-10days domain:example.com destination:3
  all:before:-30days destination:5

The result is that all items older that 10 days from the high-traffic
domain will be moved to Destination Volume 3, and all the other items
older than 30 will be moved to the other Destination Volume, 5.

.. _pws-run-policy:

Running Policies
----------------

From the CLI, you can manually run the policies using command
:command:`doMoveBlobs`.

.. hint:: Policies can be scheduled to run periodically from the
   |adminui|, see :ref:`ap-hsm-settings`.

Once the move is started, the following operations are performed:

- |storage| scans through the Primary Volume to see which items comply
  with the defined policy

- All the Blobs of the items found in the first step are copied to the
  Secondary Volume

- The database entries related to the copied items are updated to
  reflect the move

- If the second and the third steps are completed successfully (and
  only in this case), the old Blobs are deleted from the Primary
  Volume

The Move operation is *stateful* - each step is executed only if the
previous step has been completed successfully - so there is no risk of
data loss during a :command:`doMoveBlobs` operation. The syntax of the
command is

.. code:: console

   zextras$ carbonio powerstore doMoveBlobs start

Optionally, you can add a policy on the command line to run it only
once, for example


..
   .. _pws_policy_order:

   Policy Order
   ^^^^^^^^^^^^

   All conditions for a policy are executed in the exact order they are
   specified. |storage| will loop on all items in the Current
   Primary Store and apply each separate condition before starting the next
   one.

   This means that the following policies

   ::

      message,document:before:-20day
      message:before:-10day has:attachment

   ::

      message:before:-10day has:attachment
      message,document:before:-20day

   applied daily on a sample server that sends/receives a total of 1000
   emails per day, 100 of which contain one or more attachments, will have
   the same final result. However, the execution time of the second policy
   will probably be slightly higher (or much higher, depending on the
   number and size of the emails on the server).

   This is because in the first policy, the first condition
   (``message,document:before:-20day``) will loop on all items and move
   many of them to the Current Secondary Store, leaving fewer items for
   the second condition to loop on.

   Likewise, having the ``message:before:-10day has:attachment`` as the
   first condition will leave more items for the second condition to loop
   on.

   This is just an example and does not apply to all cases, but gives an
   idea of the need to carefully plan your HSM policy.

