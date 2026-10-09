.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_s3connector_get:

***************
s3connector get
***************

Get the connection to an S3 compatible connector.

.. rubric:: Syntax

::

   carbonio powerstore s3Connector get {id of Connector} 

.. rubric:: Parameter List

.. list-table::
   :widths: 22 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - NAME
     - TYPE
     - EXPECTED VALUES
     - 
   * - uuid(M)
     - String
     - id of Connector
     - 
   * - carbonio
     - powerstore
     - s3Connector get c6d71d55-9497-44e6-bf46-046d5598d940
     - 

::

   (M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage example

::

   carbonio powerstore s3Connector get c6d71d55-9497-44e6-bf46-046d5598d940

