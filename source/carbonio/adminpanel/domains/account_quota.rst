.. _manage-account-storage-quota:

Manage an Account Storage Quota
===============================

Administrators can configure the storage quota for individual accounts
from the **Account Settings** page in the **Carbonio Admin Panel**.
You can assign an unlimited quota or specify a maximum storage limit
for the selected account.

Storage quotas help administrators control the amount of mailbox
storage available to individual accounts. By assigning storage limits,
organizations can manage server resources more effectively, prevent
excessive storage consumption by individual users, and ensure fair
allocation of available disk space. For accounts that require
unrestricted storage, administrators can enable the
**Unlimited quota** option.


Configure an Account Quota
--------------------------

To configure the storage quota for an account:

1. Sign in to the **Carbonio Admin Panel**.
2. Navigate to **Domains**.
3. In the search field, enter the required domain
   (for example, ``example.com``) and select it.
4. Click **Manage** and select **Accounts**.
5. From the account list, select the email account you want to manage.
6. In the account details panel, open the **GENERAL** tab.
7. In the **Storage Usage** section, configure the quota:

   - To allow unlimited storage, enable the **Unlimited quota** toggle and click **Save**.
   - To assign a storage limit, disable the **Unlimited quota** toggle, enter the required value in the **Total quota (GB)** field, and click **Save**.

   .. note::
      Click the **Restore** icon next to the **Total quota (GB)** field
      to reset the quota to its inherited default (empty) value.

8. After saving the changes, you can:

   - Click **View Mail** to open the mailbox.
   - The configured quota is displayed in the mailbox storage information.
   - Click **Delete** if you want to remove the account.

The updated quota is applied immediately.

   .. figure:: /img/adminpanel/storage-quota.png
      :width: 99%

Upgrade Behavior
----------------

Existing account quota settings are preserved during upgrade. Any
quota configured before upgrading remains unchanged.



.. Commented according to CO-2145
   .. _ap-sync:

   ActiveSync
   ==========

   This page gives information about all accounts connected using the
   ActiveSync protocol. For each connected device, some information is
   shown, including its unique Device ID and the time when it last
   connected. Clicking any of the connections will show additional
   information, including client data and the device's ABQ status (see
   :ref:`mobile_abq_allowblockquarantine_device_control`)

   The following actions can be carried out: :bdg-primary-line:`WIPE
   DEVICE` (bring the connected device back to factory settings), to
   :bdg-primary-line:`RESET DEVICE` (log out the device from the
   account), and :bdg-primary-line:`SUSPEND` the connection.

