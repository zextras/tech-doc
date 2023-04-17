.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

White Labelling
===============

|product| supports *White Labelling*, allowing therefore to quickly
customise many different parts of its web interface to resemble a
company's own corporate identity.

In order to activate the White Labelling on a domain and begin
customising |product|'s appearance, you need to define a value for
options

* **Public Service Host Name** under the domain's *General Settings*
  section |aphostname|

* **Virtual Host Name** under the domain's *Virtual Hosts &
  Certificates* section |apvhost|

All the White Labelling options are available in the |adminui| under
:menuselection:`Domains --> Global --> Theme` (global customisaztions,
applied to all defined domains) or :menuselection:`Domains --> Details
--> Theme` (to change them only for one domain, overriding the global
settings).

.. include:: /_includes/_adminpanel/wl.rst

.. |aphostname| image:: /img/adminpanel/ap-hostname.png
   :scale: 60%

.. |apvhost| image:: /img/adminpanel/ap-vhost.png
   :scale: 60%
