.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Carbonio Files provides a file storage system with ability for sharing
documents with colleagues, collaborative editing, and document
versioning.

Items saved in |file| are shown in the central area and are organised
in a folder structure, which initially contain a number of pre-defined
shortcut as icons: *Home*, *Shared with me*, *Trash*, *Filters*, and
*Uploads*. Files can be arranged in folders under *Home*; a list of
recent files and folders accessed by the user is also available, to
allow to quickly resume work on these documents.

At the bottom of the leftmost column you see the used quota, i.e. the
total sum of the files you create or upload to |file|. The quota is
updated with a little delay after a file is added or deleted, but you
can force an update by clicking the icon on the right-hand side of the
quota.

Working with Files
------------------

The following panels summarise the most common activities that can be
done on files and folders

.. card:: File Upload and Download

   * To upload a file to |File|, either click the
     :bdg-primary-line:`Upload` button on the top bar, or drag and
     drop a file from a file browser to |file|

   * To download a file from |File|, right-click on it and select
     :bdg-primary-line:`Download`

   While uploading new files, a badge shows the completed and total
   number of documents being uploaded.

.. card:: Create new Folder and Files

   To create a new item in |File|, use the right mouse button in the
   file list (central area) to create new folders, documents,
   spreadsheets, or presentations.

   .. note:: The following characters can not be used in folder’s
      name: Slash ``/`` :octicon:`dash` Backslash ``\``
      :octicon:`dash` Semicolon ``:`` :octicon:`dash` Question Mark
      ``?`` :octicon:`dash` Plus sign ``+`` :octicon:`dash` Asterisk
      ``*`` :octicon:`dash` Percent sign ``%``

.. card:: Sharing

   When clicking once on a file or folder, an informative box appears on
   the right-hand side, which contains multiple tabs:

   Details
      Shows a (partial) preview of the file, if the file belongs to a
      recognised type. There are also a number of metadata visible and
      a description of the file or folder can be added at the bottom.

   Sharing
      Lists the owner of the files or folders and who has access to
      it. It is possible to allow access to internal collaborators or
      external user, with different modalities.

      * Internal collaborators: you can add a a collaborator to a
        single file or an entire directory by writing the e-mail
        address, then click the :bdg-primary:`SHARE`
        button. Otherwise, in the *Collaboration Links* section click
        :bdg-primary-line:`GENERATE LINK` to create a link that will
        allow anyone with the link to give either *Read and Share* or
        *Write and Share* permission on the file

      * External users. It is possible to share single files or
        folders with external, anonymous users. In the bottom *Public
        Links* section use the :bdg-primary-line:`ADD LINK` button to
        generate a link to allow access to everyone.  Optionally, add
        a description and expiration date (defaults to the end of the
        current day) to the link, then click
        :bdg-primary-line:`GENERATE LINK`. Anyone who receives this
        link will be able to download the file or to browse the
        directory until the link expires or is revoked.

        In case of a shared directory, any change in it (e.g., a new
        file or subfolder has been added or removed) will be
        automatically reflected in the link. Moreover, being a public
        link, files can be individually downloaded, but a bulk
        download of the whole content is not possible.

      The :bdg-primary:`SHARE` button is clickable for internal
      collaborators and only if the e-mail address is correct.

      .. hint:: Sharing a folder implies that permissions are inherited
         by the whole hierarchy underneath, so all files and directories
         contained there will have the same access permissions.

      Sharing with external users is limited to files only: no
      directory can be shared. To allow an external user to access a
      file, 

   Versioning (files only)
      The history of each file is preserved in case the file is edited or
      a new version is uploaded. Manual removal of unused or deprecated
      versions of a file is possible.

      By default, *five* version can be stored for each file.  Editing
      a file that has reached this limit is prevented, with an error
      message informing of the reached limit.  This limit can be
      customised and even removed, by configuring it to **-1**.
