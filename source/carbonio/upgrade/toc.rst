.. _upgrade-procedure:

================================
 Upgrade to |product| |release|
================================

This section contains the upgrade procedures to the latest
|carbonio| release.

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
|product| upgrade procedure is carried out along with the system upgrade
:ref:`using Ansible <upgrade-ansible>`. 

This procedure upgrades |product| to the latest available release at the time the upgrade is performed.
The currently installed version does not affect the procedure: regardless of the starting version, the upgrade
brings |product| to the latest supported release (at the time of writing, |release|).

Before starting an upgrade procedure, it is strongly suggested to make
a snapshot of the Nodes and a backup of the data.

.. important:: 
   
               .. rubric:: **Clear the Browser Cache After an Upgrade**

               After an upgrade, users may experience unexpected errors or abnormal behavior in the web interface
               due to cached browser data from the previous version. If a user reports an issue immediately after an upgrade, **clearing the browser cache and reloading
               the web interface should be one of the first troubleshooting steps** before investigating the server-side configuration or services.
               
               .. rubric:: **Unified Quota Model**
               
               Starting with Carbonio 26.6, **Mails, Files, and Chats** no longer have separate storage quotas.
               Instead, they all contribute to a **single per-user storage quota**.
               
               Every email, file, and chat attachment stored by a user counts toward the same total quota.
               
               For detailed migration guidance, storage analysis tools, and example scripts to help plan and assign quotas, refer to the `Unified Quota Guide`_ available on the Partner Portal.
               

.. _Unified Quota Guide: https://support.zextras.com/hc/en-gb/articles/28451427597084-Upgrading-to-Carbonio-26-6-Unified-Quota-A-Partner-s-Guide-to-the-Quota-Model-Change

.. card:: Table of Contents

   .. toctree::
      :maxdepth: 1

      ansible
      os-upgrade
      changelogs

