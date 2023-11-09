.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

..
   We define as **current version** |version|, as **previous version**
   the version immediately before, i.e., |prev|, and as **older
   versions** any version of |product| released before these two.

This upgrade impacts the following *Roles* or packages, which require some
manual interaction during the procedure.

:octicon:`check-circle;1em;sd-text-success` the ``carbonio-docs-core``
package. On **RHEL 8 only**, you might encounter some minor problem,
whose solution can be found in section :ref:`upgrade-ts`.

.. card:: The new |task| Component

   |product| 23.11 introduces the |task|, a simple task management
   application. |task| must be manually installed and consists of
   three packages: ``carbonio-tasks-db`` (database component),
   ``carbonio-tasks-ui`` (frontend), and ``carbonio-tasks-ce``
   (backend). In the Multi-Server scenario, we suggest that these
   packages be installed on SRV1, SRV2, and SRV3 respectively.

   .. seealso::

      * :ref:`Single-Server installation <single-server-install>`
      * :ref:`Multi-Server installation <multi-server-install>`
      * :ref:`User Documentation <tasks-comp>`
