.. card:: Ansible Requirements

   If you plan to install |product| using Ansible (see Section
   :ref:`install-with-ansible`), the **Control Node** must be equipped
   with the following software:

   * Python 3.12

   * Latest Ansible version (**2.6.9**)

   Moreover, to connect to the Control Node you must use the
   :command:`ssh` command with the ``-A`` option, e.g.:

   .. code:: console

      $ ssh -A root@mail.example.com

   Remember to replace ``mail.example.com`` with the name or IP of the
   control node.
