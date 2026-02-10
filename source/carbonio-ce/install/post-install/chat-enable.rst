.. _chat-enable:

Enable |wsc| UI
---------------

The |wsc| Component is disabled by default, you can enable it either from
the |adminui| or from the command line by running as the ``zextras``
user the command

.. code:: console

   zextras$ carbonio prov mc default carbonioFeatureWscEnabled TRUE

This command enables the chat for the ``default`` COS, but you can
enable it only on selected COSes.

Restart the following services in the given order

#. Message broker

   .. code:: console
   
      # systemctl restart carbonio-message-broker

#. Message dispatcher
   
   .. code:: console

      # systemctl restart carbonio-message-dispatcher

#. |wsc| 

   .. code:: console

      # systemctl restart carbonio-ws-collaboration

#. In case you also installed |vs|

   .. code:: console

      # systemctl restart carbonio-videoserver

   
.. card:: Check status of |wsc|

   After the installation, you can check the status of and all its
   dependencies by running command

   .. code:: console

      # curl -v http://127.78.0.4:10000/health | jq

