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

The body of the request is a JSON-encoded object containing the
operation name, the variables involved and some limitations on them,
and a GraphQL query. A few examples requests are shown below; details
about the elements follow in the next section, while the reference
documentation for the |file| GraphQL API is available at
https://docs.zextras.com/apidoc/files_meta/.

.. card:: Example 1: List all root nodes

   This is one of the simplest examples: we use the ``getRootsList``
   method to retrieve the root nodes, with no variables:

   .. code-block::

      {
        "operationName": "getRootsList",
        "variables":
          {},
        "query": $query
      }

   Here, *$query* is a string:

   .. code-block::

      query getRootsList {
         getRootsList { id name }
      }

   The output of this Request is similar to the following

   .. code::

      {
        "data": {
          "getRootsList": [
            {
              "id": "LOCAL_ROOT",
              "name": "ROOT"
            },
            {
              "id": "TRASH_ROOT",
              "name": "TRASH"
            }
          ]
        }
      }

.. card:: Example 2: List a node and its children

   This example gets a node and in case it is a folder, also all its
   children. We choose **LOCAL_ROOT** as ``node_id`` and limit the
   output to the first **100** results. We also want the output to
   contain a few information about the returned files: extension,
   mime_type, size, and version.

   .. code-block::

      {
        "operationName": "getNodeAndChildren",
        "variables": {
          "limit": 100,
           "node_id": "LOCAL_ROOT",
           "sort": "NAME_ASC"
        },
        "query": $query
      }

   In this case, *$query* is a complex string (split in four snippets
   for simplicity)

   .. code-block::

      query getNodeAndChildren($node_id: ID!, $limit: Int!, $sort: NodeSort!) {
          getNode(node_id: $node_id) {
              id
              name
              type
              ...Children
          }
      }

   .. code-block::

      fragment Child on Node {
          id
          name
          type
          ...FileAttributes
      }

   .. code-block::

      fragment Children on Folder {
          children(limit: $limit, sort: $sort) {
              nodes {
                  ...Child
              }
          }
      }

   .. code-block::

      fragment FileAttributes on File {
          extension
          mime_type
          size
          version
      }

   The output of this request is similar to the following one (output
   shortened for simpicity)

   .. code-block::

      {
        "data": {
          "getNode": {
            "id": "LOCAL_ROOT",
            "name": "ROOT",
            "type": "ROOT",
            "children": {
              "nodes": [
                {
                  "id": "f8b3b0ae-2673-444a-9da0-642fac651f96",
                  "name": "Carbonio_tutorials",
                  "type": "FOLDER"
                },
                {
                  "id": "650825c3-9c75-44db-a8df-d4fc9177d08d",
                  "name": "carbonio_commands.txt",
                  "type": "TEXT",
                  "extension": "txt",
                  "mime_type": "text/plain",
                  "size": 40.0,
                  "version": 1
                }
              ]
            }
          }
        }
      }
      
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

.. hint:: Use :file:`/services/files/download/{node_id}/{version}` to
   download a given revision of a file.

Full reference documentation is available at https://docs.zextras.com/apidoc/files_blob/.
