.. rubric:: Background

In previous |product| releases, ActiveSync could (in some cases and
with specific clients) create large amounts of **historical sync state
records** in the ``mail_item`` MySQL table. Over time, this caused:

* Large table sizes

* Slower queries and sync performance

* Excessive storage use

.. rubric:: Carbonio 25.9.0 improvements

Release 25.9.0 introduces features to optimize database growth and
maintenance:

#. **New manual index creation command**

   A new CLI command has been introduced:

   .. code:: console

      zextras$ carbonio mobile createStateIndex

   * Creates an index on the ActiveSync table (required for new
     cleanup logic)

   * Execution time depends on the current table size (can be long on
     large installations)

   * Needs to be executed only once per infrastructure

#. **New retention period parameter for** :command:`PurgeMobileState` **command**

   :command:`doPurgeMobileState` now supports a retention period
   parameter, allowing administrators to define the time window for
   keeping sync states.

   **Example:**

   .. code:: console

      zextras$ carbonio mobile doPurgeMobileState retention-period 90

   * Keeps sync states for a defined period (default: 90 days)

   * Deletes devices inactive beyond that window

#. **Automatic Space Recovery**

   At the end of each purge task, a ``VACUUM`` operation is now
   executed on the database to reclaim physical storage space.

#. **Improved Sync Cleanup Logic**

   During ActiveSync operations, old statuses are now automatically removed.
 
   This keeps the **status table smaller** and reduces long-term growth.

   .. important:: This improvement only works if a new database index
      is created.

.. rubric:: Admin Guidance

.. card:: Initialisation

   After upgrading to 25.9.0 or performing a new installation, to enable
   the improved cleanup logic, Administrators should run

   .. code:: console

      zextras$ carbonio mobile createStateIndex

   * On a **new installation with an empty database**, this task
     completes quickly

   * On an **already populated database** execution time can be
     significantly longer. For this reason, it is strongly recommended
     to run the command during a period of low system load.

   * If your infrastructure includes **multiple Mailstore &
     Provisioning** Nodes, the command must be executed **only once on
     a single Mailstore & Provisioning Node**

.. card:: Maintenance

   Regularly use :command:`doPurgeMobileState retention-period <days>`
   to keep sync states under control and storage usage optimised

   .. code:: console

      zextras$ carbonio mobile doPurgeMobileState retention-period <days>

   For automation, edit the crontab and configure it to run daily as the |zu|

   .. code:: console

      zextras$ zextras$ crontab -e

   Scroll to the very end of the file (after the comment ``ZEXTRAS-END
   -- DO NOT EDIT ANYTHING BETWEEN THIS LINE AND ZEXTRAS-START``) and
   add::

     45 23 * * * /opt/zextras/bin/carbonio mobile doPurgeMobileState > /dev/null 2>&1

   This task will clear the state table every day at 23:45 (11:45 PM).


   You can change the execution time by modifying the hour (**23**)
   and minute (**45**) values.  Also in this case if your
   infrastructure includes multiple **Mailstore & Provisioning**
   Nodes, the command must be scheduled **only on a single Mailstore &
   Provisioning Node**, not on every Node.
