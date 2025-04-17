In order to configure |product|'s repository, you need to some files
with the necessary information.

It you install |product| on Ubuntu, you also need to import the GPG
key used for signing the packages and verify them.

.. card:: Configure |product| Repository

   .. include:: /_includes/_installation/_repo/zx.rst

.. card:: Import GPG Key

   This step is required only on Ubuntu systems (Ubuntu 20.04 and Ubuntu 22.04).

   .. include:: /_includes/_installation/_repo/key-zx.rst

.. card:: Configure RHEL-only Repositories

   .. include:: /_includes/_installation/_repo/rhel.rst

.. card:: Configure PostgreSQL Repository

   .. include:: /_includes/_installation/_repo/pg.rst
