.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

This section of the |carbonio| Admin Panel allows administrators
to monitor background operations executed within the
|carbonio| infrastructure.

Operations are system tasks triggered by administrators or internal services,
such as configuration updates, maintenance actions, or scans. This panel
provides visibility into their execution status and historical outcomes.

The Operations interface is divided into three main views:

- **Running** – Operations currently in progress
- **Queued** – Operations waiting to be executed
- **Done** – Completed operations, both successful and failed

Operations List
---------------

Each view displays a table containing the operations relevant to its state.
The following columns are shown in all three panels:

- **Server**  
  The server on which the operation is being executed.

- **Operation**  
  The type or name of the operation being performed.  
  Examples: ``clean``, ``SmartScan``, ``ZxConfig``.

- **Status**  
  The execution result of the operation:
  
  - A **check mark (✓)** indicates that the operation completed successfully.
  - A **cross (✗)** indicates that the operation failed.

- **Author**  
  The user or service that initiated the operation.  
  Example: ``zextras@example.com``.

- **Submit date**  
  The date and time when the operation was submitted.

- **Start date**  
  The date and time when the operation execution started.

Operation Details Panel
-----------------------

Clicking on any operation in the table opens a **right-side details panel**
that provides additional information about the selected operation.

The panel is divided into two sections: **Details** and **Other**.

Details
~~~~~~~

The **Details** section displays the core information related to the operation:

- **Operation Type**  
  The internal type of the operation.  

- **Who started it?**  
  The user or service that initiated the operation.

- **Status**  
  The current or final state of the operation.  

- **Submitted at**  
  The date and time when the operation was submitted.

- **Started at**  
  The date and time when the operation execution started.

Other
~~~~~

The **Other** section shows additional flags and operational parameters:

- **Notifications**  
  Indicates whether notifications are associated with the operation.

- **Create Fake Blob**  
  Indicates whether a fake blob was created during the operation.  

- **Deep**  
  Indicates whether the operation was executed in deep mode.  

Copy Operation Details
~~~~~~~~~~~~~~~~~~~~~~

In the upper-right corner of the Operation Details panel, a **COPY** button is
available.

Clicking this button copies all the operation details to the clipboard in
plain text format. This is useful when sharing operation data in support
tickets, logs, or internal documentation.

Example of copied content:

.. code-block:: text

   Operation Type : ZxBackup 
   Who started it? : zextras@example.com
   Status : Finished 
   Submitted at:  12/1/2025 - 06:01 PM 
   Started at : 01/12/2025 17:01:27 
   Notifications : 2 
   Create Fake Blob : True 
   Deep : True 
