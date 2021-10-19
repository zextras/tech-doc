=====================================
 |community| CLI new format proposal
=====================================

This is a proof of concept for the format of the CLI commands
featuring a few examples.

In all examples, I kept the same elements of the above asciidoc
code. The result is always right underneath the code.

.. warning:: Some code snippets may not match 100% their displayed
   version. Please bear with me, I was in a rush... :octicon:`flame`
   :octicon:`rocket` :octicon:`stopwatch`
   
Current version
===============

This is the current asciidoc version of command  :command:`zxsuite team addOwner`:

.. code:: text

   [[team_addOwner]]

   ==== addOwner

   [caption=]
   ====
   zxsuite team addOwner _conversation_id_ _owner_ 
   ====

   PARAMETER LIST

   [col=2,3,2,2]
   |===
   |NAME                     |TYPE             |EXPECTED VALUES     |DEFAULT
   |*conversation_id*(M)     |String           | Group, Space, or  Channel ID   |
   |*owner*(M)               |Account Name     |                    |
   |===

   (M) == mandatory parameter, (O) == optional parameter

   .Example:
   [caption=]
   ----
   zxsuite team addOwner  aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com
   ----

   user2@example.com becomes an owner of the rooms with conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

Examples
========

.. rubric:: Example 1. This is a simple conversion.

.. code:: rst

   .. _team-addowner:

   addOwner
   ========

   .. card::
      
      .. code:: bash

         zxsuite team addOwner _conversation_id_ _owner_

      .. rubric:: Parameter List

      \(M) == mandatory parameter, (O) == optional parameter

      .. csv-table:: 
         :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

         "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
         "*owner* (M)", "Account Name", " ", " "

   .. rubric:: Example

      .. code:: bash

         zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

      user2@example.com becomes an owner of the rooms with
      conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

.. _team-addowner1:

addOwner
========

.. card::

   .. code:: bash

      zxsuite team addOwner _conversation_id_ _owner_

   .. rubric:: Parameter List

   \(M) == mandatory parameter, (O) == optional parameter

   .. csv-table:: 
      :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

      "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
      "*owner* (M)", "Account Name", " ", " "

   .. rubric:: Example

   .. code:: bash

      zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

   user2@example.com becomes an owner of the rooms with
   conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

.. rubric:: Example 2. This is an elaborated example.

.. code:: rst

   .. _team-addowner:

   addOwner
   ========

   .. grid::
      :gutter: 2

      .. grid-item-card::
         :columns: 6

         Syntax
         ^^^^^^
         .. code:: bash

            zxsuite team addOwner _conversation_id_ _owner_

         .. rubric:: Parameter List

         \(M) == mandatory parameter, (O) == optional parameter

         .. csv-table:: 
            :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

            "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
            "*owner* (M)", "Account Name", " ", " "

      .. grid-item-card::
         :columns: 6
      
          Example
          ^^^^^^^
         .. code:: bash

            zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

         user2@example.com becomes an owner of the rooms with
         conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

.. _team-addowner2:

addOwner (2)
============

.. grid::
   :gutter: 2
            
   .. grid-item-card::
      :columns: 6

      Syntax.
      
      .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner.rst

   .. grid-item-card:: 
      :columns: 6
                
      Example.
      
      .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner_ex.rst
              
.. rubric:: Example 3. Same as above but using two files


.. code:: rst

   .. _team-addowner:

   addOwner
   ========

   .. grid::
      :gutter: 2

      .. grid-item-card::
         :columns: 6

         .. include:: /cli/ZxTeam/zxsuite_team_addOwner.rst
                      
      .. grid-item-card:: Example
         :columns: 6

         .. include:: /cli/ZxTeam/zxsuite_team_addOwner_ex.rst

The content of the two ``include::``\d files would be:

.. grid::

   .. grid-item-card:: zxsuite_team_addOwner.rst

      .. code:: rst

         .. code:: bash

            zxsuite team addOwner _conversation_id_ _owner_

         .. rubric:: Parameter List

         \(M) == mandatory parameter, (O) == optional parameter

         .. csv-table:: 
            :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

            "*conversation_id* (M)", "String", "Group, Space, or Channel ID", " "  
            "*owner* (M)", "Account Name", " ", "

   .. grid-item-card:: zxsuite_team_addOwner_ex.rst

      .. code:: rst

         .. code:: bash

            zxsuite team addOwner aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

         user2@example.com becomes an owner of the rooms with
         conversation_id aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com

.. rubric:: Example 4. Another elaborated example, using dropdowns.

.. dropdown:: addOwner

   .. card::

              
      .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner.rst
                   
      .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner_ex.rst

.. dropdown:: addOwner

   .. grid::
      :gutter: 2

      .. grid-item-card::
         :columns: 6

         .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner.rst
                      
      .. grid-item-card:: Example
         :columns: 6

         .. include:: /common/cli/ZxTeam/zxsuite_team_addOwner_ex.rst


Conclusions
===========

Splitting content of a single CLI file in two as shown above would be useful for at
least two reasons:

#. reduce burden for extracting help from the commands' source code
   and producing rst to be included in the doc
#. avoid problems with sectioning
#. give doc team more flexibility in organising and reusing the
   content of the help files




