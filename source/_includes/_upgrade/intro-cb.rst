
|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out 
by means of a few commands to be executed.

There are two alternatives to carry out an upgrade: :ref:`by using
Ansible <upgrade-ansible>` and :ref:`manually <upgrade-manual>`.

The **procedure using Ansible** is fully automatised and can be
executed unattended, without even logging to the Nodes (please refer
to Section :ref:`install-with-ansible`): you start the upgrade and
check back for the outcome at a later point.

The **manual procedure** requires to login to each Node and issue
commands there. You also need to follow the procedure in case there
are errors.

We can not provide any estimate on the time required by the upgrade,
because various factors may impact the duration, including the number
of Nodes, their load, the speed of network connection, and so on.

In some cases, incompatibilities may seldom arise in the upgrade of
third-party software, which may lead to some additional manual steps
to be carried out. This is true especially in the case of upgrading
from older versions, so please check Section :ref:`ts-up-older` under
:doc:`/troubleshooting/toc` before starting the upgrade.
