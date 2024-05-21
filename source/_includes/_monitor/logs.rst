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
