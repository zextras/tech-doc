In some occasion, |mesh| can not correctly communicate with rabbitmq
due to an invalid token: when this happens, you will find in the log
files an error message similar to this one::

  Nov 1 00:07:28 ms service-discovered[191414]:
  2024-11-01T00:07:28.047-0500 [ERROR] agent.http:
  Request error: method=PUT
  url=/v1/kv/rabbitmq/default/startup_lock?acquire=8c5a9820-************-8bc7c4cee87b
  from=127.0.0.1:39408
  error="Permission denied: token with AccessorID
  '2ec49688-************-f71689f71502' lacks permission 'key:write' on
  \"rabbitmq/default/startup_lock\""

The solution is to run the :command:`pending-setups -a`
command. However, due to this being quite time consuming, as the
``root`` user you can issue the command

.. code:: console

   # carbonio-message-broker setup

You need to provide the :ref:`cluster credentials <mesh-credentials>`
to execute the command. It will print some messages on the screen and
it will end with the following messages, whose most important lines
are highlighted.

.. code-block:: text
   :emphasize-lines: 1-2

   Config entry written: service-defaults/carbonio-message-broker
   Config entry written: service-intentions/carbonio-message-broker
   Configuration reload triggered

   User carbonio-message-broker already exists
   User carbonio-message-broker-admin already exists
