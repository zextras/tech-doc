
ClamAV abilities include loading external signatures, which are lists
of hashes or fingerprints of viruses organised into so-called *signature
database*, used to recognise a broader range of possible threats sent by
e-mail.

There are many signatures provider that ClamAV can use, most of them
licenced as Open Source; however using multiple signature databases
may not always result in a higher precision of the ClamAV
engine. Indeed, using too many signature databases may in some
circumstances lead to false positive, therefore marking legitimate
e-mails as as virus and send them to the quarantine or
deleted. Moreover, since the signatures are loaded in RAM to allow for
faster checks, this can lead to high CPU usage and, in case of a DB or
a signature is corrupted or not 100% compatible, to the failure of the
whole ClamAV engine.

For this reasons, |product| receives its signatures by a security
partner, which are guaranteed to be 100% compatible with ClamAV and
reduce the risk of false positives. In order to keep the signatures
updated, |product| implements a system service,
``carbonio-avdb-updater``.

To install it, login to the **Proxy Node**, then update the list of
packages to make sure the latest version is picked up, and install the
updater

.. code:: console

   # apt-get update && apt-get install carbonio-avdb-updater

Verify Signature Status
~~~~~~~~~~~~~~~~~~~~~~~

In order to verify that the service is working and signatures are
updated, you can check the service's log.

.. code:: console

   # journalctl -u carbonio-avdb-updater.service

If the signatures are updated, you will find in the log a block
similar to::

   Oct 18 09:28:25 srv2.example.com systemd[1]: Started Carbonio anti-virus updater
   ..
   Oct 18 09:28:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:28.028 [AVDB Scheduler_Worker-1] INFO  com.zextras.avdb.jobs.AvdbJob - ********************* S T A R T I N G ********************
   Oct 18 09:28:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:28.039 [pool-1-thread-1] INFO  c.z.a.client.networking.Downloader - download starting : /md5list.txt
   Oct 18 09:28:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:28.343 [pool-1-thread-1] INFO  c.z.a.client.networking.Downloader - download finished : /md5list.txt
   Oct 18 09:28:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:28.361 [ForkJoinPool.commonPool-worker-2] INFO  c.z.a.client.networking.Downloader - download starting : /securiteinfopdf.hdb
   Oct 18 09:28:29 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:29.594 [ForkJoinPool.commonPool-worker-2] INFO  c.z.a.client.networking.Downloader - download finished : /securiteinfopdf.hdb
   ..
   Oct 18 09:28:44 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:44.383 [pool-2-thread-1] INFO  c.z.a.client.networking.Downloader - download finished : /javascript.ndb
   Oct 18 09:28:51 srv2.example.com carbonio-avdb-updater[2628063]: 09:28:51.582 [AVDB Scheduler_Worker-1] INFO  c.z.a.c.processing.ProcessExecutor - Added entry [/opt/zextras/bin/zmprov mcf +carbonioClamAVDat>
   ..
   Oct 18 09:29:48 srv2.example.com carbonio-avdb-updater[2628063]: 09:29:48.930 [AVDB Scheduler_Worker-1] INFO  com.zextras.avdb.jobs.AvdbJob - ********************* F I N I S H E D ********************

.. note:: The above snippet it shortened for clarity.

The important information here are the **S T A R T I N G** and **F I N
I S H E D** messages, which sign the start and successful termination
of the signature update process.
The same two messages are present if no update is available and
downloaded::

  Oct 18 09:34:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:34:28.017 [AVDB Scheduler_Worker-1] INFO  com.zextras.avdb.jobs.AvdbJob - ********************* S T A R T I N G ********************
  Oct 18 09:34:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:34:28.019 [pool-21-thread-1] INFO  c.z.a.client.networking.Downloader - download starting : /md5list.txt
  Oct 18 09:34:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:34:28.035 [pool-21-thread-1] INFO  c.z.a.client.networking.Downloader - download finished : /md5list.txt
  Oct 18 09:34:28 srv2.example.com carbonio-avdb-updater[2628063]: 09:34:28.039 [AVDB Scheduler_Worker-1] INFO  com.zextras.avdb.jobs.AvdbJob - ********************* F I N I S H E D ********************

.. card:: The update process in detail

   The signature update service maintains a list of the
   files/databases it downloads and their md5 checksums (*md5sum*) in
   file :file:`/opt/zextras/av_signatures/md5list.txt`, which is also
   referenced from the LDAP. All the downloaded databases are stored
   under the same :file:`/opt/zextras/av_signatures/` directory.

   The first task that the updater carries out is to download the
   :file:`md5list.txt` file and verify the md5sums of the signature
   databases; a new signature database is downloaded only when the
   md5sum in the file does not match the one of the local file. This
   also means that if a signature database is not present (e.g.,
   because it was deleted by mistake), it will be automatically
   downloaded.

   A new database can be added by simply adding a new database and its
   md5sum in the :file:`/opt/zextras/av_signatures/md5list.txt` file,
   while removing an entry from that file will make it unavailable to
   ClamAV.
