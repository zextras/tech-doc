.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The most efficient way to report a Zextras Suite issue is the one that
allows both the *Reporter* and the *Technical Support Team* to reach
their common goal—​the solution of the issue!--in the quickest and more
robust way.

Preparing an accurate and complete report that describes the issue you
experienced and attach it to the bug report or ticket that you are
opening is the most important starting point, because in these cases the
Technical Support Team can immediately look into the issue without the
necessity to ask for more information. Building such a report may
require to execute commands, prepare screenshots, describe the steps to
reproduce the problem, and so on. This section focuses on how to gather
information about Zextras Suite and its modules.

.. _step_by_step_guide:

Step by step guide
------------------

In order to report a Zextras Suite issue, please follow this steps:

-  Read through the appropriate sections of the `Technical
   Documentation <https://docs.zextras.com/zextras-suite-documentation/latest/home.html>`_
   (make sure you select the correct version of your Zextras
   installation), to check whether you can find useful advises

-  search on the `Community <https://community.zextras.com/>`_ if there
   are articles that cover a solution to your problem

-  Make sure that what you report is a software issue (see :ref:`Definition
   of "issue" <issue-definition>`).

-  Gather all information specified in the :ref:`What information to include
   in your report <required-info-ticket>` section of this page.

-  File a case in the Zextras Support Portal at
   https://helpdesk.zextras.com/, providing the most amount of
   information possible.

.. _issue-definition:

Definition of "issue"
---------------------

While you as a user can experience different problems, not in all of
them the Technical Support Team can be helpful.

In this cases the Technical Support Team will **not** be able to help
you:

-  *Licensing complaints*: while we do our best to provide the fairest
   licensing model possible, we know this can’t please each and every
   customer in the world. If you feel that the Zextras Licensing does
   not suit your needs and wish to let us know your opinion, please
   contact the Sales Team through the form you can find at
   https://www.zextras.com/contact-us

-  *Issues affecting old versions of Zextras Suite*: In order to provide
   a better service, technical support is limited to the latest Zextras
   Suite version. If you are not running the latest version, please
   update Zextras Suite - should the issue persist, then please proceed
   with your report as described in the remainder of this page.

-  *Hardware related issue*: If the server on which Zextras is installed
   does not operate correctly, the Technical Support team will not be
   able to help. For optimisations and tuning options, however, you can
   refer to Zimbra’s `Tuning
   Guidelines <https://wiki.zimbra.com/wiki/Performance_Tuning_Guidelines_for_Large_Deployments>`_.

The Technical Support Team will be keen to help in these cases:

-  *Bug reports*: When you are using some feature in Zextras and the
   result you obtain is an error message or some unexpected behaviour
   (for example, you change the Backup Path, but backups are saved
   elsewhere), you need to inform the Technical Support Team that will
   forward your report to the appropriate development team.

-  *Suggestions for new features*: We at Zextras really love to know
   which new features our users would like in Zextras Suite. If you have
   an idea for a new feature, please open a case in the Support Portal
   to the Technical Support team.

-  *Configuration or customisation not applied*: in this category fall
   most of the ticket, including for example an account not receiving
   e-mails although (apparently) correctly configured; the custom
   company logo not showing up on the login portal,

.. _tools_of_the_trade:

Tools of the trade
------------------

In order to obtain the information you need to file a bug report, the
following tools will surely come handy:

-  A way to read logfiles on your Zimbra server (using ``less`` after a
   SSH access would suffice)

-  The Zimbra Web Client’s Dev Mode

-  Your browser’s Dev Tools (*Web Developer* on Firefox, *Developer
   Tools* on Chrome)

-  Zextras Suite log level management

In order to gather useful details from the log files, set both the Log
Level and Notification Level to **Debug** in the Core tab of the Zimbra
Administration Console, when experiencing an issue.

On Zimbra 8.x version or later, after raising the Log and Notification
Levels and logging into Dev Mode, the Zimbra Administration Console may
get stuck during the page loading.

When this happens, chances are that the **Zimbra DoS filter** is
blocking the access due to the high number of connections created in
Debug Mode. Please check the dedicated :ref:`Zimbra DoS Filter
<dos-filter>` section to learn about it, its options and how to tweak
them for a smoother loading.

.. topic:: :octicon:`comment` Zimbra's Debug Mode

   It’s very important to use Zimbra’s debug mode when gathering
   information, because it allows to identify the exact module causing the
   error. To enter the debug mode, simply add the **?dev=1** string at the
   end of your URL (e.g. http://mail.example.com/?dev=1). This forces
   Zimbra to ignore any cached data to and reload any Javascript component
   separately.

   .. rubric:: Check for exceptions in the Zimbra Administration Console

   - Log into the Zimbra Web Client adding **?dev=1** after the URL of
     your server (e.g. https://mail.example.com/?dev=1)

   - Verify if the issue still occours. If not, clearing the browser’s
     cache should solve the issue permanently.

   - If the issue persists, open your browser’s debug tool: *Web
     Developer* on Firefox, *Developer Tools* on Chrome

   - Reload the Zimbra Web Client (keeping the **?dev=1** parameter)
     and search for any error or exception in the debug tool’s console

   - Include the complete error or exception in your bug report

.. _required-info-ticket:

What information to include in your report
------------------------------------------

Depending on the Zextras module on which you experience an issue, you
should include in your report different information, most of which are
available as output of CLI commands. It is therefore required to have
console or SSH access to the mailserver in order to issue these
commands.

Make sure to attach **all** the information listed in the
`ticket-common-information_title <#_common_information>`_ to each
ticket you open on the Support Portal. You can then skip to the
appropriate section, dedicated to each Zextras module and gather
additional information.

.. card:: Common Information

   These data must be provided for every ticket opened.

   1. the full output of ``zmcontrol -v``

   2. the full output of ``zxsuite --host all_servers core getVersion``

   3. the full output of ``zxsuite core getLicenseInfo`` commands.

   Take note of the *order_id* field you get from the last command and
   properly insert it in the ticket’s **license ID** field

Before reproducing the issue, set the verbosity of the ``mailbox.log``
file to debug by running the command ``zxsuite config global set
attribute ZxCore_LogLevel value 0``. **Make sure** to set it back to
**1** once finished the operation to avoid filling the disk with logs.

.. note:: When reporting migration issues, please specify this data
   for both the source and destination server.

.. grid::
   :gutter: 3
            
   .. grid-item-card:: **Zextras Powerstore**
      :columns: 6

      -  the output of ``zxsuite powerstore getAllVolumes``

      -  the output of ``zxsuite powerstore getPowerstorePolicy``

      -  the output of ``zxsuite powerstore getMovedMailboxes`` and
         ``zxsuite powerstore getNonLocalMailboxes``

      -  the ``mailbox.log`` file reproducing the issue

   .. grid-item-card:: **Zextras Backup**
      :columns: 6

      -  the output of ``zxsuite config server get $(zmhostname)``

      -  the output of ``zxsuite backup getBackupInfo``

      -  the output of ``mount`` command

      -  the ``mailbox.log`` file relative to the operation


   .. grid-item-card:: **Zextras Mobile**
      :columns: 6

      - activate an account logger in debug mode on one of the
        affected devices with ``zxsuite mobile doAddAccountLogger
        user@domain.tdl debug /path/to/log/file.log``

      - remove the account from the device

      - add the account on the device again

      - try to reproduce the issue

      and then attach to the report the ``/path/to/log/file.log`` file,
      together with:

      -  the ``mailbox.log`` and the ``sync.log`` files relative to the
         operations above

      -  a brief explanation of how to reproduce the issue

      -  manufacturer, model and exact OS version of the device

   .. grid-item-card:: **Zextras Team**
      :columns: 6

      -  the output of ``zmprov gas`` and ``zmprov gas mailbox``

      -  the output of ``zxsuite config global get``,
         ``zmzimletctl listZimlets``,
         ``zmzimletctl info com_zimbra_Team_classic`` and
         ``zxsuite Team clusterStatus``

      -  the output of ``zxsuite Team getServices`` and
         ``zxsuite Team iceServer get``

      -  the output of ``for cos in $(zmprov gac); do zmprov gc $cos; done``
         and ``zmprov ga USER@DOMAIN.TDL`` of one of the affected users

      -  the output of
         ``for cos in $(zmprov gac); do echo $cos; zxsuite config cos get $cos; done``
         and ``zxsuite config account get USER@DOMAIN.TDL`` of the same user
         as the previous command

      -  the output of
         ``for dom in $(zmprov gad); do zmprov gd $dom zimbraPublicServiceProtocol zimbraPublicServiceHostname zimbraPublicServicePort; done``

      -  the output of ``zxsuite --host all_servers powerstore getAllVolumes``

      -  the output of ``zxsuite --host all_servers core apiversions team``

      -  the ``mailbox.log`` file relative to a restart of the mailboxd with
         ``zmmailboxdctl restart``

      -  the ``mailbox.log`` and the ``zmmailboxd.out`` files of the last
         couple of days

      -  A test account without admin privileges could also be useful.

.. _help_us_improve_zextras_suite:

Help us improve Zextras Suite
-----------------------------

A "Send full error data to Zextras to help us improve Zextras Suite"
checkbox is available in the "Core" section of the Zextras
Administration Zimlet. This will allow us to improve Zextras Suite by
gathering an extended set of error information, which might include:

-  Full error messages and stacktraces.

-  Email Addresses.

-  Mobile phone brand, model and ID.

-  Message Headers and Contents.

This information will be handled by automated systems and will only be
used for bughunting and software analysis

You can also enable this feature by setting the
``ZxCore_SendFullErrorReports`` Zextras Core property to **TRUE**.
