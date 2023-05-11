.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

..
   We define as **current version** |version|, as **previous version**
   the version immediately before, i.e., |prev|, and as **older
   versions** any version of |product| released before these two.

This upgrade impacts the following *Roles* or packages, which require some
manual interaction during the procedure.

:octicon:`check-circle;1em;sd-text-success` the |vs|. To prevent any
downtime in the services, during the upgrade you must choose to keep
the old version of the configuration file: to do so, click :kbd:`N`
when asked to replace the configuration file.

:octicon:`check-circle;1em;sd-text-success` the |pv|. In this case,
you must choose to replace the old configuration file. Therefore,
during the upgrade click :kbd:`Y` when asked to replace the
configuration file.

:octicon:`check-circle;1em;sd-text-success` the ``carbonio-docs-core``
package. On **RHEL 8 only**, you might encounter a conflict between
libraries. In this case, please refer to section :ref:`upgrade-ts`.
