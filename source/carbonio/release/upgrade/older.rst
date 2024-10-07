
.. _upgrade-older:

=======================================
 Upgrade from Older Versions
=======================================

If you plan to upgrade from a version older than |prev|, you **may**
encounter issues or need to carry out tasks or commands that are
reported in Sections :ref:`ts-up-prev` and :ref:`ts-up-older`.

There are two equivalent methods to upgrade a |product|
infrastructure: automatically using Ansible, or manually, Node by
Node. The Ansible procedure (see section :ref:`upgrade-prev`) should
work even if you did not install |product| using the Ansible
procedure, but may require some additional task to be executed
manually, while the latter allows you to follow closely, Node by Node,
the upgrade process and interact when needed and is described here.

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/manual.rst

.. _up-older-req:

Requirements & Preliminaries
============================
              
.. include:: /_includes/_upgrade/checklist-cb.rst

