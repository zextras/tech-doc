Failed Installation of carbonio-docs-editor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When installing ``carbonio-docs-editor`` on RHEL 8-based
distributions you may encounter this error::

  Error:  Problem: package carbonio-docs-core-22.05.12-1.el8.x86_64 requires harfbuzz-icu,
  but none of the providers can be installed
    - package carbonio-docs-core-22.05.12-1.el8.x86_64 requires libharfbuzz-icu.so.0()(64bit), but none of the providers can be installed
    - package harfbuzz-icu-1.7.5-3.el8.x86_64 conflicts with harfbuzz
      provided by harfbuzz-1.7.5-3.el8.x86_64
    - cannot install the best candidate for the job
    - problem with installed package harfbuzz-1.7.5-3.el8.x86_64
  (try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages or '--nobest' to use not only best candidate packages)

You need to follow the advice in the last line and execute the command

.. code:: console

   # dnf install harfbuzz-icu --allowerasing

After the package has been installed, you can resume the upgrade.


Missing carbonio-docs-editor user
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On RHEL 8-based Multi-Server installations only, you may find the following error
in all AppServers that *do not have** the ``carbonio-docs-editor``
package installed.

.. code:: console

   chown: invalid spec: 'carbonio-docs-editor:'

In these cases you need to open the
:file:`/opt/zextras/libexec/zmfixperms`, which is the script that
fails, with a text editor and find the lines::

  if [ -d /opt/zextras/docs ]; then
    printMsg "Fixing permissions and ownership on /opt/zextras/docs"
    chown carbonio-docs-editor: /opt/zextras/docs
  fi

The workaround is to *comment out* these four lines, by prepending a ``#``
to each line, that will therefore become::

  #if [ -d /opt/zextras/docs ]; then
  #  printMsg "Fixing permissions and ownership on /opt/zextras/docs"
  #  chown carbonio-docs-editor: /opt/zextras/docs
  #fi

Then, run the script again.
