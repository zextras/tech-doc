
::

   zxsuite powerstore doRemoveHsmPolicy *hsm_policy*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **hs            | String          |                 |                 |
| m_policy**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doRemoveHsmPolicy "message, document:before:-2month"

Remove the HSM policy: "message, document:before:-2month"
