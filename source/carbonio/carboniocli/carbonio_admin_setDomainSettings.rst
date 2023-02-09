.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. code:: console

   zextras$ carbonio admin setDomainSettings *domain* [param \
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**  (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| a\              | Integer         |                 | no action       |
| ccount_limit (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| domain_a\       | String          |                 | no action       |
| ccount_quota (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| rese\           | String          | c\              | no action       |
| t_cos_limits (O)|                 | osname1:limit1, |                 |
|                 |                 | cosname2:limit2 |                 |
+-----------------+-----------------+-----------------+-----------------+
| ad\             | String          | c\              | no action       |
| d_cos_limits (O)|                 | osname1:limit1, |                 |
|                 |                 | cosname2:limit2 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio admin setDomainSettings example.com account_limit \
   100 domain_account_quota 100mb reset_cos_limits cos1:30,cos2:80

Sets a global account limit on the domain example.com of 100 accounts,
with a domain account quota of 100 megabytes,

and with cos account limits of 30 for cos1 and 80 for cos2 (removing
other cos settings).

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio admin setDomainSettings example.com \
   add_cos_limits cos1:30

Sets cos account limits of 30 for cos1 (leaving other cos settings
unchanged).
