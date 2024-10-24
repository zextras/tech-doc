===============================
 Upgrade From |product| 24.5.0
===============================

This section guides you in the upgrade from |product| **24.5.0** to
the latest available version, |release|, which contains a number of
technical and performance improvements, bug fixes, and security fixes.

Requirements and Limitations
----------------------------

Before proceeding with the upgrade, please read carefully this whole
section.

The following rules apply to any of the paths you decide to choose for
the upgrade:

* The only supported method of upgrade from older versions is the
  *manual procedure*.

* Since the **24.3.0** release, two major improvements have become
  available for |product|:

  #. support for new Operating Systems (OS): **Ubuntu 22.04** and **RHEL 9**
  #. support for **PostgreSQL 16**

* You need to carry out the procedure on **each Node**, starting with
  the one featuring the :ref:`role-mesh-install`.

* During the upgrade of |product|, you might need to carry out manual
  tasks, for example because you need to modify some configuration
  file or you some error or warning is shown. In this case, please
  refer to the :ref:`upgrade troubleshooting <ts-upgrade>` section.

While you can choose to upgrade only |product|, we encourage you to
introduce both the improvements into your infrastructure, especially
PostgreSQL, whose version **12** is supported only until the **14th
November 2024**.
