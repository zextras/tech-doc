.. _component-vs-wsc-install:

Video Server & Video Recording
==============================

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Video Server & Video Recording** component consists of two subcomponents: **Video Server** and **Video Recording**.

* **Video Server** provides the platform for hosting and streaming video meetings.
* **Video Recording** allows recording of video meetings and should be installed only if you plan to enable recording functionality.

This separation allows deployments to include video conferencing capabilities without necessarily enabling recording, depending on the requirements.


Packages
--------

The following packages are required for the **Video Server & Video Recording** component:

.. code-block:: bash

   carbonio-videoserver-advanced
   carbonio-videorecorder


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.