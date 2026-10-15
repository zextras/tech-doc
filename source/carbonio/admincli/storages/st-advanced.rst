.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _pws_advanced_volume_operations:


Advanced Volume Operations
==========================

.. _pws_zextras_powerstore_more_than_meets_the_eye:

|storage|: More than Meets the Eye
----------------------------------

At first sight, |storage| seems to be strictly dedicated to
HSM. However, it also features some highly useful volume-related tools
that are not directly related to HSM.

Due to the implicit risks in volume management, these tools are only
available through the CLI.

.. _pws_volume_operations_at_a_glance:

Volume Operations at a Glance
-----------------------------

The following volume operations are available:

**doCheckBlobs**: Perform BLOB coherency checks on one or more volumes.

**doDeduplicate**: Start Item Deduplication on a volume.

**doVolumeToVolumeMove**: Move all items from one volume to another.

**getVolumeStats**: Display information about a volume’s size and number
of thereby contained items/blobs.

.. grid::
   :gutter: 3

   .. grid-item-card:: doCheckBlobs
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_doCheckBlobs.rst

      .. rubric:: Description and Tips

      The doCheckBlobs operation can be used to run BLOB coherency checks on
      volumes and mailboxes. This can be useful when experiencing issues
      related to broken or unviewable items, which are often caused because
      either |Carbonio| cannot find or access the BLOB file related to an item or
      there is an issue with the BLOB content itself.

      Specifically, the following checks are made:

      -  DB-to-BLOB coherency: For every Item entry in |Carbonio|’s DB, check
         whether the appropriate BLOB file exists.

      -  BLOB-to-DB coherency: For every BLOB file in a volume/mailbox, check
         whether the appropriate DB data exists.

      -  Filename coherency: Checks the coherency of each BLOB’s filename with
         its content (as BLOBs are named after their file’s SHA hash).

      -  Size coherency: For every BLOB file in a volume/mailbox, checks
         whether the BLOB file’s size is coherent with the expected size
         (stored in the DB).


   .. grid-item-card:: doDeduplicate
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_doDeduplicate.rst

   .. grid-item-card:: doVolumeToVolumeMove
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_doVolumeToVolumeMove.rst

      .. rubric:: **Description and Tips**

      This command can prove highly useful in all situations where you need to
      stop using a volume, such as:

      -  Decommissioning old hardware: If you want to get rid of an old disk
         in a physical server, create new volumes on other/newer disks and
         move your data there.

      -  Fixing *little mistakes*: If you accidentally create a new volume in
         the wrong place, move the data to another volume.

      -  Centralize volumes: Centralize and move volumes as you please, for
         example, if you redesigned your storage infrastructure or you are
         tidying up your |Carbonio| volumes.

      .. hint:: Starting from version 3.0.10, |storage| can also
         move "Index" volumes.

   .. grid-item-card:: getVolumeStats
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_getVolumeStats.rst

      .. rubric:: **Description and Tips**

      This command provides the following information about a volume:

      .. csv-table::
         :header: "Name","Description"
         :widths: 20, 80

         "id", "The ID of the volume"
         "name", "The Name of the volume"
         "path", "The Path of the volume"
         "compressed", "Compression enabled/disabled"
         "threshold", "Compression threshold (in bytes)"
         "lastMoveOutcome", "Exit status of the latest doMoveBlobs
         operation"
         "lastMoveTimestamp", "End timestamp of the latest doMoveBlobs
         operation"
         "lastMoveDuration", "Duration of the last doMoveBlobs operation"
         "lastItemMovedCount", "Number of items moved to the current
         secondary volume during the latest doMoveBlobs operation"
         "bytesSaved", "Total amount of disk space freed up thanks to
         deduplication and compression"
         "bytesSavedLast", "Amount of disk space freed up thanks to
         deduplication and compression during the latest doMoveBlobs
         operation"

The ``show_volume_size`` and ``show_blob_num`` options will add the
following data to the output:

.. csv-table::
   :header: "Option", "Name", "description"

   "show_volume_size", "totSize", "Total disk space used"
   "show_blob_num", "blobNumber", "Number of BLOB files"

   
.. index:: Move account

.. _mailboxmove:

Moving an Account Across Servers
================================

Moving an account from one server to another within the same |product|
infrastructure can be done using command :command:`carbonio powerstore
mailboxMove` from the CLI interface. The command will take care of
moving the account including everything associated to it: e-mails,
contacts, calendars, and Chats blobs.

The syntax of the command is

.. code:: console

   zextras$ carbonio powerstore mailboxMove *destination server* accounts *account name*

To move account ``alice@example.com`` to server ``srv-02.example.net``
including all its blobs, the command is

.. code:: console

   zextras$ carbonio powerstore mailboxMove srv-02.example.net accounts alice@example.com
