.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mesh-gui:

|mesh| Administration Interface
===============================

It is usually not required to access the administration interface of
|mesh|, because everything is managed under the hood by |product|. To
have a look at the administration interface, for example to check out
the configuration generated by |product|, you need first to create a
new token, then to set up an SSH tunnel from the current workstation
to the |product| server.

The latter step is mandatory because, For security reasons, |mesh|
only listens on ``localhost``.

Requirements
------------

In order to successfully complete two tasks described below, you will
need the **cluster credential password** that was defined during the
|mesh| installation.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2. Create Token
   ^^^^^

   You need to create a **bootstrap token** that will be used to
   create any additional token.

   .. code:: console

      # service-discover bootstrap-token

   You need to provide the **cluster credential password** that you
   used in the previous step.

   .. warning:: The *bootstrap token* is the most important building
      block of |mesh| and should only be used to create other tokens:
      if lost, **all tokens must be regenerated**, so keep it safe!


.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3. Create tunnel
   ^^^^^

   .. code:: console

      # ssh -N -f -L 8500:localhost:8500 root@<IP Address>

