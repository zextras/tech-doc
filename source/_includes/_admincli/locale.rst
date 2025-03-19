
|product| requires strictly ``en_US.UTF-8`` as the default system
locale; a different locale may lead to unexpected issues and services
not working correctly.

Follow this procedure to ensure the correct locale are set. all
commands must be executed as the |ru|.

.. rubric:: Step 0. Verify the current locale settings

.. code:: console

   # locale

If the output is ``en_US.UTF-8`` for all variables, no other task is
needed: |product| already uses the correct locale. Example output::

  LANG=en_US.UTF-8
  LANGUAGE=
  LC_CTYPE="en_US.UTF-8"
  LC_NUMERIC="en_US.UTF-8"
  LC_TIME="en_US.UTF-8"
  LC_COLLATE="en_US.UTF-8"
  LC_MONETARY="en_US.UTF-8"
  LC_MESSAGES="en_US.UTF-8"
  LC_PAPER="en_US.UTF-8"
  LC_NAME="en_US.UTF-8"
  LC_ADDRESS="en_US.UTF-8"
  LC_TELEPHONE="en_US.UTF-8"
  LC_MEASUREMENT="en_US.UTF-8"
  LC_IDENTIFICATION="en_US.UTF-8"
  LC_ALL=

.. rubric:: Step 1. Change the Locale Configuration

.. code:: console

   # localectl set-locale LANG=en_US.utf8

.. rubric:: Step 2. Reload the Locale Configuration

To ensure the settings are applied correctly, execute commands

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubu
             
      .. code:: console

         # source /etc/default/locale

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # source /etc/locale.conf

.. rubric:: Step 3.Verify the Locale Change

Execute again the command mentioned in Step 1. The output should be
similar.
   
.. code:: console

   # locale

          
