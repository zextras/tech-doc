This page allows to configure the :abbr:`DoS (Denial of Service)`
protection. The **Maximum of Requests Allowed** and **Time window for
Allowed Requests** options define how many attempts a Mobile device
can carry out in the given amount of time: when this happens, the
device is *jailed* (i.e., it will not be allowed to connect) for the
amount of time defined in the **Jail Duration**.

The buttons allow to restart the jail, freeing all blocked devices and
allow them to connect, and purge the ActiveSyns status.

.. card:: How |product| Mobile DoS Filter works

   Mobile includes a dedicated DOS Filter component to improve both
   security and stability. The DoS filter will automatically activate
   whenever a device exceeds the defined connection rate over time and
   will forbid any connections from that device for a given period of
   time.

   This approach improves both *security*, by helping to prevent DoS
   attacks, and *stability*, by blocking clients that are performing
   too many requests because of bugs or malfunctioning, thus saving
   resources for all other clients.

   When the rate has been exceeded, a warning is sent via email to admin
   and added to server notifications.
