.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


 
.. _carbonio-shell:

=================
  |sh| Overview
=================


The |sh|, also known as *Carbonio Shell*, is an interactive shell that
allows to execute |carbonio|'s commands. All :command:`carbonio` commands
must be run as the ``zextras`` user. This can be achieved by running
as the ``root`` user

.. code:: console

   # su - zextras

Upon launching this command, the prompt will change to ``zextras$``.

At this point, to launch a :command:`carbonio` command you can either

#. run it from the CLI:

   .. code:: console

      zextras$  carbonio backup doSmartScan start

#. enter the |csh|
  
   .. code:: console

      zextras$ carbonio

   The prompt will change into ``carbonio>`` and you will be able to
   use :kbd:`tab` for auto-completion.  In the shell, use only the
   sub-command and parameters, removing the initial :command:`carbonio`. For
   example, command

   .. code:: console

      # carbonio backup doSmartScan start
      
   can be run in |sh| as

   .. code:: console

      carbonio> backup doSmartScan start

   The |csh| is useful if you need to execute multiple commands to
   carry out some advanced task and to keep the history: they will be
   available for future reference and to check  the operations done so
   far. 

Composition of a command
========================

A typical |carbonio| command is composed by several parts, some of
which is required for the command to work properly.

Module
------
The |sh| supports all |carbonio| **modules**: *auth*, *admin*, and
more, including provisioning (i.e., :command:`carbonio prov`). These
are called also *subcommands*.

Parameters
----------

The actual parameters available for each :command:`carbonio` command
depend on the command itself. Parameter are either **mandatory** or
**optional** and are denoted with **(M)** and **(O)** in the online help.

All parameters are given as a ``<name> <value>`` pair, but the
`<name>` must be provided only for **optional** parameters and must be
omitted in the **mandatory**. For example, consider this help page.

.. code:: console

   zextras$ carbonio admin setDomainSettings *domain* [param \
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**  (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| a\              | Integer         |                 | no action       |
| ccount_limit (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| domain_a\       | String          |                 | no action       |
| ccount_quota (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| rese\           | String          | c\              | no action       |
| t_cos_limits (O)|                 | osname1:limit1, |                 |
|                 |                 | cosname2:limit2 |                 |
+-----------------+-----------------+-----------------+-----------------+
| ad\             | String          | c\              | no action       |
| d_cos_limits (O)|                 | osname1:limit1, |                 |
|                 |                 | cosname2:limit2 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

In order to limit to 1,000 the accounts of domain acme.example, we
need to write the command as

.. code:: console

   zextras$ carbonio admin setDomainSettings \
   acme.example \
   account_limit 1000

There are two parameters in this command: ``<domain> <acme.example>``
and ``<account_limit> <1000>``, but since **domain** is mandatory, we
omit its name.

.. _shell_options:

Command Line Options
====================

Adding options to any commands is also possible; for example, you can
run

.. code:: console

   carbonio> --progress backup doSmartScan start

The available command line options are:


--host      Specify a target host (both IP or hostname are accepted)
            on which the command will be executed. Use ``all_servers``
            to broadcast the command to all servers. To run a command
            only on the server on which you are logged in, simply do
            not use the option.

--json      The output of the command will be presented in JSON format
            and is useful for scripting. 

--progress  Prints the operation's feedback directly to
            ``STDOUT``. Press :kbd:`Ctrl+C` to interrupt the
            output: the operation itself will not be interrupted. 

--sync      Runs the command in synchronous mode, waiting for the
            operation's execution to end and returning an exit code:

            * 0 - Successful
            * 1 - Failed
            * 2 - Stopped
            * 3 - Removed
            * 4 - Interrupted

Seeking help
============

``carbonio`` comes with a contextual help that can be used at
different levels and with no differences on CLI and |csh|. The most
general use is

.. code:: console

   zextras$ carbonio help

This lists all options (see :ref:`previous section <shell_options>`)
and all modules available to carbonio. The ``help`` keyword can be
used also to list all command in a module (for example,
:command:`carbonio help config`), or the help page of each command (for example,
:command:`carbonio help config distributionList`).

.. hint:: The help page of the command is shown also if there is some
   syntax error in the command issued.

Scripting Commands
==================

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
requires to execute a set of :command:`carbonio` commands: copy tand paste
them into a file and run all of them sequentially without the need to
copy and paste each single command.
