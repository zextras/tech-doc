
|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out 
by means of a few commands to be executed on each **Node**, be it the
(single) Node in a Single-Server installation, or all the Nodes in a
Multi-Server installation.

.. card:: Supported Versions
   :class-card: sd-border-2 

   Only the **three previous versions** (so, in case of |version|, all
   from |last_upg| included) are supported by this upgrade
   procedure. If you try to upgrade from older version, you might be
   required to run some tasks manually, including for example, edit
   configuration files, manually remove packages or resolve package
   conflicts, and so on and so forth.

The upgrade procedure is the same, regardless of the currently
installed version of |product|. The difference is that if you upgrade
from |prev|, you usually do not need to carry out any other task
manually, while if you upgrade from any *older supported version*, you
will probably need to run some task before, during, or after the
upgrade procedure.

Before proceeding to the upgrade, if you upgrade from |prev|, please
read carefully section :ref:`upgrade-prev`; otherwise, please read
section :ref:`upgrade-older`.
