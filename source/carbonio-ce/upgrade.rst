.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade
=================

.. include:: /_includes/_upgrade/checklist-ce.rst

.. _upgrade-single:

Single-Server Upgrade Procedure
-------------------------------

.. include:: /_includes/_upgrade/single-ce.rst

.. _upgrade-multi:

Multi-Server Upgrade Procedure
------------------------------

.. include:: /_includes/_upgrade/multi-ce.rst
             
.. _upgrade-manual:

.. _upgrade-troubleshooting:

Manual Steps and Troubleshooting
--------------------------------

If you are upgrading from |prev| to |release|, you need to execute
these steps only if they are mentioned in Sections
:ref:`upgrade-single` or :ref:`upgrade-multi`.

If you are upgrading from an older version (i.e., previous to |prev|),
you need to verify if any of these steps is needed: in other words,
depending on the packages that will be upgraded, you might need to run
them or not. Please check the conditions fo

.. _upgrade-ds:

Upgrade Directory Server
~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_upgrade/ds.rst

.. troubleshooting

.. include:: /_includes/_upgrade/ts-ce.rst
