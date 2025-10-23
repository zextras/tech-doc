.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. rubric:: Repository Setup

.. include:: /_includes/_installation/_repo/pg.rst

.. rubric:: Update Package List

.. include:: /_includes/_installation/update-packages.rst

.. rubric:: Package Installation

.. include:: /_includes/_architecture/_packages/component-db.rst
.. include:: /_includes/_installation/step-conf-db.rst

Finally, allow the other nodes to access the databases that will be
stored on this node by running these commands.

.. include:: /_includes/_installation/_repo/pg-access.rst
