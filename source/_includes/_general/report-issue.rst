Whenever a problems arise while using a software, resolving them and
going back to the normal daily activities as quick as possible is
always the first goal.

Therefore, the most efficient way to report a |carbonio| issue is the
one that allows both the *Reporter* and the *Technical Support Team*
to reach their common goal in the quickest and more robust way.

To do so, the starting point is to prepare an accurate and complete
report that describes the issue experienced, then open a ticket on
|zx| customer's support portal and attach the report to the ticket.
This allows the Technical Support Team to immediately look into the
issue without asking for more information.

Building a detailed report may require one or more of the following
activities:

* to describe the steps that allow to reproduce the problem. This is
  the most important point, because this would give the Technical
  Support Team a first idea about the possible root cause of the issue.
* to execute commands from the CLI
* to prepare screenshots
* to carry out other tasks that depend on the issue reported, the
  modules involved, and so on.
       
Before You Open a Ticket
~~~~~~~~~~~~~~~~~~~~~~~~

Before you open a Support Ticket, you should gather some information
and configuration values from |product| and its Components, to collect
the information that will be relevant for the Technical Support Team.

This section focuses on how to retrieve this information: You need to
provide existing log files and the output of some commands and scripts
(see next sections) that need to be executed from the command
line. Please note that, **unless stated otherwise**:

* In the case of Multi-Server installations, commands must
  be executed on the node where the Component is installed

* Log files are located under the :file:`/opt/zextras/log/` directory

.. hint:: Remember that the most information you are able to provide,
   the quicker the Technical Support Team will help you restore the
   everyday activities of your |carbonio| installation.

.. card:: Issues, enquiries, or complaints with licensing

   While at |zx| we do our best to provide the fairest licensing model
   possible, we know it may not fit for every customer. If you feel
   that the Zextras Licensing does not suit your needs and wish to let
   us know your opinion, please contact the Sales Team through the
   form you can find at https://www.zextras.com/contact-us

General And Common Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The general and common information are needed in every case:
this kind of data allows to understand the scenario in which the
issue was experienced. You need to save the output of each of
the following commands to a text file.

.. code:: console

   zextras$ zmcontrol -v

.. code:: console

   zextras$ carbonio --host all_servers core getVersion

.. code:: console

   zextras$ carbonio core getLicenseInfo

.. code:: console

   zextras$ zmprov gas

.. code:: console

   zextras$ zmprov gas mailbox

.. code:: console

   zextras$ systemctl status carbonio-*

.. code:: console

   zextras$ journalctl


.. hint:: To save the output of to a text file, you use the
   :command:`>` operator, for example

   .. code:: console

      zextras$ zmcontrol -v > zmcontrol.txt

An additional task that help the Technical Support Team is to
enable debug logging, then attach to the ticket the log files
generated:

#.  increase the log verbosity on the mailbox server by running

    .. code:: console

       zextras$ carbonio config server set $(zmhostname) \
       attribute ZxCore_LogLevel value 0

#. Reproduce the issue

#. Restore the normal log verbosity by running

   .. code:: console

       zextras$ carbonio config server set $(zmhostname) \
       attribute ZxCore_LogLevel value 1

Once done, the log files to attach are:

* :file:`mailbox.log` file from the mailbox server

* The :file:`nginx.log` and the :file:`nginx.access.log` files from
  the Proxy Node

Mobile And Mobile Apps
~~~~~~~~~~~~~~~~~~~~~~

Follow these steps on an e-mail account and a mobile device, then
attach the log files that will be produced during the procedure.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Procedure
      :columns: 6
                
      #. Activate an account logger in debug mode on one of the affected
         devices using the command

         .. code:: console

            zextras$ carbonio mobile doAddAccountLogger user@domain.tdl
            debug /path/to/log/file.log

      #. Remove the account from the device
      #. Add the account on the device again
      #. Try to reproduce the issue

   .. grid-item-card:: Files and information to attach
      :columns: 6

      * The `mailbox.log` and the `sync.log` files 
      * A brief explanation of how to reproduce the issue
      * Manufacturer, model and exact OS version of the mobile device
      * The output of the following commands, making sure to replace
        the uppercase parameters with the e-mail account and the ID of
        the device
        
        .. code:: console

           zextras$ carbonio mobile getDeviceList JACK.SMITH@ACME.EXAMPLE
           
        .. code:: console

           zextras$ carbonio mobile getDeviceInfo JACK.SMITH@ACME.EXAMPLE DEVICEID
        
|team|
~~~~~~

In you experience problems with |team|, collect the output of the
following commands. Replace `JACK.SMITH@ACME.EXAMPLE` with one
affected account. You can also set up a test account without
Administrator privileges and repeat the commands.

.. code:: console
          
   zextras$ carbonio config dump global


.. code:: console
          
   zextras$ carbonio chats clusterStatus

.. code:: console
          
   zextras$ carbonio chats getServices

.. code:: console
          
   zextras$ carbonio chats iceServer get


.. code:: console
          
   zextras$ for cos in $(carbonio prov gac); do carbonio prov gc $cos; done


.. code:: console
          
   zextras$ carbonio prov ga JACK.SMITH@ACME.EXAMPLE


.. code:: console
          
   zextras$ for cos in $(carbonio prov gac);
   do echo $cos;
   carbonio config cos get $cos;
   done

.. code:: console
          
   zextras$ carbonio config account get JACK.SMITH@ACME.EXAMPLE

.. code:: console
          
   zextras$ for dom in $(carbonio prov gad);
   do carbonio prov gd $dom zimbraPublicServiceProtocol \
   zimbraPublicServiceHostname zimbraPublicServicePort;
   done

.. code:: console
          
   zextras$ carbonio powerstore getAllVolumes

Also attach to the ticket the following files.

* the `mailbox.log` file relative to a restart of the mailboxd with `zmmailboxdctl restart`
* the `mailbox.log`, the `zmmailboxd.out`, the `nginx.log` and
  `nginx.access.log` files relative to the last two days

|file|
~~~~~~

In case of issues with |file|, provide the output of this script

.. code:: console
          
   zextras$ for dom in $(carbonio prov gad); 
   do carbonio prov gd $dom zimbraPublicServiceProtocol 
   zimbraPublicServiceHostname zimbraPublicServicePort; 
   done
   
Also provide the :file:`/var/log/carbonio/files/files.log` and
:file:`/var/log/carbonio/docs-connector/docs-connector.log` files

|storage|
~~~~~~~~~

In the case of |storage|, you need to provide also some information
about the storage infrastructure (volumes, disks) of |product|

.. code:: console
          
   zextras$ mount
   
.. code:: console
         
   zextras$ df -h
   
.. code:: console
          
   zextras$ df -i

Then, collect information about the configuration of |storage|

.. code:: console
          
   zextras$ carbonio powerstore getAllVolumes

.. code:: console
          
   zextras$ carbonio powerstore getHsmPolicy

.. code:: console
          
   zextras$ carbonio powerstore getMovedMailboxes
   
.. code:: console
          
   zextras$ carbonio powerstore getNonLocalMailboxes

.. code:: console
          
   zextras$ carbonio config dump server $(zmhostname)

|Backup|
~~~~~~~~

Like for |storage|, first get a few environmental information

.. code:: console
          
   zextras$ mount

Then find the Backup Path and other configuration:

.. code:: console
          
   zextras$ ls -l $(carbonio config dump server $(zmhostname) | grep ZxBackup_DestPath | tr -s ' ' | cut -d ' ' -f 3)

.. code:: console
          
   zextras$ carbonio config dump server $(zmhostname)

.. code:: console
          
   zextras$ carbonio backup getBackupInfo

Client-side issues
~~~~~~~~~~~~~~~~~~

In case you experience a client-side issue, follow this procedure to
collect the relevant information:

* Open a new browser (Chrome or Firefox) window
* Open the Javascript Console (:kbd:`Ctrl + Shift + j` on Windows and
  Linux, :kbd:`Cmd + Opt + j` on OSX)
* Access the webmail from the same tab the Javascript Console has been
  opened on
* Wait for the webmail to load completely
* Reproduce the issue
* Go to the *Console* tab of the Javascript Console, right-click
  anywhere and select **Save as...** to save the content of the tab as
  a text file
* Go to the *Network* tab of the Javascript Console, right-click
  anywhere and select **Save as HAR with content** to save the content
  of the tab as a text file
* Attach both files with the console export and the network export to
  the ticket.
