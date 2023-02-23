.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade
=================

.. include:: /_includes/_upgrade/checklist-cb.rst

.. _upgrade-single:

Single-Server Upgrade Procedure
-------------------------------

.. include:: /_includes/_upgrade/single-cb.rst

.. _upgrade-multi:

Multi-Server Upgrade Procedure
------------------------------

.. include:: /_includes/_upgrade/multi-cb.rst
             
.. _upgrade-manual:

.. _upgrade-troubleshooting:

Manual Steps and Troubleshooting
--------------------------------

If you are upgrading from |prev| to |release|, you need to execute
these steps only if they are mentioned in Sections
:ref:`upgrade-single` or :ref:`upgrade-multi`.

If you are upgrading from an older version (i.e., previous to |prev|),
you need to verify if any of these steps is needed.

.. _upgrade-ds:

Upgrade Directory Server
~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_upgrade/ds.rst

.. _upgrade-vs:

Upgrade |vs| Node
~~~~~~~~~~~~~~~~~

.. include:: /_includes/_upgrade/vs.rst

.. troubleshooting

.. include:: /_includes/_upgrade/ts-ce.rst
.. include:: /_includes/_upgrade/ts-cb.rst
