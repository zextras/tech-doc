.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _web-access:

=============================
 Access to the Web Interface
=============================

To access |carbonio|\'s web interface, point a :ref:`supported browser
<browser_compatibility>` to either of the URL below. In a Multi-Server
installation, replace the URL with the IP address or the hostname of
the *Proxy Node*, i.e., |srv4ip| in our scenario.


.. note:: Since |product| uses SSL, it is strongly suggested to
   install an SSL certificate. Please refer to Section
   :ref:`install-SSL-cert` for directions..

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::
      :columns: 6

      Web Client
      ^^^^^
      
      The web client is used for regular access to the e-mail account
      and can be used also to access other functionalities (|file|,
      |docs| if installed), as well as other client protocols such as
      IMAP or POP, and is available at
      https://mail.example.com/. In :ref:`carbonio-usage` you can
      find directions that guide you in your first steps with
      |product| and introduction to the most common tasks


   .. grid-item-card::
      :columns: 6

      |adminui|
      ^^^^^

      The |adminui| is used for Administration access and is available at:
      https://mail.example.com:6071/

      Here, you can manage server, domains, accounts, and other
      configurations. Please refer to section :ref:`adminpanel` for
      more information.

