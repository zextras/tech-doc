.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The ``carbonio`` service integrates seamlessly with the various system
tools like :command:`systemctl` and :command:`journalctl`, therefore
allowing quicker analysis of the situation and check for any problem
should arise.

The syntax is the standard used by :command:`systemctl`, hence you can
use this command to start or stop all the ``carbonio`` units

.. code:: console

   # systemctl start | stop carbonio*

To verify the status of all the ``carbonio`` services run command


.. code:: console

   # systemctl list-unit-files "carbonio*"

More information about each unit you can run

.. code:: console
   
   # systemctl list-units "carbonio*"


If any service is in :red:`failed` status, restart it. For example, if
the nginx |monit| exporter has not started you will need to run

.. code:: console

   # systemctl restart carbonio-prometheus-nginx-exporter.service

.. code:: console

   # journalctl -u carbonio*

to access the logs produced by all the units.
