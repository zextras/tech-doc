.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

There are several reason why an administrator wants to customise
NGINX, for example adding a custom header for internal audit. Editing
the NGINX configuration file is not an option, because it will be
overwritten during upgrades. The most viable option is to use a
template made available by NGINX. In the remainder of this section we
introduce some details about NGINX working, relevant for the
customisations, then we show the procedure.

Two directories are used by NGINX to generate its initial
configuration: files from :file:`/opt/zextras/conf/nginx/templates` are
processed and saved in :file:`/opt/zextras/conf/nginx/includes`,
which are then read and used during the everyday operations. To allow
for custom changes, there is an additional directory,
:file:`/opt/zextras/conf/nginx/template_custom`, which contains files
that **override setting in the corresponding file in the**
:file:`templates` **directory**.

In other words, whenever the configuration is read, if under the
:file:`templates` and :file:`templates_custom` directories  a file
with the same filename is present, the one in the
:file:`templates_custom` directory is used.

This means that a user can not store preferences in a file with a
custom filename, but must override the default
:file:`nginx.conf.web.http.default.template` template.

.. card::

   Custom Configuration
   ^^^^^

   Now, to implement the configuration mentioned at the beginning of this
   section, the procedure is the following.

   #. Copy file over to the custom directory.

      .. code:: console

         # cp /opt/zextras/conf/nginx/templates/nginx.conf.web.http.default.template \
           /opt/zextras/conf/nginx/template_custom/nginx.conf.web.http.default.template

   #. Edit file
      :file:`/opt/zextras/conf/nginx/template_custom/nginx.conf.web.http.default.template`
      to add the custom header. Search for the ``location`` directive to
      which you want to add the custom header and add the following
      line::

        proxy_set_header X-CUSTOM-Forwarded-For "audit@example.com";

      The resulting configuration would look similar to the following


      .. code:: nginx

         location = /
         {
           if ($http_cookie !~ "ZM_AUTH_TOKEN=") {
               return 307 "/static/login/";
           }

         proxy_set_header X-CUSTOM-Forwarded-For "audit@example.com";
         }

   #. Restart the proxy system **as the** ``zextras`` **user**.

      .. code:: console

         zextras$ zmproxyctl restart

      NGINX will generate the configuration from the template files, then
      start.


.. card::

   Update of Customisations
   ^^^^^

   When a customisation is operational, the template does usually not
   need any modification until the next update of NGINX. When updated
   NGINX packages are available, it is suggested to check for any
   changes in the default configuration, to find if any incompatible
   values has been introduced or if some directive has been removed,
   modified, or added. In case in the new packages the default
   template has changed, the differences must be reflected in the
   customised template, because otherwise the NGINX service may not
   start properly.

.. card::

   Remove the Customisations
   ^^^^^

   To remove the customisation, simply remove the customised template
   and restart the proxy.


It is worth highlighting a few points:

* Whenever a customised template is used, the processed file (the one
  in the :file:`includes` directory will become an additional header
  that marks the configuration as being generated from a *custom*
  template and explains how to restore the default.

* In the log file it will be written which template is picked up and to
  which file it is saved.
