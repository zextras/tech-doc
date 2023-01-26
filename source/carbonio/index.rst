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

This is the documentation of |carbonio|, the full private e-mail and
collaboration platform.

The content is organised in four parts:

* Install: Information on |product|, installation and upgrade
  instructions, security tips
* Admin: Documentation for Administrators, management tasks, and some
  advanced usage for |mesh|
* Use: everyday's usage of |product|, including its use on the
  dedicated mobile Apps
* Develop: links to API reference

If you are looking for |ce|'s documentation, please refer to its
`dedicated page <../../carbonio-ce/html/index.html>`_.

.. grid:: 1 2 2 3
   :gutter: 3

   .. grid-item-card::
      :columns: 12 12 12 12
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
	 :maxdepth: 1
	 :caption: Release:

	 Release Notes <release-notes>
	 Full Changelog <changelog>



   .. grid-item-card::
      :columns: 12 6 6 4
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
	 :maxdepth: 2
	 :caption: Install:

	 general
	 architecture
	 installation
	 security

   .. grid-item-card::
      :columns: 12 6 6 4
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
	 :maxdepth: 1
	 :includehidden:
	 :caption: Admin:

	 adminpanel
	 administration
	 shell
	 backup
	 restorestrategies
	 advancedbackup
	 mobile
	 storages
	 videoserver
	 custom
	 mesh

   .. grid-item-card::
      :columns: 12 6 6 4
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
	 :maxdepth: 2
	 :caption: Use:

	 usage
	 mobileapps


   .. grid-item-card::
      :columns: 12 12 12 12
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
	 :maxdepth: 1
	 :caption: Develop:

	 api
