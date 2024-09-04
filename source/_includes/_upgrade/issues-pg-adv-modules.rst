.. _upgrade_pg-adv-mod:

.. card:: Advanced modules not starting

   There are a few corner cases that prevent the advanced modules,
   provided by the Service Roles, to be accessible to users. The
   problem is that the Node featuring the Mailstore & Provisioning
   Role can not communicate with the Database (PostgreSQL) or DB
   Connector (pgpool), depending on your setup. You can check if this
   is the case if you find in log file
   :file:`/opt/zextras/log/mailbox.log` error messages like::

     2024-07-29 10:13:58,575 ERROR [main] [] extensions -
     Error getting connection from data source org.postgresql.ds.PGSimpleDataSource@4151251b org.jooq.exception.DataAccessException:
     Error getting connection from data source org.postgresql.ds.PGSimpleDataSource@4151251b at com.zextras.modules.core.db.LazyDataSourceConnectionProvider.acquire(BaseDSLContextProvider.java:72) ~[?:?]

     Caused by: org.postgresql.util.PSQLException: Connection to 127.78.0.25:20000 refused. Check that the hostname and port are correct and that the postmaster is accepting TCP/IP connections.

     Caused by: java.net.ConnectException: Connection refused

     2024-07-29 10:14:00,642 FATAL [main] [] extensions - Unable to initialize zextras: org.jooq.exception.DataAccessException:
     Error getting connection from data source org.postgresql.ds.PGSimpleDataSource@4151251b at org.jooq_3.14.8.POSTGRES.debug (null:-1)

     Caused by: org.postgresql.util.PSQLException: Connection to 127.78.0.25:20000 refused. Check that the hostname and port are correct and that the postmaster is accepting TCP/IP connections.

     Caused by: java.net.ConnectException: Connection refused

   In order to fix the problem, you need to make sure that PostgreSQL
   or pgpool are running. If not, restart them.

   Finally, make sure to restart the mailbox

   .. code:: console

      zextras$ zmmailboxdctl restart
