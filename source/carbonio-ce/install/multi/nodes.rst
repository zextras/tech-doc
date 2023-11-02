
.. _multiserver-installation:

Node Installation
=================

The installation procedure follows the suggested order of nodes as
described in the :ref:`scenario <multi-server-scenario>`. A few remarks:

*  While the overall procedure is the same for both Ubuntu and RHEL 8,
   the actual commands and file paths may differ on the two operating
   system, so pay attention that you execute the correct command on the
   correct files and operating system. The commands that differ are
   separated as follows. Click the :blue:`Ubuntu` or :blue:`RHEL` tab
   according to the Operating System on which you are installing
   |product|.


   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code::

            # <command to be executed on Ubuntu systems>

      .. tab-item:: RHEL
         :sync: rhel

         .. code::

            #  <command to be executed on Red Hat systems>

*  All the commands that are mentioned in this installation procedure
   **must be executed** as the ``root`` user.

* In case you experience some issues during the installation, please
  refer to Section :ref:`cli-ts`, in which you can find helpful
  commands.

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`.

.. toctree::
   
   nodes/srv1
   nodes/srv2
   nodes/srv3
   nodes/srv4

