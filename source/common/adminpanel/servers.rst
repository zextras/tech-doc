
This section is used to configure the Global e-mail server. 

Global Servers
--------------

The lists of all configured server and buckets are shown here.

Server Details
--------------

In the Server Details section it is possible to select a server, check
its currently used volumes and assign new ones, and finally configure
HSM policies.

Data Volumes
~~~~~~~~~~~~

After you selected the server, the volumes it currently uses are
shown, along with a few configured options. To add a new Volume, click
on the :bdg-primary-line:`NEW VOLUME` button.

In the dialog window, provide the basic information of the new volume
in the first tab: The allocation type, name, and path.

The second tab depends on the allocation:

* **Local**: decide whether this is a primary, secondary, or index volume,
  select a compression threshold if necessary, and finally if this
  will become the new current volume.

* **External**, **Sproxy**, **Centralized**: primary, secondary, or
  index volume, select the type of Object Storage and a prefix to
  identify the volume. You can set this volume as *Centralized*, which
  proves useful in case it will be shared by multiple servers.

HSM Settings
~~~~~~~~~~~~

HSM settings are policies for automatically processing objects in the
mailstore: e-mails, documents, contacts, and events.
