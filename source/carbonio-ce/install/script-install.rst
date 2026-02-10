.. _script-install:

Script-based Installation
=========================

You can install |product| on supported Linux distributions by using a
dedicated **bash installation script**.

The script automatically detects the operating system version and
executes the appropriate installation steps described in
:ref:`installation`.

Supported platforms:

* **Ubuntu** 22.04 and 24.04
* **Red Hat Enterprise Linux** 8

.. note::

   The installation script must be downloaded, reviewed, and executed
   **directly on the target server**.

Before you start
----------------

Before running the script, make sure that all prerequisites are met:

* Complete all tasks described in :ref:`carbonio-requirements`
  and :ref:`preliminary`
* Carefully **review the script** to understand the actions it performs
* Run the script as the ``root`` user on the target server
* On **RHEL systems**, all requirements listed in
  :ref:`rhel-requirements` are automatically satisfied by the script

.. important::

   When the script completes successfully, it prints on screen the
   passwords for the **Mesh** and **PostgreSQL** services.

   These credentials are required for administrative tasks.
   **Store them securely**, as they are not shown again.

Download the installation script
--------------------------------

Select your operating system and download the corresponding script.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      :download:`Download the installation script for Ubuntu 22.04
      </scripts/install_carbonio_ce_singleserver_ubuntu.sh>`

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      :download:`Download the installation script for Ubuntu 24.04
      </scripts/install_carbonio_ce_singleserver_ubuntu.sh>`

   .. tab-item:: RHEL 8
      :sync: rhel8

      :download:`Download the installation script for RHEL 8
      </scripts/install_carbonio_ce_singleserver_rhel.sh>`

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. warning::

         Script-based installation is **not supported** on RHEL 9.

         To install |product| on RHEL 9, follow the
         manual installation procedure described in
         :ref:`installation`.
