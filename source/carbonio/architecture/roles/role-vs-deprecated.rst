.. _role-vs-install:

Legacy Videoserver |dprc|   
=========================

.. warning:: ``carbonio-videoserver`` and ``carbonio-videoserver-recorder`` packages
   are now in |dprc| status and will be removed in the near future.
   If you want to provide chats and video calls to your users, please install
   the new :ref:`role-vs-wsc-install` and :ref:`role-wsc-install` Roles.

Before installing ``carbonio-videoserver`` and ``carbonio-videoserver-recorder``
on the |product| infrastructure, make sure that you installed
the :ref:`role-prov-install`, which is a requirement for this Role.

.. note:: ``carbonio-videoserver`` and ``carbonio-videoserver-recorder`` packages
   cannot be installed on the same Node as :ref:`role-vs-wsc-install`.

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-vs.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Advanced Configuration
----------------------

You can configure some advanced settings of the |vs|, including
codecs, audio settings, and more from the CLI: please refer to section
:ref:`videoserver`.
