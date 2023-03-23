.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


.. _carbonio-shell:

=================
  |sh| Overview
=================


The |sh|, also known as *Carbonio Shell*, is an interactive shell that
allows to execute |carbonio|'s commands. To launch it, simply login
via console to |carbonio| and run

.. code:: console

   # carbonio

The prompt will change into ``carbonio>`` and you will be able to use
:kbd:`tab` for auto-completion. All commands you execute are stored in
the command history, so they are all available in the same place and
can be easily found.

In the shell, use only the sub-command and parameters, removing the
initial ``carbonio``. For example, command

.. code:: console

   # carbonio chats clusterstatus

can be run in |sh| as

.. code:: console

   carbonio> chats clusterstatus

The |sh| supports all carbonio commands, including provisioning (i.e.,
:command:`carbonio prov`) commands.

Adding options to any commands is also possible; for example, you can
run

.. code:: console

   carbonio> --progress powerstore doVolumeToVolumeMove sourceVolume destVolume

and see informative messages printed on screen while the data is moved
from ``sourceVolume`` to ``destVolume``.

To launch multiple carbonio commands, you can save them in a file
(called :file:`carbonio-commands.txt` here) and pipe them to the
carbonio shell. For example, consider file
:file:`carbonio-commands.txt` containing the commands:

.. code:: console

   prov ca user@example.com ''
   prov sp user@example.com password
   mobile doAddAccountLogger user@example.com debug /tmp/user@example.com
   prov ma user@example.com zimbraFeatureMobileSyncEnabled TRUE
   prov sm user@example.com cf /test
   prov sm user@example.com addMessage /test /tmp/email.eml
   prov ma user@example.com zimbraFeatureMobileSyncEnabled FALSE
   prov da user@example.com ''
   prov fc all

All these command can be executed as

.. code:: console

   # cat carbonio-commands.txt | carbonio

This proves useful, for example, when finding a procedure that
requires to execute a set of ``carbonio`` commands: copy tand paste
them into a file and run all of them sequentially without the need to
copy and paste each single command.
