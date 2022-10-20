.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _videoserver:

======================
 Zextras Video Server
======================

The Zextras Video Server is a WebRTC stream aggregator that improves
Team’s performance by merging and decoding/re-encoding all streams in a
Meeting.

While the default WebRTC creates one incoming and one outgoing stream
per meeting participant, with the Zextras Video Server, each client will
only have one aggregated inbound stream and one aggregated outbound
stream. This applies for both video and audio.

.. card:: Example

   In our simple scenario, 5 people are participating in a meeting.

   - Without Video Server: each client generates 4x outgoing
     video/audio streams and receives 4 incoming video/audio streams

   - With Video Server: each client generates 1 outgoing video/audio
     stream and receives 1 incoming video/audio stream

   In summary:
   
   +----------------------+------------------------+-----------------------+
   | Video Server         | Incoming Connections   | Outgoing Connections  |
   +======================+========================+=======================+
   | No                   | 4 (1 *from* each other | 4 (1 *to* each other  |
   |                      | client)                | client)               |
   +----------------------+------------------------+-----------------------+
   | Yes                  | 1                      | 1                     |
   +----------------------+------------------------+-----------------------+

By default, the Video Server uses conservative Codecs (VP8 and Opus) to
ensure the broadest compatibility, but more codecs can be enabled. It
also splits the Webcam and Screen Sharing streams and reserves the same
bandwidth for both.

A properly set up Video Server will supersede the need of a TURN server,
provided that all clients can reach the Video Server’s public IP and
that UDP traffic is not filtered.

.. _videoserver-requirements:

Requirements
============

The Zextras Video Server must be installed on a **dedicated server**
and has the following requirements:

.. grid::
   :gutter: 3

   .. grid-item-card::
      :columns: 4
                
      System
      ^^^^^

      -  Minimum 4 CPU cores, suggested at least 8 to handle more than 100
         users at the same time

      -  1024mb of ram + 1mb of ram for each connected user

      .. hint::

         The Zextras Video Server mainly scales on the CPU, so more CPU cores
         and power means more connected users.

   .. grid-item-card::
      :columns: 4
                
      Network
      ^^^^^

      -  A public IP

      -  A publicly resolvable FQDN

      -  With the default settings, 200kb/s (0.2 mb/s) bandwidth for each
         connected user

      -  WebSockets

   .. grid-item-card::
      :columns: 4

      Ports
      ^^^^

      -  The mailbox server will establish a WebSocket on port 8188 (TCP) to
         communicate with the Video Server

      -  Clients will use a random UDP port between 20000 and 40000 on
         the public IP of the |vs|

.. warning::

   The Video Server installer requires the fully qualified hostname to
   be correctly configured in :file:`/etc/hosts` and
   :file:`/etc/hostname`.  Failing to comply will likely cause the
   sample commands provided at the end of the installation to be
   incorrect.

.. _client_configuration:

Client Configuration
====================

No client configuration is needed, as the Team Zimlet will autonomously
detect whether a video server is set up an use it if available.

.. _installation:

Installation
============

- Download the installer package for the Linux distribution on which
  |suite| is installed (`RHEL 7 and CentOS 7
  <https://download.zextras.com/videoserver-installer/latest/videoserver-r7.tgz>`_
  :octicon:`dash` `RHEL 8 and CentOS 8
  <https://download.zextras.com/videoserver-installer/latest/videoserver-r8.tgz>`_
  :octicon:`dash` `Ubuntu 18.04
  <https://download.zextras.com/videoserver-installer/latest/videoserver-u18.tgz>`_)

- Copy the installer package to the server

- Unpack the installer package, adapting the name in the example
  below by repacing ``[OS]`` with the proper string: **r7**, **r8**,
  or **u18** :

  .. code:: console
             
     # tar zxvf videoserver-[OS].tgz

- Enter the unpacked directory: ``cd videoserver-installer``

- Run the installation script: ``./install.sh``

  .. code:: console

     ~/videoserver-installer# ./install.sh

  This script will install Zextras Video Server, and all its runtime
  dependencies onto the running system.


  System will be modified, would you like to proceed? [Y]

- The installer will first checks for the needed dependencies and
  installs any missing one, if found. A message like::

    software-properties-common not found. Would you like to install it? [Y]

  Press :bdg-dark-line:`Y` to install them
   
- You will be then prompted to install the actual Video Server
  packages::

    Would you like to install Zextras VideoServer? [Y]

  Again, press :bdg-dark-line:`Y` to install them

- Once all packages are installed, you will be asked the **Public IP
  Address** of the video server.

  .. hint:: The **Public IP Address** is either the IP address of the
     video server, if it is directly accessible from remote clients on
     the Internet, or—​if there is a NAT-ting device in front of it
     (e.g., a firewall or router)--the IP address with which the video
     server is reachable.

  This is the only bit of configuration required. The installer will
  set up the Video Server and then return two commands that must be
  executed on any Mailbox Server of the infrastructure to set up the
  connection with the Video Server and enable it for all servers::

    Please execute these commands in a mailbox node as zimbra user
    to complete the setup of the video server:

  Copy and execute them, and refer to :ref:`zextras_team_full_cli` for
  details about the syntax and additional options in case you want to
  customise it.

.. _architecture_and_service_control:

Architecture and Service Control
================================

A Team meeting is hosted **on one mailbox**, which also keeps the state
of the meeting. It is a responsibility of that mailbox to communicate
with a videoserver instance to start a meeting and controlling it.

Therefore, each mailbox has its own connection pool, which can be
controlled via the :ref:`zextras_team_full_cli`. The commands to
control the service are straightforward:

-  Start the connection pool::

     zxsuite team doStartService team-videoserver-pool

-  Shutdown the connection pool::

     zxsuite team doStopService team-videoserver-pool

-  Check a connection pool status. This command reports information
   about the node *on which it is executed*.

   .. code:: console

      $ zxsuite team clusterstatus

           isFullySynced                                       true
           servers
           meeting_servers
               <ip_videoserver>:8188
                   id                                           123
                   hostname                                     <ip_videoserver>:8188
                   status                                       online  
                   last_failure                                         
                   local_meetings_hosted                        2       

   The output of this command contains this information:
   
   - Should the remote Video Server be offline or unreachable, the
     status will be **offline** instead of **online**.

   - ``last failure`` shows an error message (e.g., *Unauthorized
     request (wrong or missing secret/token)* or a generic *Runtime
     Exception*) if the last connection attempt to the videoserver was
     unsuccessful. The message is cleared when the connection is
     successful.

   - ``local_meetings_hosted`` reports the number of meetings hosted
     on the *current mailbox*.

.. _video_server_scaling:

Video Server Scaling
====================

Starting with Zextras Suite 3.1.8 (Video Server package version 0.10.5)
it is possible to run multiple videoservers on the same infrastructure.

To add a new Video Server to the configuration, run the Video Server
installer on a new server and follow the instructions - the installer
will provide the required commands (``zxsuite team video-server add``
with the appropriate parameters) needed to add the server to the
infrastructure once packages are installed.

To remove a Video Server from the configuration, use the
``zxsuite team video-server remove`` command from any mailbox server -
this will remove the appropriate entries from the Zextras Config (manual
package removal on the video server is required).

.. warning:: When using multiple video servers, meetings are instanced
   on any of the available instances. 

.. _cli_commands:

CLI Commands
------------

The CLI command to manage Video Server installations is ``zxsuite
team`` with the parameter ``video-server`` and the parameters
:ref:`video-server add <zxsuite_team_video-server_add>` and
:ref:`video-server remove <zxsuite_team_video-server_remove>`
respectively.

Quick reference:

.. code:: console

   # zxsuite team video-server add *videoserver.example.com* [param VALUE[,VALUE]]

   # zxsuite team video-server remove *videoserver.example.com* [param VALUE[,VALUE]]

.. _bandwidth_and_codecs:

Bandwidth and Codecs
====================

.. _video_bandwidth:

Video Bandwidth
---------------

The administrator can set the webcam stream quality and the screenshare
stream quality specifing the relative bitrate *in Kbps*. The values must
be at least 100 Kbps and can be increased as desired.

Higher values mean more quality but more used bandwidth.

-  ``zxsuite config global set attribute teamChatWebcamBitrateCap value 200``:
   is the command for the webcam stream quality/bandwidth

-  ``zxsuite config global set attribute teamChatScreenBitrateCap value 200``:
   is the command for the screenshare stream qualitybandwidth

.. tip::

   By default both the webcam bandwidth and the screen sharing bandwidth
   are set to 200 Kbps.

.. _video_codecs:

Video Codecs
------------

By default, the VP8 video codec is used. This is to ensure the best
compatibility, as this codec is available in all supported browsers, but
other codecs can be enabled:

-  AV1:
   ``zxsuite config global set attribute teamChatVideoCodecAV1 value true``

-  H264:
   ``zxsuite config global set attribute teamChatVideoCodecH264 value true``

-  H265:
   ``zxsuite config global set attribute teamChatVideoCodecH265 value true``

-  VP8:
   ``zxsuite config global set attribute teamChatVideoCodecVP8 value true``

-  VP9:
   ``zxsuite config global set attribute teamChatVideoCodecVP9 value true``

Only one codec can be enabled at the time, so before enabling a new
codec remember to disable the previous one using the same command as the
one in the list above but substituting ``value true`` with
``value false``.

.. container:: informalexample

   E.g. to enable the H264 codec run:

   ``zxsuite config global set attribute teamChatVideoCodecVP8 value false``

   ``zxsuite config global set attribute teamChatVideoCodecH264 value true``

.. _audio_codec:

Audio Codec
-----------

The audio codec used by the Zextras Video Server is Opus. No other
codecs are supported, as Opus is currently the only reliable one
available across all supported browsers.

.. _advanced_settings:

Advanced settings
=================

The following settings influence the audio experience.

.. _audio_quality:

Audio Quality
-------------

The administrator can set the Opus audio quality by setting the sampling
rate (in Hz) in the ``teamChatAudioSamplingRate`` global attribute.

The available values are:

-  8000 → represents the narrowband bandwidth

-  12000 → represents the mediumband bandwidth

-  16000 → represents the wideband bandwidth (**default**)

-  24000 → represents the superwideband bandwidth

-  48000 → represents the fullband bandwidth

.. seealso::

   `Wikipedia page on Opus
   <https://en.wikipedia.org/wiki/Opus_(audio_format)#Bandwidth_and_sampling_rate>`_
   

.. _audio_sensitivity:

Audio Sensitivity
~~~~~~~~~~~~~~~~~

The administrator can optimize the audio sensitivity with these two
commands:

``zxsuite config global set attribute teamChatAudioLevelSensitivity value 25``

``zxsuite config global set attribute teamChatAudioSamplingSensitivityInterval value 2``

The audio level sensitivity defines how much the audio should be
normalized between all the audio sources. The value has a range between
0 and 100 where 0 represents the audio muted and 100 the maximum audio
level (too loud).

By default the value is set to **25**.

The audio sampling sensitivity interval defines the interval in seconds
used to compute the audio sensitivity level. By default the value is set
to 2 seconds, this means that the video server normalizes the audio
level considering the audio sources of the last 2 seconds.

The value should be at least **0**.
