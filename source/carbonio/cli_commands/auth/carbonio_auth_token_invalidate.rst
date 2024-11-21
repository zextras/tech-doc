.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_token_invalidate:

********************
invalidate
********************

::

   carbonio auth token invalidate _user@example.com|uuid_ _uuid|all_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 18 15 28 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - user@example.com\|uuid
     - 
   * - token_id (M)
     - String
     - uuid\|all
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth token invalidate user@example.com 49561162-d3fa-452f-aef0-d5fd2875695d



