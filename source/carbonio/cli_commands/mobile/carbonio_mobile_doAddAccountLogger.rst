.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_doAddAccountLogger:

************************************
doAddAccountLogger
************************************

::

   carbonio mobile doAddAccountLogger _account_ _trace|debug|info|warn|err|crit_ _log_file_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name
     - 
     - 
   * - log_level (M)
     - Multiple choice
     - trace\|debug\|info\|warn\|err\|crit
     - 
   * - log_file (M)
     - Path
     - 
     - 
   * - window_size (O)
     - Integer
     - a value > 0
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile doAddAccountLogger john@example.com info /tmp/john_logger



Creates an info account logger for john's account to file /tmp/john_logger

.. rubric:: Usage example


::

   carbonio mobile doAddAccountLogger john@example.com info /tmp/john_logger window_size 1



Creates an info account logger for john's account to file /tmp/john_logger with window size set to 1.
