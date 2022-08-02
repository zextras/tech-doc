.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The Zextras Theme for the Zimbra WebClient is a modern-looking UI
theme 
designed for Zimbra Network Edition and Zimbra Open Source Edition.

It is both compatible with Zimbra 8 (8.6 and higher) and Zimbra 9.

.. table::
   
   +----------------------+----------------------+-----------------------+
   | |themelogin|         | |thememail|          | |themecal|            |
   +----------------------+----------------------+-----------------------+

.. |themelogin| image:: /img/theme/zextrastheme-login-imac.png                      
.. |thememail| image:: /img/theme/zextrastheme-mail-chat-imac.png
.. |themecal| image:: /img/theme/zextrastheme-calendar-imac.png


.. _availability:

Availability
------------

The Zextras Theme is included in Zextras Suite starting from version
3.1.5, so Zextras Suite users will just need to update their software to
obtain the theme.

Zimbra Network Edition and Zimbra Open Source Editon users who are not
also Zextras Suite users can freely download the theme from
https://www.zextras.com/zextras-theme-zimbra-interface/ and follow the
instructions below to install it manually.

.. warning:: If you downloaded the Zextras Installer package before
   November 30th, 2020 you will need to download it again in order for
   the option to install the Zextras Theme to appear.

.. _installation_guide:

Installation Guide
------------------

The Zextras Suite installer will take care of downloading and deploying
the theme.

Additionally, the theme can be manually downloaded and installed on all
compatible Zimbra Open Source Edition and Zimbra Network Edition
versions by following this simple steps:

-  Download the appropriate package for your distro from the `Zextras
   Website <https://www.zextras.com/zextras-theme-zimbra-interface/>`_.

-  Copy the package to your server.

-  Unpack it by running ``tar zxvf zextras-theme-*.tgz``

-  Run **as root**: ``cd zextras-theme-installer && ./install.sh``

-  Once the installation is completed, restart the mailboxd service by
   running ``su - zimbra -c 'zmmailboxdctl restart'``

.. _enabling_the_theme:

Enabling the theme
------------------

After the installation, users will be able to find the Zextras Theme in
their account Preferences under "Appearance".

To enable it, select the "Zextras" entry, save and accept the reload
when prompted.



.. figure:: /img/theme/zextrastheme-enable-user.png
   :scale: 50%

   Enabling Zextras UI Theme for a user.
