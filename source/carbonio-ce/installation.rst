==========================
 Carbonio CE Installation
==========================

This page provides directions for the installation of |community|.


System Requirements
===================

|community| can be installed as a set of packages on top of an Ubuntu,
CentOS, or RedHat Linux distribution.

.. note:: Since CentOS and RedHat distribution are binary compatible,
   instructions for these two distributions are the same.

Before attempting the installation of |community| you need:

.. dropdown:: A supported Linux server distribution

   It is assumed that you have already set up and configured a Linux
   server and have access as the ``root`` user to it.

   Supported Linux distributions are **Ubuntu**, **CentOS**, or
   **Redhat**.

   Make sure that the system is up-to-date.

   .. tab-set::

      .. tab-item:: Ubuntu

         Run as the ``root`` user these commands.

         .. code:: bash

            # apt-get update --fix-missing

         .. code:: bash

            # apt-get update

         .. code:: bash

            # apt-get -y upgrade

      .. tab-item:: Centos/RedHat

         Run as the ``root`` user these commands.

         .. code:: bash

            # dnf upgrade

.. dropdown:: To install required software packages

   The following software packages must be installed on the system

   * **gnupg2**
   * **ca-certificates**
   * **dnsmasq**

   Use the following command as the `root` user to install them.

   .. tab-set::

      .. tab-item:: Ubuntu

         Run as the ``root`` user either of the commands.

         .. code:: bash

            # apt install gnupg2 ca-certificates dnsmasq

         .. code:: bash

            # apt-get install gnupg2 ca-certificates dnsmasq

         .. code:: bash

            # aptitude install gnupg2 ca-certificates dnsmasq

      .. tab-item:: Centos/RedHat

         Run as the ``root`` user either of the commands.

         .. code:: bash

            # yum install gnupg2 ca-certificates dnsmasq

         .. code:: bash

            # dnf install gnupg2 ca-certificates dnsmasq

   To configure dnsmasq, execute this command, the same on all
   systems:

   .. code:: bash

      echo -e  '127.0.0.1 localhost \n'$(hostname -I) 'carbonio.loc carbonio' >> /etc/hosts

.. dropdown:: Credentials to access |zx| repository

   The credentials are provided by |zx|. On Ubuntu, you need to store
   them in a file, while on CentOS/RedHat you can skip this steps,
   because credentials are stored in the repository configuration.

   .. tab-set::

      .. tab-item:: Ubuntu

         Create file :file:`/etc/apt/auth.conf.d/zextras.conf` with the
         following content.

         .. code:: ini

            machine zextras.jfrog.io
            login username
            password token

      .. tab-item:: CentOS/RedHat

         Safely skip to next step.

.. dropdown:: To setup |zx| repository

   .. tab-set::

      .. tab-item:: Ubuntu

         Create file :file:`/etc/apt/sources.list.d/zextras.conf` with the
         following content.

         .. code:: text

            deb [trusted=yes] https://zextras.jfrog.io/artifactory/ubuntu-playground bionic main

      .. tab-item:: CentOS/RedHat

         Create a `.repo` file :file:`/etc/yum.repos.d/zextras.repo` with the
         following content.

         .. code:: ini

            [Zextras]
            name=Zextras
            baseurl=https://username:token@zextras.jfrog.io/artifactory/centos8-playground/
            enabled=1
            gpgcheck=1
            gpgkey=https://username:token@zextras.jfrog.io/artifactory/centos8-playground/repomd.xml.key

.. dropdown:: The public |zx| GPG signing key

   The last step is to import |zx| GPG key. This step is not necessary
   on CentOS/RedHat, as the GPG key is part of the repository configuration.

   .. tab-set::

      .. tab-item:: Ubuntu

         Import the GPG key with this command.

         .. code:: bash

            # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 52FD40243E584A21

      .. tab-item:: CentOS/RedHat

         Safely skip this step.

Once all these steps have been successfully accomplished, you can
proceed to install |community| packages, either on a
:ref:`Single-Server <single-server-install>` or a :ref:`Multi-Server
<multi-server-install>` setup.

Software Components
===================

.. _single-server-install:

Single-Server Installation
==========================

To install |community| on a Single-Server setup, execute the following
commands.

.. tab-set::

   .. tab-item:: Ubuntu

      Update the list of available packages, then install the
      packages:

      .. code:: bash

         # apt-get update && apt-get install carbonio-ce

   .. tab-item:: CentOS/RedHat

      Update the list of available packages, then install the
      packages:

      .. code:: bash

         # dnf-update
         # dnf install carbonio-ce


.. _multi-server-install:

Multi-server Installation
=========================
