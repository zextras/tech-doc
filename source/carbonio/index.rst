.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. Zextras Carbonio documentation master file, created by
   sphinx-quickstart on Thu Aug 26 11:06:34 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

********************************************
 Welcome to |carbonio| Documentation!
********************************************

This is the documentation of |carbonio|, the fully private digital
workplace.

The content is organised in four parts:

* Release. List of issues fixed in the current release of |product|
  and directions to carry out the upgrade
* Install. Information on |product| and its architecture, installation
  and upgrade instructions, security tips
* Admin by GUI. |product| administration using the |adminui|
* Admin by CLI. Administration of |product| from the command line:
  management tasks and some advanced usage for |mesh|
* Use. Everyday's usage of |product|, including its use on the
  dedicated mobile Apps
* Develop. Links to API reference

If you are looking for |ce|'s documentation, please refer to its
`dedicated page <../../carbonio-ce/html/index.html>`_.

.. grid:: 1 2 2 3
   :gutter: 3

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 1
         :caption: Release:

         changelog-23.7.0
         upgrade
         older-changelogs

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2
         :caption: Install:

         general
         architecture
         installation
         common/carbonio/web-access
         security
         migration

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2
         :includehidden:
         :caption: Admin by GUI:

         /adminpanel/introduction
         /adminpanel/whitelabelling
         /adminpanel/domains
         /adminpanel/cos
         /adminpanel/storage
         /adminpanel/subscriptions
         /adminpanel/privacy
         /adminpanel/backup
         /adminpanel/notifications
         /adminpanel/operations
	 /adminpanel/mta



   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2
         :includehidden:
         :caption: Admin by CLI:

         shell
         administration
         backup
         restorestrategies
         advancedbackup
         mobile
         storages
         videoserver
         custom
         mesh

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2
         :caption: Use:

         usage
         mobileapps


   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 1
         :caption: Develop:

         api
