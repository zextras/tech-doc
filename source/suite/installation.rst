================================
Zextras Suite Installation Guide
================================

:Date:   2021-10-20

.. contents::
   :depth: 3
..

This section contains various information—​requirements, configuration
details, and guidelines—​for a successful installation of Zextras Suite.
Please read carefully next section, `Basic Information <#basic-info>`_,
to make sure you do not miss any important piece required to set up
Zextras Suite.

.. _basic-info:

Basic Information
=================

.. _prerequisites:

Prerequisites
-------------

To use the Zextras suite, no additional software beyond what’s required
by a standard Zimbra deployment is necessary in order to install Zextras
Suite. If you did not yet install Zimbra, you can check `Zimbra’s System
Requirements <https://zimbra.github.io/installguides/latest/single.html#System_Requirements>`_.

If you plan to use either `./drive.xml <./drive.xml>`_,
`./team.xml <./team.xml>`_, or both, you need some additional setup.
These two apps, indeed, need to communicate using web sockets on ports
**tcp 8742** and **tcp 8743** respectively, therefore you need to edit
file ``/opt/zimbra/conf/nginx/includes/nginx.conf.web`` to include the
following code.

::

   upstream zx
       {
           server    mail.example.com:8742 fail_timeout=5s version=8.8.15_GA_20201272; 
           zmauth_zx;
       }
       #  Define the collection of upstream HTTPS servers to dedicated zx ssl port of jetty
       upstream zx_ssl
       {
           server    mail.example.com:8743 fail_timeout=5s version=8.8.15_GA_20201272; 
           zmauth_zx;
       }

-  replace *mail.example.com* with your server.

..

   **Note**

   In the reminder of this installation guide, all commands **must** be
   executed as ``root``, unless differently specified

.. _minimum_requirements_and_tweaking:

Minimum Requirements and Tweaking
---------------------------------

If you are interested in resources optimization and tweaking, we suggest
to read the following article on the Zimbra wiki, which despite the
title applies to both large and small deployments:
http://wiki.zimbra.com/wiki/Performance_Tuning_Guidelines_for_Large_Deployments.

Another strict requirement is the composition of the Zimbra IDs in the
system, which can only contain the following characters up to a maximum
length of 64:

-  Lowercase and uppercase letters

-  Number

-  The following symbols: \_ - # ( ) = @

Zimbra IDs containing other characters than the allowed ones will likely
cause problems to the Mobile module and possibly to other modules as
well.

.. _installation_possibilities:

Installation possibilities
--------------------------

These are the alternatives to install Zextras:

-  single-store installation on a single server. This is the easiest and
   is described in Section `Quick Installation
   Guide <#quick-installation>`_.

-  single-store installation on a multiserver. This approach is
   equivalent to the previous one and applies when the installation is
   in a multiserver installation, see `Installing Zextras Suite on a
   Single-store infrastructure <#setup-single-store>`_.

-  multistore installation: This approach is required if yuo need to ru
   multiple ``mailboxd`` services, see `Installing Zextras Suite on a
   Multistore infrastructure <#setup-multiserver>`_

.. _components:

Components
----------

Zextras Suite is comprised of three major components:

-  **Zextras Core**, abbreviated as *Core*, which is a jar package
   extending Zimbra

-  **Zextras Administration Zimlet**, abbreviated as Zextras Suite
   Zimlet or just Zimlet, an administrative zimlet to access and manage
   the Core.

-  **ZAL** - An Open Source abstraction layer for Zimbra. Please read
   `these advises <#setup-zal>`_ about ZAL insallation.

The installation script follows the aforementioned structure allowing
you three installation targets: **core**, **zimlet**, and **all**. The
latter is equivalent of installing *Core* and immediately afterwards
*zimlet*.

.. _other_zextras_zimlets:

Other Zextras Zimlets
---------------------

While the Zextras Suite package includes the Zextras Administration
Zimlet, the Zextras Client Zimlet must be deployed separately. Check
section `Zxclient <#zxclient>`_ at the bottom of this page for
directions

.. _where_to_get_the_zextras_suite_package:

Where to get the Zextras Suite package
--------------------------------------

The Zextras Suite installer can be obtained from the `download
section <https://www.zextras.com/download>`_ of zextras' website, while
*existing customers* will be able to find `a direct download
link <https://www.zextras.com/download-customer/>`_ after logging in
with their Zextras Store account.

.. _setup_information:

Setup Information
=================

This section contains general information about the set up of the
system, installation troubleshooting, and important advices about the
upgrade to new version of both Zimbra and Zextras.

.. _setup-zal:

ZAL - an Abstraction Layer for Zimbra
-------------------------------------

The Zextras Abstraction Layer (**ZAL**) is an Open Source abstraction
layer created to allow any extension to easily communicate with Zimbra
Collaboration Suite, regardless of the version in use.

It is released under the GPL license and thus cannot be included in the
Zextras Suite package, but during the installation process the *Zextras
Installer* will automatically detect the most appropriate library
version and will download and install it autonomously.

   **Note**

   Should the automatic download fail, the installation will end.
   However, a direct download link will be provided: the downloaded file
   must be renamed to **zal.jar** and copied into the *packages/*
   subdirectory of the Zextras Suite installation package. A restart of
   the installer will detect the new file and install it along with
   Zextras Suite.

.. _dos-filter:

The Zimbra DoS Filter
---------------------

Starting from Zimbra 8.0.0, a connection throttling mechanism called
**DoS Filter** has been added in order to reduce the impact of Denial of
Service attacks. By default the DoS Filter only allows **30 connections
per second**, rejecting any exceeding connection with a *503* HTTP
error.

.. _how_the_dos_filter_can_affect_your_zextras_suite_experience:

How the DoS Filter can affect your Zextras Suite experience
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Being an Administrative Zimlet, the Zextras Administration Zimlet is
loaded upon logging into the Zimbra Administration Console; in order to
retrieve all relevant data, many requests are done and this can trigger
Zimbra’s DoS Filter, causing slowness, AJAX Errors, and general UI
corruption (e.g. empty text boxes or incoherent checkbox state).

DoS Filter warnings can be found and identified in the log file
``/opt/zimbra/log/zmmailboxd.out``, where messages like the following
one can be found:

::

   2021-03-31 10:01:51.917:WARN:oejs.DoSFilter:qtp1027591600-
   190:https://192.168.73.35:7071/service/admin/soap/GetAllZimletsRequest:
   DOS ALERT: Request rejected ip=192.168.73.73, session=null, user=null

.. _managing_the_dos_filter:

Managing the DoS Filter
~~~~~~~~~~~~~~~~~~~~~~~

There are 3 different configuration properties controlling the DoS
Filter:

-  `zimbraHttpDosFilterDelayMillis <#dosfilter-delay>`_

-  `zimbraHttpDosFilterMaxRequestsPerSec <#dosfilter-mrs>`_

-  `zimbraHttpThrottleSafeIPs <#dosfilter-wl>`_

Each attribute is inherited from global or is configurable at the server
level.

   **Tip**

   The recommendation is to preserve the default configuration whenever
   possible.

**DoSFilter Delay (milliseconds) - zimbraHttpDosFilterDelayMillis.**

Delay is enforced on all requests over the rate limit, before they are
considered at all.

-  **-1** = Reject request

-  **0** = No delay

-  **Any** other integer value = Delay in ms

The default is *-1*.

To modify in the global configuration (e.g. set the delay to 20ms):

::

   zmprov mcf zimbraHttpDosFilterDelayMillis 20

**DoSFilter Maximum Requests Per Second -
zimbraHttpDosFilterMaxRequestsPerSec.**

Maximum number of requests per second from a connection. All requests in
excess of this value are throttled. The default is 30 and the minimum is
1.

To set the maximum number for requests in the global configuration:

::

   zmprov mcf zimbraHttpDosFilterMaxRequestsPerSec 100

**DoSFilter IP Addresses Whitelist - zimbraHttpThrottleSafeIPs.**

IP addresses to ignore when applying Jetty DosFilter. While this
attribute does not have a default value, nonetheless these loopback IPs
are whitelisted by default:

-  127.0.0.1

-  ::1

-  0:0:0:0:0:0:0:1

-  All mailboxd servers

You can check if these hosts have been correctly whitelisted by the log
entry in ``/opt/zimbra/log/mailbox.log``. This log entry should contain
all of the default whitelisted hosts as well as any IPs added to
**zimbraHttpThrottleSafeIPs**:

::

   2021-03-09 10:33:47,772 INFO  [main] [] misc - DoSFilter: Configured
   whitelist IPs = 192.168.234.130,127.0.0.1,::1,0:0:0:0:0:0:0:1

See how to add single IP addresses or IP ranges in the `examples
below <#dosfilter-examples>`_.

   **Note**

   Proxy nodes should not need to be whitelisted, as long as the
   *Originating-IP feature* is correctly configured in ZCS, see
   https://wiki.zimbra.com/wiki/Log_Files#Logging_the_Originating_IP.

External hosts that makes SOAP requests for provisioning or any kind of
integration must be added to the IP whitelist to ensure DoSFilter does
not block some requests. This is also required whenever there are
network resources outside of Zimbra (like e.g., proxies, bouncers,
load-balancing servers, firewall, NATting devices) between the clients
and Zimbra). In any of these cases, please refer to the next sections
(`OIP Logging and non-Zimbra Proxies <#oip-logging-issue>`_ and `Modify
Nginx Templates Files for Correct OIP Logging <#nginx-templates-oip>`_)
for more information and directions.

IP addresses should be supplied in the multi-valued
**zimbraHttpThrottleSafeIPs** attribute.

   **Tip**

   Add to **zimbraHttpThrottleSafeIPs** your private networks and/or IP
   addresses behind which lay multiple clients.

**Examples in ZCS 8.7 or above**

The following command adds a single IP and an IP range too
**zimbraHttpThrottleSafeIPs**:

::

   zmprov mcf zimbraHttpThrottleSafeIPs 192.168.234.130/32 zimbraHttpThrottleSafeIPs 192.168.4.0/24

To append the values to an existing list of multi-valued
**zimbraHttpThrottleSafeIPs**:

::

   zmprov mcf +zimbraHttpThrottleSafeIPs 192.168.234.130/32
   zmprov mcf +zimbraHttpThrottleSafeIPs 192.168.4.0/24

All of this properties require a mailboxd service restart in order for
any change to be applied

::

   zmmailboxdctl restart

.. _oip-logging-issue:

OIP Logging and non-Zimbra Proxies
----------------------------------

This section contains information useful whenever between a Client and
Zimbra there are proxies or other network devices that are able to
modify the request’s source IP address.

Mailboxd assigns OIP (**O**\ riginating Client **IP** Address) values
from the HTTP Request header field ``X-Forwarded-For``.

When a client connects to the Zimbra WebClient through an HTTP proxy or
a load balancer and once the traffic is intercepted between clients and
servers, the server’s access logs contain the IP address of the proxy or
load balancer only. To see the original IP address of the client, the
``X-Forwarded-For`` request header is used, whose general format is:

::

   X-Forwarded-For: <client>, <ext-proxy1>, <ext-proxy2>, ..., <ext-proxyN>

Here the values form a comma-separated list of the IP addresses:

-  the left-most (<client>) is the original client IP address

-  each successive IP address (<ext-proxy1>, <ext-proxy2>, …​) is a
   proxy that passed the request, adding the IP address where it
   received the request from.

-  the right-most IP address (<ext-proxyN>) is the IP address of the
   most recent proxy

Sample log entries:

::

   12020-08-26 10:00:38.074:INFO:oejs.DoSFilter:qtp1684106402-771:: Ignoring malformed remote address xxx.xxx.xxx.xxx,  yyy.yyy.yyy.yyy  
   22020-08-26 00:19:26.942:INFO:oejs.DoSFilter:qtp1874154700-1750041:: Ignoring malformed remote address xxx.xxx.xxx.xxx, yyy.yyy.yyy.yyy
   3
   42019-08-26 06:46:36,965 INFO  [qtp1874154700-1886919:] [name=john.doe@zimbrasupportlab.com.com;oip=xxx.xxx.xxx.xxx, yyy.yyy.yyy.yyy;ua=zclient/8.8.15_GA_1728;soapId=39504524;] soap - AuthRequest elapsed=1
   52020-08-26 07:27:53,459 INFO  [qtp1874154700-1900882:] [name=john.doe@zimbrasupportlab.com.com;mid=28;oip=xxx.xxx.xxx.xxx, yyy.yyy.yyy.yyy;ua=zclient/8.8.15_GA_1728;soapId=39505079;] gal - autocomplete: overall=296ms, ranking=227ms, folder=2ms, gal=67ms
   6
   72020-08-28 00:09:41.837:INFO:oejs.DoSFilter:qtp2036958521-120378:https:: Ignoring malformed remote address xxx.xxx.xxx.xxx, yyy.yyy.yyy.yyy
   82020-08-28 00:09:53.907:INFO:oejs.DoSFilter:qtp2036958521-120413:https:: Ignoring malformed remote address xxx.xxx.xxx.xxx, yyy.yyy.yyy.yyy

-  ``xxx.xxx.xxx.xxx`` is the IP address of the Originating client from
   where the request originated or was initiated.

-  ``yyy.yyy.yyy.yyy`` is the First Proxy server which will send request
   to another proxy server or the destination server.

..

   **Note**

   If there are multiple proxy servers, then the left most will always
   be the IP address of the Originating client. If there is only one
   proxy server which forwards request directly to destination server,
   then OIP will have only one entry (i.e. for Originating client IP).

.. _nginx-templates-oip:

Modify Nginx Templates Files for Correct OIP Logging
----------------------------------------------------

In order to properly log the OIP, Nginx templates must be modified.

   **Warning**

   These commands must be run as the **ROOT** user!

First, take a backup of existing Nginx conf directory.

::

   cp -pvr /opt/zimbra/conf/nginx /opt/zimbra/conf/nginx-`date +"%d-%m-%Y"`

Next, replace ``$proxy_add_x_forwarded_for`` with
``$http_x_forwarded_for`` in the all template files under
**/opt/zimbra/conf/nginx/templates**.

::

   sed -i 's/$proxy_add_x_forwarded_for/$http_x_forwarded_for/g' /opt/zimbra/conf/nginx/templates/*

..

   **Tip**

   Replacement must be checked and reapplied after every patch or zimbra
   proxy realated installation or upgrade.

Finally, restart the proxy service.

::

   zmproxyctl restart

..

   **Note**

   If multiple zimbra-proxy servers present in the setup, then make
   these changes on *all* zimbra-proxies.

Zimbra Upgrade
--------------

When Zimbra is upgraded, the Zextras Core is removed from the server, so
in case of a Zimbra upgrade, Zextras Suite must be reinstalled. All the
data and settings will be maintained, therefore after re-installing the
Zextras Suite, the set up will be exactly the same as before the Zimbra
upgrade.

   **Warning**

   Before upgrading your Zimbra server, please make sure that a
   compatible Zextras Suite version has been released. A Zextras Suite
   *compatibility release* is usually available within **48** hours
   after the release of a new Zimbra version.

.. _zimbra_patches:

Zimbra Patches
--------------

The information above only applies to **version upgrades**: installing a
Zimbra patch won’t affect Zextras Suite in any way and thus reinstalling
the package is not required.

.. _quick-installation:

Quick Installation Guide
========================

Installation can be carried out in a few steps:

1. Upload to your server the Zextras Suite package you downloaded

2. As the **root** user, unpack the file you just downloaded inside a
   directory (we suggest in /root/) in your Zimbra server: 'tar zxf
   zextras_suite-latest.tgz'

3. Enter the directory created by the unpacking of the file: 'cd
   zextras-suite'

4. Run the install.sh script with the **all** option (so './install.sh
   all').

5. The installer will take care of downloading the latest available
   Core, ZAL and Zimlets for your Zimbra version and start the
   installation.

.. _zextras_suite_on_multiserver_infrastructures:

Zextras Suite on Multiserver infrastructures
--------------------------------------------

Depending on the server roles in use, some additional precautions must
be taken:

.. _setup-single-store:

Installing Zextras Suite on a Single-store infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Installing Zextras Suite on a *multiserver infrastructure* including a
**single mailbox server** is just as easy as installing it on a
single-server infrastructure, as the software must only be installed on
servers running the ``mailboxd`` service.

.. _setup-multiserver:

Installing Zextras Suite on a Multistore infrastructure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Zextras Suite installation in a *Multistore infrastructure* featuring
**multiple mailbox servers** requires the following additional setup:

-  Zextras Suite must be installed on **ALL** the store servers (i.e.,
   the ones with the ``mailboxd`` service running)

-  Zextras Suite uses ports **8735** and **8736** for store-to-store
   communication, therefore make sure your servers can reach each other
   on these port and that the same ports is closed to outside traffic.

.. _detailed_instructions:

Detailed Instructions
=====================

Before installing Zextras Suite one will need to have downloaded the
package, as explained in the appropriate section above, and exploded the
archive in a directory of one’s choice.

.. code:: bash

   $ tar xfz zextras_suite-latest.tgz
   $ ls zextras_suite-latest.tgz zextras_suite/

Inside the directory ``zextras_suite`` one shall find an executable
shell script named ``install.sh``, that can be run as ``./install.sh
-h | ./install.sh [ -u ] [ -d ] all|theme|zimlet|core``. Go to that
directory and run it with ``-h`` to see a quick description of the
options:

.. code:: bash

   $ cd zextras_suite
   $ ./install.sh -h

   -h         This very message
   -d         Activates debug mode for the install script
   -u         Uninstall the target

   The targets available for (un)installation are:
   core   -- Zextras Suite Core
   theme  -- Zextras Suite Theme
   zimlet -- Zextras Suite Zimlet
   all    -- Zextras Suite Core followed by Zextras Suite Zimlet

   * In order to use Zextras Suite, both
   * Core and Zimlet need to be installed.

A Zextras Theme is automatically installed during a `Zextras Suite Full
Installation <#zx-full-install>`_ or `Zextras Suite Full
Upgrade <#zx-full-upgrade>`_, but also a standalone
``zextras-theme-installer`` script can be used to install an updated
version of the theme.

In order to successfully perform the Zextras suite installation, one
shall need to either become the ``root`` user or execute the script with
root privileges (e.g., using sudo).

Once launched, the script will determine the installed Zimbra version
and search for a preexisting installation of either Zextras Suite or
Zextras Migration Tool.

   **Warning**

   Should any component of Zextras Migration Tool be detected, you will
   be prompted to uninstall them and run again the Zextras Suite
   installation script afterwards.

Before proceeding with the installation, you will be required to accept
the EULA of Zextras, after which the actual installation shall take
place.

.. _zx-full-install:

Zextras Suite Full Installation
-------------------------------

In order to install Zextras Suite you need both Core and Zimlet to be
correctly deployed and operational. By choosing **all** as target, Core
and Zimlet will be installed in order, in one go.

Full installation:

``$ ./install.sh all``

You will need to restart Zimbra after the installation has successfully
completed. The script itself will prompt you to do so.

.. _zx-core-install:

Zextras Suite Core Installation
-------------------------------

In order to install Zextras Core you need to stop the Zimbra services
beforehand. This step can be achieved by either stopping them before
running the script, or having them stopped by the script when prompted.
Afterwards, the script will carry out a series of checks, including for
previous installation of Zextras Core and if needed, it will install the
jar file among the Zimbra extensions.

Core-only installation:

``$ ./install.sh core``

Once the Core has been deployed, Zimbra must be restarted to verify the
former’s correct operation.

   **Note**

   If you are using the **all** target to install both Core and Zimlet,
   the script itself will prompt to start Zimbra.

.. _zx-zimlet-install:

Zextras Suite Zimlet Installation
---------------------------------

Unlike the installation of Zextras Suite Core, in order to install the
Zextras Suite Zimlet you need Zimbra installed and its services running.
As in the Core Installation, you can either proceed manually beforehand
or let the script start them after prompting you to do so. Once Zimbra
is active the administrative zimlet will be deployed with the versions
matching Zimbra’s.

Zimlet-only installation:

``./install.sh zimlet``

.. _zx-full-upgrade:

Zextras Suite Full Upgrade
--------------------------

In case of an existing instance of Zextras Suite on your system, the
installation of a newer version will automatically perform an upgrade.
Please refer to the instructions above for the installation procedure.

If you just upgraded your Zimbra installation, please see the `Zimbra
Upgrade <#zimbra-upgrade>`_ section above.

.. _upgrading_zextras_suite_on_a_multiserver_infrastructure:

Upgrading Zextras Suite on a Multiserver infrastructure
-------------------------------------------------------

-  Upgrading Zextras Suite to a different **minor** release (e.g.
   **2.16.1** to **2.16.2**). Each separate server can be upgraded
   independently, and Zextras Suite will be fully functional even in an
   environment with mixed minor versions.

-  Upgrading Zextras Suite to a different **major** release (e.g.
   **2.14.x** to **2.16.x**). All servers should be upgraded at the same
   time, as in this case backwards compatibility is *not guaranteed* and
   Zextras Suite will not be fully functional until all nodes have been
   upgraded to the same version.

.. _zx-uninstall:

Zextras Suite Uninstallation
----------------------------

The removal procedure is almost identical to the installation one and
placing the ``-u`` switch before the target is all is needed. The script
will verify the presence of any Zextras Suite components and prompt for
their removal.

Therefore:

-  ``./install.sh -u all`` will uninstall both the Zextras Core and the
   Zextras Administration Zimlet

-  ``./install.sh -u core`` will uninstall the Zextras Core

-  ``./install.sh -u zimlet`` will uninstall the Zextras Administration
   Zimlet

.. _post_install_and_post_uninstall:

Post-Install and Post-Uninstall
===============================

After either installing or uninstalling Zextras Suite, it’s highly
suggested to clear both your browser’s and the server’s cache; the
latter task can be carried out by running the command:

``zmprov fc zimlet``

as the **zimbra** user.

   **Note**

   While the Zextras Suite package includes the Zextras Administration
   Zimlet, the *Zextras Client Zimlet* must be deployed separately.

.. _additional_components:

Additional Components
=====================

.. _zxclient:

Zextras Client
--------------

Zextras Client allows end users to access new Zextras Suite features,
along with some old ones which were previously available only in the
Zextras Administration Console.

The Zextras Client Zimlet is 100% free, it requires the Zextras Core to
be functional and its deployment is not mandatory. Once deployed, there
are several alternatives to *enable* it.

.. _deploy_the_zextras_client:

Deploy the Zextras Client
~~~~~~~~~~~~~~~~~~~~~~~~~

Deploying the Zextras Client Zimlet is easy, and can be done via either
the Zextras Administration Zimlet or the Zextras CLI in a few steps.

-  Log into the Zimbra Administration Console

-  Enter the **Core** section of the Zextras Administration Zimlet

-  Click on the **Deploy** button under *Zextras Client Zimlet*

-  Once deployed, the zimlet will appear in the deployed zimlets list as
   **com_zextras_client**.

-  Issue the dedicated Zextras CLI command
   ``zxsuite core doDeployClientZimlet``

Deploying the Zextras Client Zimlet on a **multiserver infrastructure**
requires the same steps as it does on single server environments. The
Zimlet is deployed in LDAP, so you’ll need to only deploy it once
regardless of the number of mailbox servers on your infrastructure.

.. _enable_the_zextras_client:

Enable the Zextras Client
-------------------------

In order to **enable** the Zextras Client Zimlet, after the deployment
the Zextras Client Zimlet will be only enabled for users belonging to
the default COS.

You can enable the Zextras Client Zimlet for your users in the following
ways:

1. Per user - through the *Zimlets* section of each user’s settings
   within the Zimbra Administration Console

2. Per COS - through the *Zimlets* section of each Class of Service’s
   settings within the Zimbra Administration Console

3. Via the Zimbra CLI through the ``zmzimletctl`` command

4. Updating the Zextras Client Zimlet

.. _update_the_zextras_client:

Update the Zextras Client
-------------------------

The Zextras Client Zimlet will be automatically updated by the Zextras
Installer when updating Zextras Suite. Should this update fail, manually
pressing the **Deploy** button mentioned above will install the latest
version available.

.. _remove_the_zextras_client:

Remove the Zextras Client
-------------------------

In order to **remove** the Zextras Client Zimlet, click the **Undeploy**
button next to the related entry in the *Configure → Zimlets* section of
the Zimbra Administration Console or via the Zimbra CLI through the
``zmzimletctl`` command.
