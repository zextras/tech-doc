To find which |mesh| node is currently the leader Node, first get the
|mesh| token.

.. include:: /_includes/_admincli/mesh/gettoken.rst

Query the |mesh| service to retrieve the state of all its Nodes. The
*leader node* has the attribute *State* set to **leader**.

.. code:: console

   # consul operator raft list-peers

The output of the command will be similar to the following. In this
case, the leader node is **srv2-example-com**::

  Node                          ID                                    Address              State     Voter  RaftProtocol
  srv1-example-com  10092f88-53cc-6938-08d3-48d112b5b25e  10.174.166.116:8300  follower  true   3
  srv2-example-com  04033e5a-5597-20ca-81ef-5cdad4f24581  10.174.166.117:8300  leader    true   3
  srv3-example-com  0d325666-f792-2258-a351-f74c01249fb3  10.174.166.118:8300  follower  true   3
