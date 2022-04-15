
The ``carbonio`` service integrates seamlessly with the various system
tools like :command:`systemctl` and :command:`journalctl`, therefore
allowing quicker analysis of the situation and check for any problem
should arise.

The syntax is the standard used by :command:`systemctl`, hence you
can use

.. code:: console

   # systemctl start|stop|status carbonio.*

to start, stop or verify the status of all the ``carbonio`` units and

.. code:: console

   # journalctl -u carbonio.*

to access the logs produced by all the units.

To check, start, or stop  a single ``carbonio`` unit, you can receive
a list of all |carbonio|\-related units (and their status) with the
command below, then use only the unit that you would like to access.

.. code:: console
   
   # systemctl list-units "carbonio.*"
