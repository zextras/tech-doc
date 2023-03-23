.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

We define as **current version** |version|, as **previous version**
the version immediately before, i.e., |prev|, and as **older
versions** any version of |product| released before these two.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Upgrade from |prev| to |version|
      :columns: 12 12 6 6

      This upgrade impacts the following *Roles*, which require some
      manual CLI commands to be run.

      :octicon:`check-circle;1em;sd-text-success` the |vs|, so please
      follow the directions that you find in Section
      :ref:`upgrade-vs` when upgrading the Node featuring the |vs|.
      
      :octicon:`check-circle;1em;sd-text-success` the Space
      functionality in |team| is now disabled by default, so please
      follow the directions that you find in Section
      :ref:`chat-space-enable` when upgrading the Node featuring the
      |vs|.

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

      :octicon:`check-circle;1em;sd-text-success` the |vs|, so please
      follow the directions that you find in Section
      :ref:`upgrade-vs` when upgrading the Node featuring the |vs|.

      :octicon:`check-circle;1em;sd-text-success` In case any ``-db``
      package is in the upgrade list, execute the steps in
      :ref:`bootstrap-db`.

      :octicon:`check-circle;1em;sd-text-success` If the upgrade of
      **Docs Editor** ends with errors, check section
      :ref:`upgrade-docs-editor`.

      :octicon:`check-circle;1em;sd-text-success` If you are running a
      version up to **22.9.0**, make sure to install the
      :ref:`adminpanel-packages` along with the other upgrades.
