.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


.. _carbonio-shell:

==========
 The |sh|
==========


The |sh|  is an interactive shell that allows to execute
|carbonio|'s commands. To launch it, simply login via console to
|carbonio| and run

.. code:: console

   # carbonio

The prompt will change into ``carbonio>`` and you will be able to use
:kbd:`tab` for auto-completion. All commands you execute are stored in
the command history, so they are all available in the same place and
can be easily found.

In the shell, use only the sub-command and parameters, removing the
initial ``carbonio``. For example, command

.. code::

   # carbonio chats clusterstatus

can be run in |sh| as

.. code:: console

   carbonio> chats clusterstatus

The |sh| supports all carbonio commands, including provisioning (i.e.,
:command:`carbonio prov`) commands.
