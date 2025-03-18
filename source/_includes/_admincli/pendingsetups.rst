This section describes the functionalities provided by
:command:`pending-setups` in |product| and explains when it is
necessary to run or re-run it for its proper functioning.

Overview
~~~~~~~~

In a nutshell, :command:`pending-setups` in |product| manages
**post-installation** and **configuration tasks** that are required to
finalise |product|\'s setup and to ensure that the services run
correctly.

:command:`pending-setups` is a wrapper around a collection of scripts,
provided by other packages and placed in the
:file:`/etc/zextras/pending-setups.d/` directory.

When invoked, :command:`pending-setups` carries out these task:

* Set up of **authentication** and **security policies** using
  :command:`service-discover`

* Securely **store** and **manage** credentials

* **Configure services** to ensures all |product| components (e.g.,
  Mail, Authentication, Video Server) are properly configured

* **Reload services** to apply changes

When a script is successfully executed, it is moved to the
:file:`/etc/zextras/pending-setups.d/done` directory.

.. _pset-run:

Running :command:`pending-setups`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. hint:: All commands shown in this section must be executed as the
   |ru|.

Before executing the command, make sure that you retrieve the cluster
credential password, which is stored in file
:file:`/var/lib/service-discover/password`.

:command:`pending-setups` can be invoked with the ``-a`` option: in
this case, it simply reads all the scripts in the
:file:`/etc/zextras/pending-setups.d/` directory and executes them,
with the output showing the tasks it carries out.

Invoked with no options, it enters an interactive mode, showing a menu
similar to::
  
  You have 6 pending setups to run
  0) carbonio-catalog.sh
  1) carbonio-tasks.sh
  2) carbonio-user-management.sh
  3) carbonio-tasks-db-setup.sh
  4) carbonio-files.sh
  5) carbonio-files-db-setup.sh

  a) execute all
  q) quit

  Please input your selection:
  > 

The initial list shows all the scripts that must be executed: enter
the number corresponding to the script to launch it or chose either
:kbd:`a` to execute them all, or :kbd:`q` to exit. In the latter case,
however, it will not be possible to use |product| successfully, as it
would miss a number of configurations.

If all scripts have been executed, the command will output::

  There are no pending-setups to run. Exiting!

.. _pset-why:

Why Running :command:`pending-setups` Again
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are a number of situations when you need to run
:command:`pending-setups` again. In some of the following cases, the
script might have not been executed successfully, but nonetheless they
are moved under the :file:`/etc/zextras/pending-setups.d/done`, so
simply invoking :command:`pending-setups` again will not suffice.

After a failed setup or partial installation
   If the initial pending-setups process fails or gets interrupted
   (e.g., due to a system crash, missing dependencies, or
   misconfigured services)

After manually fixing a configuration issue
   If you manually adjust configuration files, services, or permissions

After upgrading |product|
   If an update doesn't fully apply

After restoring from a backup or migrating to a new server
   If you restore a |product| system from a backup or migrate it to a
   new server, some configurations might need to be re-applied to
   match the new environment

When adding a new |product| Role
   If you install a new |Product| Role (e.g., Files, Chats), running
   :command:`pending-setups` ensures that the new component is
   properly integrated into the system

Debugging and troubleshooting
   If a service is misbehaving or showing unexpected errors,
   re-running pending-setups can sometimes reapply missing
   configurations and fix the issue

.. _pset-rerun:

How to Run :command:`pending-setups` Again
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two options to execute a failed script.

.. card:: Option 1: Move the Script Back and Re-run pending-setups

   The first one proves useful if you realise that multiple script
   have failed, or believe they have failed. In this case, the
   procedure is:

   #. Copy the script from :file:`/etc/zextras/pending-setups.d/done`
      back to the main directory

      .. code:: console

         # cp /etc/zextras/pending-setups.d/done/<script-name>.sh \
         /etc/zextras/pending-setups.d/

      Replace ``<script-name>.sh`` with the actual script name.
      
   #. Run the command
      
      .. code:: console

         # pending-setups -a


   #. The script will be executed again as part of the pending setups
      process, like described in Section :ref:`pset-run` above

.. card:: Option 2: Manually Execute the Script

    If you have only one script to execute, youcan run the script manually.

    #. Navigate to the  :file:`/etc/zextras/pending-setups.d/done` directory
      
      .. code:: console

         # cd /etc/zextras/pending-setups.d/done

    #. Execute the script directly. For example, to execute :command:`carbonio-videoserver.sh`
      
      .. code:: console

         # bash carbonio-videoserver.sh

    #. The script will immediately be executed
