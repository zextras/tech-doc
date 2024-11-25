.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_loginPage_setSkinLogoAppBanner_domain:

*************************************
loginPage setSkinLogoAppBanner domain
*************************************

::

   carbonio auth loginPage setSkinLogoAppBanner domain _domain_ _http://wwww.example.com/images/myimage.jpg_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 30 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - 
     - 
   * - skin_logo_app_banner (M)
     - String
     - http://wwww.example.com/images/myimage.jpg
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth loginPage setSkinLogoAppBanner domain example.com http://wwww.example.com/images/myimage.jpg



