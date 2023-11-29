.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

All the resources used for White Labelling must have a **valid URI**
and must be reachable from |carbonio|.

In case the resources are hosted on an server external to the
|carbonio| infrastructure, make sure that server's SSL certificate is
valid and has not expired, and its FQDN is valid and resolvable from
|carbonio| (from the Proxy Node in case of a Multi-Server).

You can safely use the |carbonio|'s Proxy Node to expose those
resources, by uploading them into a directory called for example
:file:`/opt/zextras/web/custom/` (create it if does not exist yet) and
using the URL ``https://<Carbonio_hostname>/static/custom/``, where
``<Carbonio_hostname>`` is the FQDN of the Single-Server or of the
Proxy Node in a Multi-Server.

Moreover, in a Multi-Server featuring multiple Proxy Nodes, it is
mandatory to keep in sync the resources on all the Proxies instances.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Light/Dark mode
      :columns: 6

      The *light* mode features a white-based colour combination for
      the |product| login page and GUI, while the *dark* mode has a
      black-based colour combination.

   .. grid-item-card:: Primary colours Light and Dark mode
      :columns: 6

      Select the primary colour that will used in either Light or Dark
      mode, using an HEX (HTML) value. The secondary colour will be
      automatically computed.

   .. grid-item-card:: Title & Copyrights Information
      :columns: 12

      The *title* is the string that will appear on the client's tab,
      while the *copyrights information* will appear at the bottom of
      the panel in the login page.

   .. grid-item-card:: Logo on the login page
      :columns: 6

      This is the *logo* that appears on the login mask of |product|
      at the top of the panel in the login page. There are different
      *dimensions* and *ratios* for the Admin and End User logos.
     
      **Requirements**:
		  
      Each login logo must adhere to the following **suggested**
      requirements.

      * The preferred format is **SVG**
      * The logo must have a **transparent background**
      * For a correct display of the logos, please respect the aspect
        ratio indicated and (in the case of raster images) respect
        dimensions as close as possible to the default ones

        * Admin: ratio **7:1**, default **340x47** pixel
        * End user: ratio **4:1**, default **340x85** pixel
      

   .. grid-item-card:: Logo in the WebUiApp
      :columns: 6

      This *logo* appears:

      #. on the main page after a successful login, is displayed on
         the upper left corner.

      #. in video calls: before starting and after terminating the
         call and during the call, in the top right corner
      
      There are different *dimensions* and *ratios* for the
      Admin and End User logos.

      **Requirements**:
		  
      Each WebUiApp logo must adhere to the following **suggested**
      requirements.

      * The preferred format is **SVG**
      * The logo must have a **transparent background**
      * For a correct display of the logos, please respect the aspect
        ratio indicated and (in the case of raster images) respect
        dimensions as close as possible to the default ones

        * Admin: ratio **5:1**, default **150x30** pixel
        * End user: ratio **8:1**, default **250x31** pixel
      
   .. grid-item-card:: Favicon
      :columns: 6

      The favicon will be displayed next to the tab's name and in
      browser notifications, if they have been activated in your
      browser.
      
      **Requirements**:
		  
      The *favicon* must adhere to the following **maximum** requirements.

      * The format must be **ICO**
      * The dimensions must be **64x64** pixel, with ratio **1:1**
        (i.e., it must be square)

   .. grid-item-card:: Background for the Login Page
      :columns: 6

      The *background* image for the login page is displayed behind the
      login panel during the login phase, You can choose one image for
      the light mode and one for the dark mode.
	  
      **Requirements**:
		  
      The images used for the background must adhere to the following
      requirements.

      * The format must be **JPG** or **PNG**
      * The dimensions must be between **1280x720** and **1920x1080**
        pixels, with ratio **16:9**
      * The size should be **less than 800** Kb

All customisations can be removed at once by clicking the
:bdg-danger-line:`RESET` button.

.. card:: URL for Logout

   This URL is shown whenever a user logs out from |product| by
   clicking on the *Logout* item in the menu appearing when clicking
   on the account icon on the top-right corner.

   It can currently be configured from the CLI only, using command

   .. code:: console

      zextras$ carbonio prov mcf zimbraWebClientLogoutURL "https://example.com/"
