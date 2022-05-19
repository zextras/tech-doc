.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Files provides a file storage system with ability for sharing
documents with colleagues, collaborative editing, and document
versioning.

Items in |file| are shown in the central area of |file| and are
organised in a folder structure, which initially contain a number of
pre-defined shortcut as icons: *Home*, *Shared with me*, *Trash*,
*Filters*, and *Uploads*. Files can be arranged in folders under
*Home*.


Working with files
------------------

The following panels summarise the most common activities that can be
done on files and folders

.. card::

   File Upload and Download
   ^^^^

   * To upload a file to |File|, either click the
     :bdg-primary-line:`Upload` button on the top bar.

   * To download a file from |File|, right-click on it and select
     :bdg-primary-line:`Download`:


.. card::

   Create new Folder and Files
   ^^^^

   To create a new item in |File|, use the right mouse button in the
   file list (central area) to create new folders, documents,
   spreadsheets, or presentations.

   .. note:: The following characters can not be used in folder’s
      name: Slash ``/`` :octicon:`dash` Backslash ``\``
      :octicon:`dash` Semicolon ``:`` :octicon:`dash` Question Mark
      ``?`` :octicon:`dash` Plus sign ``+`` :octicon:`dash` Asterisk
      ``*`` :octicon:`dash` Percent sign ``%``

.. card::

   Sharing
   ^^^^

   When clicking once on a file or folder, an informative box appears on
   the right-hand side, which contains multiple tabs:

   Details
      Shows a (partial) preview of the file, if the file belongs to a
      recognised type. There are also a number of metadata visible; a
      description of the file or folder can be added at the bottom.

   Sharing
      Lists the owner of the file or folder and who has access to it. Add
      a collaborator by writing its e-mail address, then click
      :bdg-primary:`SHARE` or use the :bdg-primary-line:`ADD LINK` button
      to generate a link to allow access to everyone.  Optionally, add a
      description and expiration date (defaults to the end of the current
      day) to the link.

      The :bdg-primary:`SHARE` button is clickable only for internal
      collaborators and only if the e-mail address is correct.

      .. hint:: Sharing a folder implies that permissions are inherited
         by the whole hierarchy underneath, so all files and directories
         contained there will have the same access permissions.

   Versioning (files only)
      The history of each file is preserved in case the file is edited or
      a new version is uploaded. Manual removal of unused or deprecated
      versions of a file is possible.

..
   .. _carbonio_files_cli:

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
