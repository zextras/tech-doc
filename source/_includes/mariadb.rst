.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

When the number of e-mails grows to large numbers, it is possible to
add an index to the MariaDB database that stores them, to speed up
some routine operation that run periodically on |product|.

Indeed, |backup|'s :ref:`coherency_check` and |storage|'s
:ref:`doCheckBlobs <pws_volume_operations_at_a_glance>` work by
verifying if the hash of the files matches the one stored in the
database and emit a warning if they differ, also providing the
capability to replace the correct one for the |backup|.

To prevent and minimise any data loss in case an issue arises, both
tasks operate on a subset of data and limit the number of items
changed by filtering the data by ``mailbox_id`` and ``locator`` of the
``mail_item`` table.

Therefore, these two operations may become database-intensive and
become very slow, to the point of slowing down the entire mailbox and
become evident to all users.

Starting from |carbonio| **23.1.0**, there is the possibility to add
an index to the ``locator`` field and therefore improving performance,
by using a script that is shipped with |carbonio|: simply execute it
and you are done. The steps to add index to locator are:


#. Become the ``zextras`` user

   .. code:: console

      # su - zextras

#. Go to the scripts directory

   .. code:: console

      zextras$ cd /opt/zextras/libexec/scripts
    
#. Execute the script:

   .. code:: console

      zextras$ perl -I. migrate20221110-AddIndexLocatorOnMailItem.pl

You are now done, from the MariaDB prompt you can check that the
``mail_item`` table now contains the new index.

.. code:: sql

   MariaDB> SHOW INDEXES FROM mail_item;

   +-----------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+
   | Table     | Non_unique | Key_name         | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type |
   +-----------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+
   | ...       |        ..  | ..               |           .. | ...          | .         |          .. |     .... | ...    | ...  | .....      |
   | mail_item |          1 | i_locator        |            2 | locator      | A         |           2 |      255 | NULL   | YES  | BTREE      |
   +-----------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+
