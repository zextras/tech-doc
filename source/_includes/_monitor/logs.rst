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
