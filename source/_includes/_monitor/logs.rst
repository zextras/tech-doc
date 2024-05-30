This section contains information about log files in |product| and
their location, and commands to manually retrieve information from
them.

The processes related to |product| create files for the majority of
its activities. However, to troubleshoot issues related to |product|,
it is usually not needed to search each log files to find useful
information, because the most relevant messages appear, as well, in
many main log files, i.e., the standard Linux log files, like for
example, ``syslog`` (which specifies the activities of the MTA),
Logger, Authentication, and Directory. The log files location are the
following

* :file:`/opt/zextras/log/` stores log files produced by |product|
  core services

* :file:`/var/log` is the standard Linux directory where all daemons
  and services write their log file

* :file:`/var/log/carbonio` is used by some |product| Modules (e.g.,
  Files, Docs) to write their log files

.. card:: Java's logging framework, ``log4j``

   Log files created by jetty services are managed by log4j, Java's
   logging framework, which by default is configured to write its log
   messages to the local file system.

   Logs created by log4j are rotated at 00:00 and compressed by a
   scheduled task.

In table :numref:`tab-logs`, some of the most relevant log files are
shown, along with their content and the service that creates them.

.. _tab-logs:

.. csv-table:: List of Relevant Log Files
   :widths: 40 40 20
   :header: "Log File", "Service", "Content"

   ":file:`/var/log/carbonio.log`", "syslog", "MTA, LDAP, System"
   ":file:`/opt/zextras/log/audit.log`", "log4j User and Admins authentication"
   ":file:`/opt/zextras/log/clamd.log`", "ClamAV", "ClamAV antivirus messages"
   ":file:`/opt/zextras/log/freshclam.log`", "Freshclam", "Freshclam
   (ClamAV signature updater) messages"
   ":file:`/opt/zextras/log/mailbox.log`", "log4j", "All mailbox activities"
   ":file:`/opt/zextras/log/nginx.access.log`", "Nginx", "Nginx access logs"
   ":file:`/opt/zextras/log/zmmailboxd.out`", "Jetty", "``mailboxd`` daemon output"
   ":file:`/var/log/carbonio/files`", "|file|", "Messages from |file|"
   ":file:`/var/log/carbonio/docs`", "|docs|", "Messages from |docs|"
   ":file:`/var/log/carbonio/docs-db-connector`", "|docs|-connector", "Messages from |docs|-connector"
   ":file:`/var/log/carbonio/preview`", "|pv|", "Messages from |pv|"

Searching Keywords in Log Files
-------------------------------

An important monitoring task is to watch log files messages and search
for some keywords, especially during startup processes when all
services are initialised and started.

Important among the log files mentioned in the section above, is the
file :file:`/opt/zextras/log/mailbox.log`, which contains a lot of
information related to user actions. Therefore, searching for keywords
can show limits reached by the system during the everyday usage. For
example, the following snippet shows that the limit for SOAP session
was reached::

  [name=…...@example.com;mid=116;oip=88.32.89.34;port=40600;ua=CarbonioWebClient -
  GC91 (Mac)/8.8.15_GA_4026;soapId=76fe42;] session - Too many SOAP
  sessions (21 > 20), closing SoapSession{id=1335,
  authAcct=02c4d68c-bbdc-42f8-8be8-84ba383406b7,
  lastAccessed=2021-06-09 13:44:57,231}

.. index:: zmlocalconfig, carbonio prov

You can search for these kind of limits in the |product| configuration
using CLI commands, :command:`zmlocalconfig` and :command:`carbonio
prov`.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Command ``zmlocalconfig``
      :columns: 6

      When using the command without arguments, the output will be the
      full configuration; a typical use of this command is to pipe the
      output for specific values, for example:

      .. code:: console

         zextras$ zmlocalconfig | grep session

      The output will include these parameters, while the actual values may
      differ::

        zimbra_session_limit_admin = 5
        zimbra_session_limit_imap = 15
        zimbra_session_limit_soap = 20
        zimbra_session_limit_sync = 5
        zimbra_session_max_pending_notifications = 400
        zimbra_session_timeout_soap = 600

   .. grid-item-card:: Command ``carbonio prov``
      :columns: 6

      Also in this case, supplying no arguments, the output will be
      the full configuration. To retrieve specific values (e.g., the
      maximum number of threads for various services), you can use the
      following command to filter the full output

      .. code:: console

         zextras$ carbonio prov gacf | grep -i threa | grep -i num

      The output will be similar to::

        CarbonioAdminImapImportNumThreads: 20
        CarbonioHttpNumThreads: 250
        CarbonioHttpSSLNumThreads: 50 (deprecated)
        CarbonioImapNumThreads: 200
        CarbonioLmtpNumThreads: 20
        CarbonioMilterNumThreads: 100
        CarbonioPop3NumThreads: 100
        zimbraScheduledTaskNumThreads: 20

Modifying Configuration Values
------------------------------

.. warning:: While modifying the |product| configuration is a simple
   task that in most cases requires only to run a CLI command, Please
   keep in mind that changing any parameter may hinder |product|
   performances and normal activity. Proceed with care!

To modify any of these values, you need to make sure that there are
sufficient resources on the system. If the |carbonio| system
continuously uses all the available RAM Memory, it makes little sense
to increase any of the limits in the previous limits! Indeed, before
doing so, you need to add more RAM to the system, to allow for
accommodating more sessions.

Provided system resources suffice, you can increase the values found
in the outputs of the commands as follows.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Command ``zmlocalconfig``
      :columns: 6

      To modify any value, use command :command:`zmlocalconfig -e`.
      For example, to raise the SOAP limit to **25**, execute command

      .. code:: console

         zextras$ zmlocalconfig -e zimbra_session_limit_soap=25

      To change other parameters, remember to supply them in **key=value**
      format.

   .. grid-item-card:: Command ``carbonio prov``
      :columns: 6

      To modify any value, use command :command:`carbonio prov
      mcf`. The following command increases parameters
      ``zimbraImapNumThreads`` and ``CarbonioLmtpNumThreads`` to *400*
      and *50*, respectively.

      .. code:: console

         zextras$ carbonio prov mcf zimbraImapNumThreads 400 CarbonioLmtpNumThreads 50
