.. _s3-bench-main:

==============
 S3 Benchmark
==============

This section is contains commands to check availability and
performances of S3 buckets used by |product|.


Definitions
===========

There are two relevant concepts used for the benchmark of an S3 bucket.

.. card:: Time To First Byte (TTFB)

   *Time To First Byte (TTFB)* is the time required by a web server to
   send the **first byte of data** in response to a client's
   request. It is a key performance indicator (**KPI**) that directly
   impacts user experience.

   The factors affecting TTFB are:

   - **Server Processing Time**, which is the time needed by the
     server to process the request

   - **Network Latency**, defined as the time required by the data to
     travel between the client and the server. Factors like distance,
     network congestion, and routing may have a considerable impact on
     the network latency value.

.. card:: *The Time To Last Byte (TTLB)*

   *The Time To Last Byte (TTLB)* is the time required by a web server
   to send the final byte of data in response to a client's
   request. It represents the total duration of the data transfer
   process, including the TTFB.

   The factors affecting TTLB are:

   - **File Size**: the larger the files transferred, the longer is
     the time required by the data to reach the destination, therefore
     increasing the TTLB

   - **Network Bandwidth** between the client and the server affects
     the data transfer speed and consequently the TTLB

   - **Network Congestion** can slow down data transfer, leading to an
     increased TTLB

   - **Server Performance** directly impacts TTLB, since an overloaded
     server will react slowly to requests and will need more time to
     complete them

A low TTFB affects perceived load times, TTLB affects how quickly
users can access and download objects; both measures can dramatically
impact user experience.

.. _s3-bench-checks:

S3 Availability Checks
======================

Availability checks can be carried out using the official AWS CLI
software, which you can install from the official repository of most
Linux distributions.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubu

      .. code::

         # apt install awscli


   .. tab-item:: RHEL
      :sync: rhel

      .. code::

         # dnf install awscli


The next step is to configure AWS credentials.

.. code:: console

   # aws configure

You can verify that your credential are correct by simply checking
that you have access to your S3 buckets with the following command,
which outputs the list of buckets

.. code::

   # aws --endpoint-url https://s3store.example.com/ s3 ls

.. _s3-bench:

S3 Benchmark
============

3 main factors impact the performances of an S3 bucket:

#. Network performances (bandwidth, latency, congestion)

#. The size of files to transfer

#. The number of parallel transfers

While there are several available tools to check the S3 performances, this article
focuses on `Zextras's S3 Benchmark <https://github.com/zextras/s3-benchmark>`_.

Installation
------------

The ``S3-benchmark`` tool can be installed directly from the github
repositories into the standard :file:`/usr/local/bin/` directory as
follows.

.. code:: console

   # wget https://github.com/zextras/s3-benchmark/raw/master/build/linux-amd64/s3-benchmark
   # mv ./s3-benchmark /usr/local/bin/s3-benchmark
   # chmod +x /usr/local/bin/s3-benchmark


Configuration
-------------

To configure the S3 access credentials, you can set the following
Linux's environmental variables.

.. code:: console

   # export AWS_ACCESS_KEY_ID='access_key'
   # export AWS_SECRET_ACCESS_KEY='access_secret'

Both variable  will be available in the current
CLI session until either you log out or you explicitly
:command:`unset` them:


.. code:: console

   # unset AWS_ACCESS_KEY_ID
   # unset AWS_SECRET_ACCESS_KEY

Additional common methods to configure the S3 credentials are
described on the official
`AWS Security Blog <https://aws.amazon.com/it/blogs/security/a-new-and-standardized-way-to-manage-credentials-in-the-aws-sdks/>`_.

Usage
-----

A sample benchmark execution with some common options and suitable
values is:

.. code::

   # s3-benchmark -bucket-name speed-test -endpoint \
   https://s3store.example.com/ -payloads-max 12 -threads-max \
   6 -threads-min 2 -upload-csv from_$(hostname -f)

Options and values used are:

-bucket-name speed-test
   speed-test is the bucket name that will be created

-endpoint https\://s3store.example.com/
   https\://s3store.example.com/ Sets the S3 endpoint to use if not
   Amazon

-payloads-max 12
  The maximum object size to test, with 1 meaning 1 KB, and every increase
  doubles the previous value, hence 12 means 4096 KB, so 4MB

-threads-max 6
   The maximum number of threads to use when fetching objects

-threads-min 2
  The minimum number of threads to use when fetching objects

-upload-csv from\_$(hostname f)\_$(date +"%m/%d/%Y %H:%M").csv
  Uploads the test results to S3 as a CSV file using the source
  hostname and time and date of execution

For a complete list of options, run:

.. code::

   s3-benchmark --help

.. _s3-bench-bp:

Optimal Values for Primary Storage
----------------------------------

The be reliably used as **Primary Storage**, an AWS S3 bucket must
satisfy the following conditions, in order of importance:

- The *throughput** must be at least **100 MB/s**

- the *average TTFB* is:

  - lower than **50** milliseconds

  - **stable** when increasing the number of threads

- While the *TTLB average* can not be estimated, as it depends on the
  size of the object being transferred, nonetheless it must be
  **stable** when increasing the number of threads

**Stable** means that connection has no bottleneck, and the above
values should be met for *each application server*, that is, every
server accessing the S3 bucket needs a fast and reliable connection to
the Object Storage.

Example Benchmark Output
------------------------

In this section we show the results of some sample benchmark for local
(LAN) and remote (WAN) connections using a **2MB** object.

.. card:: LAN connection

   .. figure:: /img/administration/s3_example1.png
      :width: 99%

      Sample benchmarks for a WAN connection.

   As shown in the output, testing for an object of size 2MB leads to
   these results:

   #. The **Throughput** is between 111.5 and 111.6 MB/s.

   #. The **average TTFB** is between 6 and 10 milliseconds at the
      change from 2 to 6 threads

   #. The **average TTLB** is between 36 and 105 milliseconds at the
      change from 2 to 6 threads

   By comparing these values with those shown in the
   :ref:`s3-bench-bp` Section, we can conclude that the AWS S3
   bucket's performances are  enough to be using it for a primary
   storage.

.. card:: WAN connection

   .. figure:: /img/administration/s3_example2.png
      :width: 99%

      Sample benchmarks for a WAN connection.

   As shown in the output, testing for an object of size 2MB leads to
   these results:

   #. The **Throughput** is 17 MB/s.

   #. The **average TTFB** is between 10 and 14 milliseconds at the
      change from 2 to 6 threads

   #. The **average TTLB** is between 236 and 687 milliseconds at the
      change from 2 to 6 threads


   By comparing these values with those shown in the
   :ref:`s3-bench-bp` Section, we can conclude that the AWS S3
   bucket's performances are not good enough for its use as a primary
   storage, but they suffice if it is used as a secondary storage.
