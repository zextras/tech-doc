.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

We are now on the last mile. To verify there is no dangling
installation or configuration task, run:

.. code:: console

   # pending-setups -a

.. hint:: The **secret** needed to run the above command is stored in
   file :file:`/var/lib/service-discover/password` which is accessible
   only by the ``root`` user.
   
Finally, as the ``zextras`` user, activate |product| license,
replacing **TOKEN** with your licence token.

.. code:: console

   zextras$ carbonio core activate-license TOKEN
