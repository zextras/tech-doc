.. _role-vs-install:

Video Server & Video Recording
================================

Before installing this Role on the |product| infrastructure, make sure
that you installed the :ref:`role-prov-install`, because this role is
required by the |vs|.

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-vs.rst


Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst


Advanced Configuration
----------------------

You can configure some advanced settings of the |vs|, including
codecs, audio settings, and more from the CLI: please refer to section
:ref:`videoserver`.

Enable Chats
~~~~~~~~~~~~

Chats is disabled by default, you can enable it by running a few CLI
commands that you can find in section :ref:`vs-enable-chats`.
