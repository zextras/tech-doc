
::

   zxsuite mobile doAddEASFilter *and|or|regex|contains|account|domain*
   *text\|\ *\ people@example.com\ *\ \|account=\ *\ example@ff.com\ *,contains=android*
   *add|subtract|fixed|limit* *easversions* [param VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES"

   "**type** (M)", "Multiple choice", "and | or | regex | contains | account | domain"
   "**parameter** (M)", "String", "text | people@example.com | account=example@ff.com,contains=android"
   "**mode** (M)", "Multiple choice", "add | subtract | fixed | limit"
   "**easversions** (M)", "String[,..]"
   "blocking (O)", "Boolean", "true | false"



\(M) == mandatory parameter,  (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile doAddEASFilter contains android fixed 2.5,12.0,14.1

Adds a protocol filter that will restrict the pool of available EAS
versions to 2.5, 12.0 and 14.1 if the user agent name

contains the string 'android'.

.. rubric:: Usage Example

::

   zxsuite mobile doAddEASFilter and account=user@example.com,contains=android fixed 14.1 blocking true

Adds a protocol filter that will restrict the pool of available EAS
versions to 14.1 if the user agent name

contains the string 'android' only for user@example.com. No more EAS
filters will be evaluated after this one due to the 'blocking'
directive.
