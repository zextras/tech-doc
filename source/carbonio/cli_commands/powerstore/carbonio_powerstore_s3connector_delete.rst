.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_s3connector_delete:

******************
s3connector delete
******************

Delete a S3 connector configuration

.. rubric:: Syntax

::

   carbonio powerstore s3Connector delete {id of Connector} [attr1 value1 [attr2 value2...]]

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
   * - iAmSure(O)
     - Boolean
     - for sure
     - 
   * - carbonio
     - powerstore
     - s3Connector delete <connector_id> iamsure true
     - 

::

   (M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage example

::

   carbonio powerstore s3Connector delete <connector_id> iamsure true

