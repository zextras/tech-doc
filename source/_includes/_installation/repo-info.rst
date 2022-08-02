.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. card::  Repository and Channels
   
   The following are important information concerning the packages
   repository |product| and its content. Please read them carefully,
   as they might save you some time in case of installation or upgrade
   problems and help you to provide more precise bug reports.

   The repository hosts simultaneously packages of two channels:

   * **Release Candidate (RC)**. Packages in this channel are made
     available as soon as they are built by |zx| development and
     tested by the QA team. While they are stable, they **are not
     suitable for a use in a production environment**, because they
     might still contain some bug, new functionalities that have not
     yet reached a production-level quality, or some broken
     dependencies might be introduced.

     Usually these problems are fixed within days or even hours, so in
     case just try again before you report some problem.

     Use this channel and its packages for testing (or demo)
     installations **only**.
     
   * **RELEASE**. This channel contains only packages that are stable
     and suitable for a production environment.

   .. hint:: When reporting a problem or opening a ticket, remember to
      always add the channel if you are using, as this helps us to
      analyse the problem quickly.


   .. rubric:: FAQ 

   #. I want to help testing things, which channel should I use?
      
      :octicon:`chevron-right` *RC* channel.

   #. I need to install Carbonio in a production environment which
      channel should I use?

      :octicon:`chevron-right` *RELEASE* channel.

   #. How will we be informed about new RC packages?
      
      :octicon:`chevron-right` There will be no notification, because
      RC channel is updated continuously.

   #. How will we be informed about a potential new release incoming?

      :octicon:`chevron-right` A red message on the homepage of the
      documentation site will notify you of the release of a new
      stable version.  You may also be informed through other means of
      communication such as email and social media.

   #. Could there be bugs in the packages downloaded from the RC
      channel?

      :octicon:`chevron-right` Yes, RC versions have a risk of
      containing bugs (which in some cases could lead to data loss).
      If you find a bug in an RC package we kindly ask you to report
      it on the appropriate community page.  We will try to resolve it
      as quickly as possible.
