.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carb-customisations:

================
 Customisations
================

This section lists some customisations for |product|.

Logo
====

It is possible to replace |product| logo with an own logo in two
steps:

#. copy the logo (we will call it :file:`company_logo.svg`) to
   directory  :file:`/opt/zextras/web/login/assets/` on the |product|
   installation.

   .. hint:: The optimal size for the logo is **320x80** pixels

#. execute this command on *every node* on which the **Proxy** is installed.

   .. code:: console

      # carbonio auth loginPage setLogo \
        domain example.com \
        "/static/login/assets/example_logo.svg"

.. _nginx-custom:

NGINX templates
===============

.. include:: /_includes/nginx.rst

.. _install-fonts:

Custom Fonts for |docs|
=======================

|docs| can pick up any font that is installed in standard system
directory fonts, like :file:`/usr/share/fonts`. Hence, to install a
font family, simply use the package manager. For example, to install
the Roboto fonts, use the command:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt-get install fonts-roboto

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install fonts-roboto


Once done, restart |docs|.

.. code:: console

   # systemctl restart carbonio-docs-editor.service

The fonts will now be available for use in |docs|.
