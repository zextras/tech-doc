.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

..
   We define as **current version** |version|, as **previous version**
   the version immediately before, i.e., |prev|, and as **older
   versions** any version of |product| released before these two.

   This upgrade impacts the following *Roles* or packages, which
   require some manual interaction during the procedure.

There is a **breaking change** in this release, which requires some
attention during the upgrade.

Some files have been moved from one package to another one. Since
package managers forbid a file to belong to multiple packages, an
error will be shown during the upgrade. You need to make sure that the
package is installed, therefore these braking change leads to a slight
different upgrade procedure, in Step 3. You can choose between two
alternative procedures, either with automatic or manual conflict
resolution. They are equivalent and will ensure that all the packages
are correctly installed.

