.. todo in this file:

   * double check all info in sections Technical Information and
     Zextras Files Backup and HSM
   
   * verify all features on a final version of Carbonio

Carbonio Files provides a file storage system with ability to share
documents with colleagues, collaborative editing, and document
versioning.


Items in |File| have are organised in a folder structure, that can be
browsed using the Navigation Bar on top of the UI.

On top of the standard folder-based navigation, a
:bdg-primary-line:`Quick Access` menu is available on the left side of
the UI, which allows to quickly view the following types of items:

Preferred Items
   Items marked with the "Star" option available in the right-click
   context menu.

Recently Edited
   Items edited recently, sorted from the most recently edited.

Shared with me
   Items shared by other users.

Shared by me
   Items shared to other users

Marked for deletion
   Items marked for deletion

The most common tasks that can be carried out in Files are:

- Upload, download, manage, and browse files

- Create new folders to better organise files

  .. note:: The following files can not be used in folder’s name:
     slash ``/`` :octicon:`dash` backslash ``\`` :octicon:`dash`
     semicolon :octicon:`dash` ``:`` :octicon:`dash` question Mark
     ``?`` :octicon:`dash` plus sign ``+`` :octicon:`dash` asterisk
     ``*`` :octicon:`dash` percent sign ``%``
  
- Share files with internal and external users

.. what about support for carbonio docs?
   
  -  Integration with |carbonio| Docs


.. section to be rewritten with updated (carbonio's) screenshots
..
   .. figure:: /img/drive/ui.png
      :scale: 50%

      Overview of |File| UI

      .. csv-table::
         :widths: 10, 40

         "1", "Quick Access navigation panel"
         "2", "Folder navigation panel"
         "3", "InfoBox control"
         "4", "New, Upload and Search features"
         "5", "Folder list"
         "6", "File list"

.. review "search" and "create new" operations, because the new
   interface has a common search/create object functionality -- see
   :doc:`usage`

.. grid:: 1 2 2 4 
   :gutter: 3

   .. grid-item-card::
      :columns: 12 6 4 3

      Upload and Download
      ^^^^

      * To upload a file to |File|, either click the
        :bdg-primary-line:`Upload` button above the file list or drag and drop
        any number of files from your computer to the main |File|
        window.

      * To download a file from |File|, right-click on it and select
        :bdg-primary-line:`Download`:

      * Any file and folder in |File| can be renamed by right-clicking
        on it and selecting the :bdg-primary-line:`Rename` option in
        the context menu.

   .. grid-item-card::
      :columns: 12 6 4 3

      .. this must be reviewed in new UI

      Navigation
      ^^^^

      Items in |File| have are organised in a folder structure, that can be
      browsed using the Navigation Bar on top of the UI.

      On top of the standard folder-based navigation, a
      :bdg-primary-line:`Quick Access` menu is available on the left
      side of the UI, which allows to quickly view the following types
      of items:

      Preferred Items
         Items marked with the "Star" option available in the right-click
         context menu.

      Recently Edited
         Items edited recently, sorted from the most recently edited.

      Shared with me
         Items shared by other users.

      Shared by me
         Items shared to other users

      Marked for deletion
         Items marked for deletion

   .. grid-item-card::
      :columns: 12 6 4 3

      Folder Creation
      ^^^^

      To create a folder in |File|, click on the "New" button above the file
      list and select "Folder":

         Slash ``/`` :octicon:`dash` Backslash ``\`` :octicon:`dash`
         Semicolon :octicon:`dash` ``:`` :octicon:`dash` Question Mark ``?``
         :octicon:`dash` Plus sign ``+`` :octicon:`dash` Asterisk ``*``
         :octicon:`dash` Percent sign ``%``

   .. grid-item-card::
      :columns: 12 6 4 3

      .. review sharing options and functions

      Sharing
      ^^^^

      Files and folders can be shared independently. Sharing permissions can
      be chosen among three options: "View", "Edit" and "Edit and Share", the
      latter two options include the "View" right by default.

      To share a file or a folder, right-click on it and select
      :bdg-primary-line:`Edit Shares`.  After entering the email
      address of the destination user and selecting the sharing
      permissions, click the :bdg-primary-line:`+` button to add the share to the list:

      To edit or delete a share, simply click on the dropdown permission
      selector to change the sharing permissions of the file/folder or click
      the trash bin icon to delete the share.

      In |File|, sharing rights are inherited down the hierarchy, and it's
      not possible to share an item with a lower permission than its parent,
      e.g. if a folder is shared with "Edit" permissions it’s not possible
      to share one of its items with "View" rights with the same person.

   .. grid-item-card::
      :columns: 12 6 4 3

      Item Deletion
      ^^^^

      .. check how deletion works, then rewrite

      When deleted, |File| items are not put into the Trash like every other
      item type in Zimbra, as such items are marked for deletion instead. To
      mark a file or a folder for deletion, right-click on it and select "Mark
      for Deletion":

      Items marked for deletion are displayed on the bottom of the file list
      with a strikethrough line and can be deleted permanently clicking on the
      "Delete Permanently" entry within the right-click context menu of a file
      marked for deletion while the "Restore" entry will unmark the file:

      While any user with "Edit" or "Edit and Share" rights on an item or
      folder can mark it for deletion, only the original owner can delete it
      permanently.

      Items marked for deletion cannot be accessed, so should a user try to do
      so a pop-up message will ask whether to restore the item and access it
      or to stop the attempt and leave it as marked for deletion.

   .. grid-item-card::
      :columns: 12 6 4 3

      InfoBox
      ^^^^

      The InfoBox is a collapsible element that contains all information and
      controls for the selected file or folder, as well as a preview of the
      file itself if in a compatible format (pictures, PDFs and more).

      To display the Infobox, click the :octicon:`info` icon on the
      top-right of the |File| UI; the infobox will appear on the right
      side of the screen.

      The InfoBox contains various information:

      -  The name of the selected file

      -  The preview of the file (or a format icon for unsupported formats)

      -  All action items available in the right-click context menu

      -  Share information

      -  Creation and edit information

      -  A customizable "Description" field

   .. grid-item-card::
      :columns: 12 6 4 3

      File Versioning
      ^^^^

      File versioning keeps track of all the versions of files stored in
      |File| and allows end users to recover and download previous
      file versions.

      To access the versioning menu of a file, simply right-click the file and
      select "File Versions" from the drop down menu.

      The File Versioning Menu lists all stored versions of a file, sorted by
      date descending, and allows to open, download or permanently store each
      single version through the "options" button on the right side of every
      entry. On top of this, it is also allows to upload a new version or to
      purge all existing versions using the "Upload Version" and "Purge
      Versions" buttons at the bottom of the window.

      .. note:: Files can only be opened for editing if |carbonio| Docs is
         installed and the file type is supported.

      By default, |File| will save 20 versions for each file for up to
      90 days. This can be changed by setting the following properties
      at global, COS or account level:

      -  ``driveMaxVersionRetentionDays``: maximum retention time in days.
         Value between 0 (no time limit) and 365. Default 90.

      -  ``driveMaxVersionNumber``: maximum number of versions to store. When
         reached, any newer version will replace the oldest one as in a FIFO
         queue. Value 0 (no limit) or higher. Default 20.

      E.g.

      -  To set the maximum retention duration to 120 at global level, run
         ``zxsuite config global set attribute driveMaxVersionRetentionDays value 120``

      -  To set the maximum number of stored version to 5 for the
         user@example.com account, run
         ``zxsuite config account set user@example.com  attribute driveMaxVersionNumber value 5``

      -  To reset the maximum retention duration at global level, run
         ``zxsuite config global empty attribute driveMaxVersionRetentionDays``


..
   .. _files_technical_information:

   Technical information
   =====================

   .. verify all technical information!!

   .. _files_file_storage:

   File Storage
   ------------

   |File| features a detached folder hierarchy based on nodes. |File|
   metadata are stored in a dedicated HSQL Database while all files
   (including previous file versions and file previews) are stored in a
   dedicated folder within a volume’s root. File naming is now hash-based
   instead of id-based to achieve native deduplication, compression rules
   follow the volume’s settings.

   For example, a filesystem path for a briefcase file looks like::

     /opt/zimbra/store/0/[mID]/msg/0/[itemid]-[revision].msg

   while a filesystem path for a |File| file is::

     /opt/zimbra/store/drive/[hash]-[revision].[extension]

   .. _files_volumes:

   Volumes
   -------

   As of this release, |File| files are stored in the Current Primary volume
   as any other item.

   Integration with Zimbra Docs If the Zimbra Docs zimlet is correctly
   installed, dedicated document options will appear in the "New" button
   above the file list:

   .. image:: /img/drive/docsintegration.png

   When right-clicking on a compatible file, an "Open with Docs" option
   will also appear:

   .. image:: /img/drive/openwithdocs.png


   Furthermore, Zimbra Docs will also allow for previews of compatible
   document formats to be displayed in the InfoBox.

   .. _files_urls_and_ports:

   URLs and Ports
   --------------

   To build URLs and links (e.g. for External Shares) |File| uses
   the default Zimbra settings for the domain of the account in use - the
   ``zimbraPublicServiceHostname`` property is used for the URL itself
   while the ``zimbraPublicServicePort`` property is used for the port.

   Should any of the two not be set up, the system will always fall back to
   the ``zimbraServiceHostname`` and ``zimbraMailPort`` or
   ``zimbraMailSSLPort`` server-level properties.

   .. _files_backup_and_hsm:

   |File| Backup and HSM
   ============================

   .. _files_backup:

   Backup
   ------

   |File| files are included in Backup, and both the RealTime Scanner and
   the SmartScan are aware of those and no additional actions must be taken
   in order to ensure the files' safety.

   The Restore on New Account and External Restore modes will also restore
   |File| files, while other restore modes such as the Undelete Restore do
   not operate on such files.

   .. _files_hsm:

   HSM
   ---

   |File| can store its data on a different volume than the default Current
   Primary one, and HSM policies can move |File| files onto a different
   volume than the Current Secondary one, thus effectively allowing
   independent storage management for |File| files.

   When an HSM policy is applied, |File| files will be handled under the
   "document" item type.

   This setting is applied at the server level so that different mailbox
   servers can use different volumes.

   .. _files_setting_primary_volume:

   Setting the |File| Primary volume
   ---------------------------------

   To set the |File| Primary volume, first find out the volumeID of the
   target volume by running ``zxsuite hsm getAllVolumes``.

   Once the volumeID has been identified, simply run

   ::

      zxsuite config server set `zmhostname` attribute driveStore value [volumeID]

   (where [volumeID] is the ID found with the previous command)

   .. _files_setting_secondary_volume:

   Setting the Drive Secondary volume
   ----------------------------------

   To set the |File| Secondary volume, find out the volumeID of the target
   volume as described in the previous paragraph and then run the following
   command

   ::

      zxsuite config server set `zmhostname` attribute driveSecondaryStore value [volumeID]


..
   .. _drive_zextras_drive_cli:

   |File| CLI
   =================

   This section contains the index of all ``zxsuite drive`` commands. Full
   reference can be found in the dedicated
   section :ref:`zextras_drive_full_cli`.

   :ref:`doDeleteBriefcaseData <zxsuite_drive_doDeleteBriefcaseData>`
   :octicon:`dash` :ref:`doDeployDriveZimlet <zxsuite_drive_doDeployDriveZimlet>`
   :octicon:`dash` :ref:`doImportBriefcase <zxsuite_drive_doImportBriefcase>`
   :octicon:`dash` :ref:`doRestartService <zxsuite_drive_doRestartService>`
   :octicon:`dash` :ref:`doStartService <zxsuite_drive_doStartService>`
   :octicon:`dash` :ref:`doStopService <zxsuite_drive_doStopService>`
   :octicon:`dash` :ref:`dumpSessions <zxsuite_drive_dumpSessions>`
   :octicon:`dash` :ref:`getQuota <zxsuite_drive_getQuota>`
   :octicon:`dash` :ref:`getServices <zxsuite_drive_getServices>`
   :octicon:`dash` :ref:`monitor <zxsuite_drive_monitor>`

