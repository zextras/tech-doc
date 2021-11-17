
::

   zxsuite mobile ABQ setNotificationInterval *45m|6h|1d|0*

.. rubric:: Parameter List

+-------------------+-----------------+-----------------+-----------------+
| NAME              | TYPE            | EXPECTED VALUES | DEFAULT         |
+-------------------+-----------------+-----------------+-----------------+
| **interval**  (M) | String          | 45m|6h|1d|0     |                 |
+-------------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

Set notification of new quarantined devices every 45 minutes

.. rubric:: Usage Example

::

   zxsuite mobile ABQ setNotificationInterval 45m

Set notification of new quarantined devices every 6 hours

.. rubric:: Usage Example

::

   zxsuite mobile ABQ setNotificationInterval 6h

Set notification of new quarantined devices once every day

.. rubric:: Usage Example

::

   zxsuite mobile ABQ setNotificationInterval 1d

Disable notifications of new quarantined devices

.. rubric:: Usage Example

::

   zxsuite mobile ABQ setNotificationInterval 0
