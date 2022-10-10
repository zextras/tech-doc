.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

We are now on the last mile. To verify there is no dangling
installation or configuration task, run:

.. code:: console

   # pending-setups -a

Finally, as the ``zextras`` user, activate |product| license,
replacing **TOKEN** with your licence token.

.. code:: console

   # carbonio core activate-license TOKEN
