.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. Zextras Carbonio documentation master file, created by
   sphinx-quickstart on Thu Aug 26 11:06:34 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

********************************
 Welcome to |ce| Documentation!
********************************

This is the documentation of |ce| edition, a free and open-source
collaboration software.

The content is organised in four parts:

* Install: Information on |product|, installation and upgrade
  instructions, security tips
* Admin: Documentation for management tasks and some
  advanced usage for |mesh|
* Use: everyday's usage of |product|, including its use on the
  dedicated mobile Apps
* Develop: links to API reference 

If you are looking for |carbonio|'s documentation, please refer to its
`dedicated page <../../carbonio/html/index.html>`_.

.. grid:: 1 2 2 3
   :gutter: 2


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
         upgrade
         security

   .. grid-item-card::
      :columns: 12 6 6 4
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2
         :includehidden:
         :caption: Admin:

         adminpanel
         management
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
