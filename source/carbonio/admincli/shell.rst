.. _carbonio-shell:

===============
 |sh| Overview
===============


The |sh|, also known as *Carbonio Shell*, is an interactive shell that
allows to execute |carbonio|'s commands. All :command:`carbonio`
commands must be run as the ``zextras`` user: to do so, run as the
``root`` user

.. code:: console

   # su - zextras

Upon launching this command, the prompt will change to ``zextras$``.

At this point, to launch a :command:`carbonio` command you can either

#. run it from the CLI:

   .. code:: console

      zextras$ carbonio backup doSmartScan start

#. enter the |csh|

   .. code:: console

      zextras$ carbonio

   The prompt will change into ``carbonio>`` .  In the |sh|, you can run the
   previous command as

   .. code:: console

      carbonio> backup doSmartScan start

   The |csh| is useful in multiple ways:

   * If you need to execute multiple commands, for example to carry
     out some advanced task
   * To keep the history: commands will be available for future
     reference and to check the operations done so far
   * You will be able to use :kbd:`tab` for auto-completion of commands

.. _sh-syntax:

Syntax of a Command
===================

A typical |carbonio| command is composed by several parts, some of
which is required for the command to work properly, for example

.. code:: console

   zextras$ carbonio --progress backup doSmartScan start

Besides :command:`carbonio`, which is used to invoke the commands, the
following parts compose a typical :command:`carbonio` command: the
module name, the command, and the parameters.

.. _sh_options:

Command Line Options
--------------------

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

.. _sh-module:

Module
------

The |sh| supports all |carbonio| **modules**: *auth*, *admin*, and
more, including provisioning (i.e., :command:`carbonio prov`).

.. _sh-command:

Command
-------

Most of the commands are module-dependent

.. _sh-param:

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

.. _sh-help:

Seeking Help
============

``carbonio`` comes with a contextual help that can be used at
different levels and with no differences on CLI and |csh|. The most
general use is

.. code:: console

   zextras$ carbonio help

This lists all options (see :ref:`previous section <sh_options>`)
and all modules available to carbonio. The ``help`` keyword can be
used also to list all command in a module (for example,
:command:`carbonio help config`), or the help page of each command (for example,
:command:`carbonio help config distributionList`).

.. hint:: The help page of the command is shown also if there is some
   syntax error in the command issued.

.. _sh-script:

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

.. _sh-shared-commands:

Shared Commands
===============

There are a few commands that can be used within every module and
allow to manage the status of the services provided by each
module. These commands are: :command:`getServices`,
:command:`doStartService`, :command:`doStopService`, and
:command:`doRestartService`.

Their usage is quite simple and follows the general syntax (see
:ref:`sh-syntax`): :command:`carbonio <module> <command>
{service_name}`, for example::

  zextras$ carbonio mobile getServices

The output will be similar to the following one::

          services
            module
                could_start                                                 false
                could_stop                                                  true
                running                                                     true
            activesync-services
                could_start                                                 false
                could_stop                                                  true
                running                                                     true
            autodiscover
                could_start                                                 false
                could_stop                                                  true
                running                                                     true
            abq-services
                could_start                                                 false
                could_stop                                                  true
                running                                                     true
            ldap-address-book
                could_start                                                 false
                could_stop                                                  true
                running                                                     true
            anti-dos
                could_not_start_because                                     anti-dos disabled
                could_start                                                 false
                could_stop                                                  false
                running                                                     false

Along each available service appears its current status and whether it
can started or stopped. In some cases, additional information is also
shown, for example the **anti-dos** service can not be started because
it is not enabled.

You can manually start, restart, or stop a service using the other
commands; unlike :command:`getServices`, these require a parameter,
which is the service name, for example::

  zextras$ carbonio mobile doStopService activesync-services

This command outputs a status message, which is *"service stopped"* if
it was successful. Similar messages are generated after using the
:command:`doStartService` and :command:`doRestartService` commands.

.. index:: zmcontrol

.. _zmcontrol:

Control the Status of |product| services
========================================

Besides the :command:`carbonio` command, another useful command is
:command:`zmcontrol`, which must be run as the ``zextras`` user as
well, is used to check and verify the status of the services available
on |product| and start or stop them.

.. note:: On RHEL 9, :command:`zmcontrol` has a limited usage and is
   mostly integrated with the ``systemd`` service: check the
   :ref:`dedicated box <rhel-systemd>` for more information.

The ``status`` sub-command is used to verify which services and
modules are running. A sample output of the command is::

  zextras$ zmcontrol status
  Host mail.example.com
      amavis                  Running
      antispam                Running
      directory-server        Running
      mailbox                 Running
       --Carbonio Advanced installed.
       --Checking advanced modules status.
       --Config is running
       --Core is running
       --Auth is running
       --Mobile is running
       --Chats is running
       --Admin is running
       --HA is NOT running
       --Backup is running
       --Powerstore is running
       --Drive is NOT running
       --SproxyD is running
      memcached               Running
      mta                     Running
      opendkim                Running
      proxy                   Running
      service webapp          Running
      service-discover        Running
      stats                   Running
      config service          Running

The services (those in the main column, like *amavis*, *antispam* and
so on) can be controlled using the sub-commands ``start``,
``restart``, and ``stop``.

.. note:: If you do not provide a service name to the sub-commands,
   **all the services** will started, restarted, or stopped.

The modules (whose name is prefixed by ``--``) require, as a general
rule, that the corresponding :command:`carbonio` command be used.

The :command:`zmcontrol` comes also with an important option: ``-v``,
which outputs the current version of |product| and a few more
information about the CLI and server's versions. As an example, this
is the output on an upcoming 24.12.0 version.

.. code-block:: console
   :emphasize-lines: 2

   zextras$ zmcontrol -v
   Carbonio Release 24.12.0
   Advanced module version:

   CLI versions:

           zextras_version                                     24.12.0-SNAPSHOT
           zextras_commit                                      5a19e9dc7b27aec0ec3d94ae829eff1239993d2b
           zal_version                                         24.12.0-SNAPSHOT
           zal_commit                                          a4adc73297941a406384b391728266e4eb2e8ce4


   Server versions:

           version                                             24.12.0-SNAPSHOT
           commit                                              fcd5553231cbd46f004163f77b2d00171b9fcc58
           commit_dirty                                        true
           system_type                                         carbonio
           product                                             Carbonio
           zal_version                                         24.12.0-SNAPSHOT
           zal_commit                                          a4adc73297941a406384b391728266e4eb2e8ce4

The important bit here is the first line of the output; while the
various ``commit`` refer lines refer to the source code from which the
software was built.
