The configuration of ``nginx`` is split across a number of files so in
case of errors while it is running, it may not be immediate to track
down the source of the problem.

There are two main problems for which ``nginx`` may not run correctly
or start:

.. grid::
   :gutter: 2

   .. grid-item-card:: File Ownership
      :columns: 6

      ``nginx`` runs with the ``zextras`` user, therefor **all** its
      configuration file must be owned by that user, otherwise it will
      not start correctly.

      ``nginx`` configuration files are stored in the following
      directories: :file:`/opt/zextras/conf/` and
      :file:`/opt/zextras/common/conf`. To verify that all files have
      correct ownership, use the following commands **as the**
      ``zextras`` **user**

      .. code:: console

         zextras$ ls -lR /opt/zextras/conf/nginx*
         zextras$ ls -l /opt/zextras/common/conf/nginx.conf

      .. hint:: For better readability, you can pipe the first command
         above using :command:`less`

         .. code:: console

            zextras$ ls -lR /opt/zextras/conf/nginx* | less

      If any of the listed files has owner different from ``zextras
      zextras``, you need to fix it by using as the ``root`` user the
      command

      .. code:: console

         # chown zextras:zextras -R /opt/zextras/conf/nginx*
         # chown zextras:zextras /opt/zextras/common/conf/nginx.conf

      The first command will make sure that all the files in the
      directory are recursively processed.

   .. grid-item-card:: Syntax Errors
      :columns: 6

      Any syntax error in a configuration file will prevent ``nginx``
      to start. To verify that the configuration is correct, run **as
      the** ``zextras`` **user** the command


      .. code:: console

         zextras$ nginx -tc /opt/zextras/conf/nginx.conf

      Any syntactic error, including the configuration file containing
      it, will be mentioned in the output, for example::

        nginx: [emerg] unexpected end of file, expecting ";" or "}" in /opt/zextras/conf/nginx/includes/nginx.conf.main:37
        nginx: configuration file /opt/zextras/conf/nginx.conf test failed

      You can now edit the file and make any necessary correction.

      In case of ownership errors, the output will be for example::

        nginx: [emerg] open() "/opt/zextras/conf/nginx/includes/nginx.conf.main" failed (13: Permission denied) in /opt/zextras/conf/nginx.conf:5
        nginx: configuration file /opt/zextras/conf/nginx.conf test failed

      Use the already mentioned :command:`chown` command to fix the
      problem.
