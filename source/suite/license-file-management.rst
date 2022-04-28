.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

=========================
 License File Management
=========================

The following rules are the foundation of the licensing system.

- Zextras Suite comes as a whole package, whose features are enabled
  or disabled based on the license file.

- Only one license file can be active at any time.

- License files are not "cumulative" - when a new license file is
  installed it will replace the previous one.

.. _how_to_install_a_license_file:

How to install a License File
=============================

To install a License File, download the appropriate license.zx file from
your customer corner and:

-  Log into the Administration Console in Zimbra with an admin account.

-  In the Left Pane of the Administration Console select Core (under the
   Zextras Suite category) to show up the Zextras Core tab.

-  Click the :bdg:`Browse` button in the Upload License section and select
   the license.zx file you downloaded.

-  Click :bdg:`Save`.

If the license file is valid your License Status should change to
**Valid** and your License Type to **Purchased**. All the other data
should change accordingly.

.. warning:: In some cases, after a license has been activated license
   information might not be properly shown: this is usually caused by
   Zimbra’s DOS Filter, and raising the number of allowed connections
   per second to 150 should solve the issue.

.. _cli_installation:

CLI installation
----------------

If you are experiencing difficulties in uploading your license, you can
try to do it using the Zextras CLI. Simply upload your license file to
the /tmp/ folder of your Zimbra server and run the following as the
`zimbra` user::

   zxsuite core doUploadLicense /tmp/license.zx

.. _license_upgrades:

License Upgrades
================

Whenever a license is upgraded, a new license file will be created: that
file must be installed as described above as soon as possible as the
upgrade markes the previous license file as 'Upgraded' and will
invalidate it after 7 days since the upgrade.

.. warning:: Make sure to install the new license file within 7 days
   to avoid service outages.

.. _license_warning_recipient:

License Warning recipient
=========================

Since it’s highly probable that the person in charge of license
management is not the same as the one in charge of the server’s actual
management (and vice versa), Zextras Suite allows the admin to specify
one or more additional email addresses which will only receive
license-related notifications and warning.

In order to do so, enter the desired addresses as a comma-separated list
in the *Additional License Warning Emails* field in the Notifications
section of the Core tab in the Zextras Administration Zimlet.

.. _module_activation_and_initialization:

Module Activation and Initialization
====================================

Once your Zextras Suite License is installed, all acquired modules are
automatically activated.

Each module, however, might require a dedicated initialization in order
to be fully functional.

.. grid::
   :gutter: 2

   .. grid-item-card::
      :columns: 6

      Backup Initialization
      ^^^^^

      To properly function, Zextras Backup needs a dedicated directory on a
      filesystem to save all it’s configurations and all the backupped data.

      The default path for this directory is
      :file:`/opt/zimbra/backup/zextras/`.

      The inizialization process automatically creates the folder structure
      and the configuration files needed.

   .. grid-item-card::
      :columns: 6

      Powerstore Initialization
      ^^^^^

      A default HSM Policy is configured in Zimbra. This policy will move all
      emails and documents older than 30 days to the Current Secondary Store.

      However, there is no Current Secondary Store created by default in
      Zimbra. This means that in order to start using the Zextras Powerstore
      module you will at least need to:

      -  Create a new Volume, which will be your Current Secondary Store.

      -  Enable the Policy Application Scheduling.

   .. grid-item-card::
      :columns: 6

      Mobile Initialization
      ^^^^^

      No initialization needed, by default ZxMobile is active and its features
      are available to all of your users out-of-the-box.

   .. grid-item-card::
      :columns: 6

      Admin Initialization
      ^^^^^

      No initialization needed.

.. _how_to_remove_a_license:

How to remove a License
=======================

To remove a license and revert back to trial mode, just remove the
:file:`/opt/zimbra/conf/zextras/[license_name].zx` file while all the Zimbra
services are down. Mind that if you revert back to trial mode, the trial
timer will not be restarted (so if you installed Zextras Suite more than
30 days before the license removal your backup system will be shut of
because of the trial expriation).
