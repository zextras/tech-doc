.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

=========
|storage|
=========

.. _pws_introduction:

Introduction
============

Carbonio Storage provides tools to manage the storage of Carbonio data across local volumes and supported third-party storage services, including S3-compatible object storage.


#. :ref:`manage-bucket` allows administrators to configure and manage storage buckets whose information can be reused when creating volumes. This simplifies the configuration of remote storage and provides a centralized way to manage bucket definitions.

#. :ref:`pws_volumes` allows administrators to organize data across primary and secondary volumes, configure storage properties, and move data between volumes. For deployments using S3-compatible object storage, volumes can also be configured to use centralized storage shared by multiple Mailstore & Provisioning nodes.

#. :ref:`pws_hsm` is also supported, which moves items between volumes according to defined policies. This allows administrators to optimize storage usage by placing data on different storage tiers according to their requirements.

#. :ref:`pws_advanced_volume_operations` this section describes CLI operations for checking BLOB consistency, deduplicating items, moving data between volumes, and retrieving volume statistics. It also explains how to move an account and its associated data between Mailstore servers.

.. toctree::
   :hidden:

   storages/st-bucket
   storages/st-volumes
   storages/st-hsm
   storages/st-advanced
