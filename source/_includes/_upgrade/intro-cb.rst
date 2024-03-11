
|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out 
by means of a few commands to be executed on each **Node**.

The upgrade procedure consists of a preliminary task, followed by the
proper upgrade, which is the same for each **Node**. Regardless of the
version currently installed, the successful upgrade will always bring
|product| to the latest version available, currently |version|.

Depending on the packages upgraded, and the version from which you are
upgrading, some manual step may be required. Please read carefully
section :ref:`upgrade-checklist` **before starting the upgrade**, to
see if you need to carry out some additional task.

.. note:: Only the **three previous versions** are supported for
   upgrade. If you install from an older version, you may need to
   execute further tasks to ensure proper functioning of |product|.

Moreover, in some cases, incompatibilities may seldom arise in the
upgrade of third-party software, which may lead to some additional
manual steps to be carried out. Section :ref:`upgrade-manual` below
contains information to prevent or fix these issues.

Release |release| of |product| introduces two major milestones:

* support for PostgreSQL, version **16**. Upgrade to this version is
  **strongly suggested** on Ubuntu *20.04*, but it is **mandatory** if
  you plan to upgrade to Ubuntu *22.04* (see next point).

* support for **Ubuntu 22.04** (Jammy Jellyfish), to which you can
  upgrade together with |product| |release|. If you want to upgrade
  only |product|, continue reading this page; otherwise, to upgrade
  **both** |product| and Ubuntu, please refer to section
  :ref:`upgrade-ubuntu-22`. In both cases, make sure to read Section
  :ref:`upgrade-checklist` to see if there are tasks that you need to
  execute besides the upgrade procedure.
