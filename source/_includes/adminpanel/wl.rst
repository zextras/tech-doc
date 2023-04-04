.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

All the resources (logos, images, icons) mentioned in this section
will be saved in the :file:`opt/zextras/web/login/assets/` directory
and will be accessible at URL
``https://<PROXY_IP>/static/login/assets/filename.ext``. You can also
use any resource that has a public URL.

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

      This is the *logo* that appears on the main page after a
      successful login and is displayed on the upper left
      corner. There are different *dimensions* and *ratios* for the
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
      **maximum** requirements.

      * The format must be **JPG**
      * The dimensions must be at least **1920x1050** pixel, with
        ratio **16:9**
      * The size must be **800** Kb

All customisations can be removed at once by clicking the
:bdg-danger-line:`RESET` button.
