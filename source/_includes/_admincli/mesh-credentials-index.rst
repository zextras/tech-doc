            
.. code:: console
                
   # consul acl bootstrap

The command allows to retrieve the **reset index value**, which is
needed during the reset procedure. The output will always be similar to::

  Failed ACL bootstrapping: Unexpected response code: 403 (Permission denied: ACL bootstrap no longer allowed (reset index: 908))

The **reset index value** is the last bit of the output *(reset index:
908)*, in our case **908**: copy it or write it down.

