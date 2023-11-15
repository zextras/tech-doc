.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

..
   We define as **current version** |version|, as **previous version**
   the version immediately before, i.e., |prev|, and as **older
   versions** any version of |product| released before these two.

.. warning:: Starting with version **23.6**, the Single-Server
   installation of |product| is **not supported** anymore. If you have
   a Single-Server Installation, you must add a few Nodes to your
   installation and redistribute the Roles on them, to ensure you
   continue to productively use |product|.

This upgrade impacts the following *Roles* or packages, which require some
manual interaction during the procedure.

:octicon:`check-circle;1em;sd-text-success` the |vs|. To prevent any
downtime in the services, during the upgrade you must choose to keep
the old version of the configuration file: to do so, click :kbd:`N`
when asked to replace the configuration file.

:octicon:`check-circle;1em;sd-text-success` the ``carbonio-docs-core``
package. On **RHEL 8 only**, you might encounter some minor problem,
whose solution can be found in section :ref:`upgrade-ts`.

:octicon:`check-circle;1em;sd-text-success` logging out from
|product|, as either the admin and the user, in now managed by the
same endpoint, ``/logout``, i.e., `https://mail.example.com/logout`.

.. card:: The new |task| Component

   |product| 23.11 introduces the |task|, a simple task management
   application. |task| must be manually installed and consists of
   three packages: ``carbonio-tasks-db`` (database component),
   ``carbonio-tasks-ui`` (frontend), and ``carbonio-tasks``
   (backend). In the Multi-Server scenario, we suggest that these
   packages be installed on SRV1, SRV2, and SRV3 respectively.

   .. seealso::

      * :ref:`Installation instructions <multi-server-install>`
      * :ref:`User Documentation <tasks-comp>` 
