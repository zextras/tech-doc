.. _api-files-howto:

=============================
 Working With the |File| API
=============================


This section is dedicated to anyone familiar with API programming
(mostly developers), who wants to interact with |file| using its SOAP
API. It is therefore assumed that anyone who reads this section has
basic knowledge about SOAP API calls.

Authentication Token
====================

Every API call requires an *authentication token*, which can be
retrieved using the ``AuthRequest`` SOAP command::

  <AuthRequest>
    <account by="id">aa8b744d-6274-489b-9bae-f9007fe3673a</account>
    <preauth timestamp="1693519200">e59c19e90fa09883...87f57833adf</preauth>
  </AuthRequest>

This call returns an ``AuthResponse`` containing the token::

  <AuthResponse>
    <authToken>0_65fe52ea9ff1793c7...3719888</authToken>
  </AuthResponse>

The token must be used on every REST request as a *cookie*, ie., it
must be ent to the server through the `Cookie` header::

  Content-Type: application/json; charset=utf-8
  Cookie: ZM_AUTH_TOKEN=0_65fe52ea9ff1793c7...3719888
  
API Requests Structure
======================

Requests to the |file| API are made as *GraphQL queries*, containing
the Cookie header shown in previous section and passed as **HTTP
POST** requests to the |carbonio| server on the path::

  /services/files/graphql

The body of the request is a JSON-encoded object containing a GraphQL
query, the variables, and the operation name. The reference
documentation for the Files GraphQL API is available at
https://docs.zextras.com/apidoc/files_meta/.

Queries
-------


A *Query* is used to return a *Node*, which can be a file or a folder
stored on |file|, and its attributes, given two parameters:

#. ``node_id`` is the unique identifier of the node
#. ``version`` is the version of a file

Some methods available for a Query are:

* ``getRootsList`` returns the root folders (LOCAL_ROOT and TRASH_ROOT)
* ``getNode`` returns a node from its ``node_id``
* ``findNodes`` allows you to search for a node using keywords and
  various filters (shared by/with me, etc).
* With the ``children`` field of the ``Folder`` object you can list a
  folder's children as an array of Node.

.. seealso:: Full reference of Query can be found at
   https://docs.zextras.com/apidoc/files_meta/query.doc.html.

Mutations
---------

A *Mutation* is a write operation on a folder or file. Common
actions are:

* ``createFolder``, ``flagNodes``, ``trashNodes``, ``restoreNodes``,
  ``moveNodes``, ``copyNodes``, and ``deleteNodes`` are
  self-explanatory
* ``updateNode`` is used to to rename a node, change its description and other
  metadata

.. seealso:: Mutation's full reference can be found at
   https://docs.zextras.com/apidoc/files_meta/mutation.doc.html.


Files Upload and Downloads
--------------------------

A few methods are available to upload (POST) and download (GET) files;
for the latter, the requests to the |carbonio| server must be on the path::

  /services/files/download/

.. hint:: Use :file:`/services/files/download/{node_id}/{version} to
   download a given revision of a file.

Full reference documentation is available at https://docs.zextras.com/apidoc/files_blob/.
