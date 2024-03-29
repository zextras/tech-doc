.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup doExternalRestore *source_path* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **sou           | Path            |                 |                 |
| rce_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| accounts(O)     | Account         |                 | all             |
|                 | Name[,..]       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| input_file(O)   | String          | list of         |                 |
|                 |                 | accounts, one   |                 |
|                 |                 | per line        |                 |
+-----------------+-----------------+-----------------+-----------------+
| domains(O)      | Domain          |                 | all             |
|                 | Name[,..]       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| fi              | Boolean         | true|false      | true            |
| lter_deleted(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_sys        | Boolean         | true|false      | true            |
| tem_accounts(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_aliases(O) | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| skip_distri     | Boolean         | true|false      | false           |
| bution_lists(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_coses(O)   | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| skip_account_p  | Boolean         | true|false      | false           |
| rovisioning(O)  |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_domain_p   | Boolean         | true|false      | false           |
| rovisioning(O)  |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| provi           | Boolean         | true|false      | false           |
| sioning_only(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| concurr         | Integer         |                 |                 |
| ent_accounts(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| m               | Integer         |                 |                 |
| ax_file_size(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| restor          | Boolean         | true|false      | true            |
| e_datasource(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| force_as_exte   | Boolean         | true|false      | false           |
| rnal_restore(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| b               | String          |                 |                 |
| lobs_archive(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doExternalRestore /path/to/data/ accounts john@example.com,jack@example.com domains example.com filter_deleted false skip_system_accounts false

Restores the example.com domain, including all system accounts, and the
john@example.com and jack@example.com accounts from a backup located in
/path/to/data/
