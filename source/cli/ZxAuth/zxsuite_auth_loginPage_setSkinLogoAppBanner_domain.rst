.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth loginPage setSkinLogoAppBanner domain *domain*
   http://wwww.example.com/images/myimage.jpg

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **skin_logo_ap  | String          | http://wwww.    |                 |
| p_banner**\ (M) |                 | example.com/ima |                 |
|                 |                 | ges/myimage.jpg |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth loginPage setSkinLogoAppBanner domain example.com http://wwww.example.com/images/myimage.jpg
