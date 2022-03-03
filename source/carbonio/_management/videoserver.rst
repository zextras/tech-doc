.. _videoserver:

|vs|
====

The |vs| is a WebRTC stream aggregator that improves |team|\ 's
performance by merging and decoding/re-encoding all streams in a
Meeting.

While the default WebRTC creates one incoming and one outgoing stream
per meeting participant, with the |vs|, each client will
only have one aggregated inbound stream and one aggregated outbound
stream. This applies for both video and audio.

.. card:: Example

   In our simple scenario, 5 people are participating in a meeting.

   - Without |vs|: each client generates 4x outgoing
     video/audio streams and receives 4 incoming video/audio streams

   - With |vs|: each client generates 1 outgoing video/audio
     stream and receives 1 incoming video/audio stream

   In summary:
   
   +----------------------+------------------------+-----------------------+
   | |vs|                 | Incoming Connections   | Outgoing Connections  |
   +======================+========================+=======================+
   | No                   | 4 (1 *from* each other | 4 (1 *to* each other  |
   |                      | client)                | client)               |
   +----------------------+------------------------+-----------------------+
   | Yes                  | 1                      | 1                     |
   +----------------------+------------------------+-----------------------+

By default, the |vs| uses conservative Codecs (VP8 and Opus) to
ensure the broadest compatibility, but more codecs can be enabled. It
also splits the Webcam and Screen Sharing streams and reserves the same
bandwidth for both.

A properly set up |vs| will supersede the need of a TURN server,
provided that all clients can reach the |vs|’s public IP and
that UDP traffic is not filtered.

.. _videoserver-requirements:

Requirements
------------

The |vs| must be installed on a **dedicated server** and has the
following requirements:

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

         The |vs| mainly scales on the CPU, so more CPU cores
         and power means more connected users.

   .. grid-item-card::
      :columns: 4
                
      Network
      ^^^^^

      - A public IP address. This is either the IP address of |vs|, if
        it is directly accessible from remote clients on the Internet,
        or—​if there is a NAT-ting device in front of it (e.g., a
        firewall or router)--the IP address with which the |vs| is
        reachable.

      -  A publicly resolvable FQDN

      -  With the default settings, 200kb/s (0.2 mb/s) bandwidth for each
         connected user

      -  WebSockets

   .. grid-item-card::
      :columns: 4

      Ports
      ^^^^

      -  The mailbox server will establish a WebSocket on port 8188 (TCP) to
         communicate with the |vs|

      -  Clients will use a random UDP port between 20000 and 40000

.. warning:: The |vs| installer requires the fully qualified hostname
   to be correctly configured in :file:`/etc/hosts` and
   :file:`/etc/hostname`.  Failing to comply will likely cause the
   sample commands provided at the end of the installation to be
   incorrect.

.. _installation:

Installation
------------

Installing |vs| is straightforward. Assuming |carbonio|'s repository
have already been configured, simply execute the two commands

.. code:: console

   # apt update
   # apt install carbonio-videoserver

Once the package has been successfully installed, you will be asked
the **Public IP Address** of |vs|: this is the only bit of
configuration required.

After you have entered the IP address, you will be prompted to execute
a command on each node of the |product| installation:

.. code:: console

   # zxsuite chats video-server add example.com port 8100 A_SECRET_PASSWORD

Replace `example.com` with the actual domain name and
`A_SECRET_PASSWORD` with a robust password.
   
In case you forget the password, you can retrieve it using

.. code:: console

   # /etc/janus/janus.jcfg api_secret

.. _architecture_and_service_control:

Architecture and Service Control
--------------------------------

A |team| meeting is hosted **on one mailbox**, which also keeps the state
of the meeting. It is a responsibility of that mailbox to communicate
with a videoserver instance to start a meeting and controlling it.

Therefore, each mailbox has its own connection pool, which can be
controlled via the `zextras_team_full_cli`. The commands to
control the service are straightforward:

-  Start the connection pool::

     zxsuite team doStartService team-videoserver-pool.

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
   
   - Should the remote |vs| be offline or unreachable, the
     status will be **offline** instead of **online**.

   - ``last failure`` shows an error message (e.g., *Unauthorized
     request (wrong or missing secret/token)* or a generic *Runtime
     Exception*) if the last connection attempt to the videoserver was
     unsuccessful. The message is cleared when the connection is
     successful.

   - ``local_meetings_hosted`` reports the number of meetings hosted
     on the *current mailbox*.

.. _video_server_scaling:

|vs| Scaling
--------------------

Multiple |vs| can be run on the same infrastructure.

To add a new |vs| to the configuration, run the |vs| installer on a
new server and follow the instructions - the installer will provide
the required commands (``zxsuite team video-server add`` with the
appropriate parameters) needed to add the server to the infrastructure
once packages are installed.

To remove a |vs| from the configuration, use the ``zxsuite team
video-server remove`` command from any mailbox server - this will
remove the appropriate entries from the Zextras Config (manual package
removal on the video server is required).

.. once beta is over?
   
.. warning:: When using multiple video servers, meetings are instanced
   on any of the available instances. Once the beta is over, load
   balancing rules will be enacted.

.. card::

   CLI Commands
   ^^^^

    The CLI command to manage |vs| installations is :command`zxsuite
    team` with the sub-command ``video-server`` and the parameters
    `add` and `remove`.

   ..
      The CLI command to manage |vs| installations is ``zxsuite
      team`` with the parameter ``video-server`` and the parameters
      `video-server add <zxsuite_team_video-server_add>` and
      `video-server remove <zxsuite_team_video-server_remove>`
      respectively.

   Quick reference:

   .. code:: console

      # zxsuite team video-server add *videoserver.example.com* [param VALUE[,VALUE]]

      # zxsuite team video-server remove *videoserver.example.com* [param VALUE[,VALUE]]

.. _bandwidth_and_codecs:

Bandwidth and Codecs
--------------------

.. grid::
   :gutter: 3

   .. grid-item-card::
      :columns: 4

      Video Bandwidth
      ^^^^^

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

   .. grid-item-card::
      :columns: 4

      Video Codecs
      ^^^^

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

   .. grid-item-card::
      :columns: 4

      Audio Codec
      ^^^^

      The audio codec used by the |vs| is Opus. No other codecs are
      supported, as Opus is currently the only reliable one available across
      all supported browsers.

      .. seealso::

         `Wikipedia page on Opus
         <https://en.wikipedia.org/wiki/Opus_(audio_format)#Bandwidth_and_sampling_rate>`_

.. _advanced_settings:

Advanced settings
-----------------

The following settings influence the audio experience.

.. grid::
   :gutter: 3

   .. grid-item-card::
      :columns: 6

      Audio Quality
      ^^^^

      The administrator can set the Opus audio quality by setting the sampling
      rate (in Hz) in the ``teamChatAudioSamplingRate`` global attribute.

      The available values are:

      -  8000 → represents the narrowband bandwidth

      -  12000 → represents the mediumband bandwidth

      -  16000 → represents the wideband bandwidth (**default**)

      -  24000 → represents the superwideband bandwidth

      -  48000 → represents the fullband bandwidth

   .. grid-item-card::
      :columns: 6

      Audio Sensitivity
      ^^^^

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
