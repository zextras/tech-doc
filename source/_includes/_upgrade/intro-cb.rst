
|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out 
by means of a few commands to be executed on each **Node**.

.. card:: Supported Versions
   :class-card: sd-border-2 

   Only the **three previous versions** (so, in case of |version|, all
   from |last_upg| included) are supported by this upgrade
   procedure. If you try to upgrade from older version, you might be
   required to run some tasks manually, including for example, edit
   configuration files, manually remove packages or resolve package
   conflicts, and so on and so forth.
   
The upgrade procedure varies, depending from the version currently
installed. If the version of your *current* |product| installation is
|prev|, please refer to section :ref:`upgrade-prev`; if you install
any older version, refer to section :ref:`upgrade-older`. Regardless
of the version currently installed, the successful upgrade will always
bring |product| **to the latest version available**, currently
|version|.


Moreover, in some cases, incompatibilities may seldom arise in the
upgrade of third-party software, which may lead to some additional
manual steps to be carried out. This is true especially in the case of
upgrading from older versions, so please check Section
:ref:`up-older-issues` before starting the upgrade.
