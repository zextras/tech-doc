
On a Linux system, fonts are usually under directory
:file:`/usr/share/fonts`, and installing new font families usually is
as simple as to use the package manager. For example, to install the
Roboto fonts, use the command:

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt-get install fonts-roboto

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install fonts-roboto

To allow |docs| to access the fonts, first copy all the files:

.. code:: console

   # cp -Rf /usr/share/fonts/* /opt/zextras/docs/generated/systemplate/usr/share/fonts/

Then make sure that the owner of the whole fonts sub-tree is the user
``carbonio-docs-editor``:
          
.. code:: console

   # chown -R carbonio-docs-editor:carbonio-docs-editor /opt/zextras/docs/generated/systemplate/usr/share/fonts/

Finally, restart the service.

.. code:: console

   # systemctl restart carbonio-docs-editor.service

Repeat the same steps on any Node on which |docs| is installed. 
