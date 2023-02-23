.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out with
by means of a few commands, which are the same for **Single-Server**
and **Multi-Server** installations.

Depending on the packages upgraded, some manual step may be
required. Please read carefully section :ref:`upgrade-checklist`
**before starting the upgrade**, to see if you need some additional
effort.

Moreover, incompatibilities may arise in case the upgrade includes
third-party software, which may lead to some additional manual steps
to be carried out. Section :ref:`upgrade-troubleshooting` below
contains information to prevent or fix these issues.

.. _upgrade-checklist:

Upgrade checklist
-----------------

We define as **current version** |version|, as **previous version**
the version immediately before, i.e., |prev|, and as **older
versions** any version of |product| released before these two.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Upgrade from |prev| to |version|
      :columns: 12 12 6 6

      In order to update to version |version| from the previous one,
      the general rule is to follow the :ref:`Single-Server
      <upgrade-single>` or :ref:`Multi-Server <upgrade-multi>` Upgrade
      procedures.

      This upgrade impacts the following *Roles*, therefore which
      require some manual CLI command to be run.
      
      :octicon:`check-circle;1em;sd-text-success` the **Directory
      Server**, therefore it is necessary to integrate the procedure
      with the steps described in Section :ref:`upgrade-ds`.

   .. grid-item-card:: Upgrade from older versions to |version|
      :columns: 12 12 6 6

      It is possible to upgrade from an **older version** to the
      current one, although we suggest to upgrade whenever a new
      version is available. However, this type of upgrade may not be
      as easy as a routine upgrade and you may need to manually
      execute CLI commands whenever you find yourself in one of the
      following situations.

      In case of Multi-Server installation, make sure you are on the
      correct node before running the commands.

      :octicon:`check-circle;1em;sd-text-success` If the list of
      updates includes the **Directory Server**, i.e., package
      ``carbonio-directory-server``, follow the procedure described
      in :ref:`upgrade-ds`.

      :octicon:`check-circle;1em;sd-text-success` In case any ``-db``
      package is in the upgrade list, execute the steps in
      :ref:`bootstrap-db`.

      :octicon:`check-circle;1em;sd-text-success` If the upgrade of
      **Docs Editor** ends with errors, check section
      :ref:`upgrade-docs-editor`.

      :octicon:`check-circle;1em;sd-text-success` If you are running a
      version up to **22.9.0**, make sure to install the
      :ref:`adminpanel-packages` along with the other upgrades.
