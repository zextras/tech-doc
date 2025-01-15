S3 Benchmark
============

**Definitions**
===============

**The time to first byte (TTFB)** is a measure of how long it takes
for a web server to start sending the first byte of data in response
to a client's request. It's a key performance indicator (KPI) that
directly impacts user experience.

**Factors Affecting TTFB:**

-  **Server Processing Time:** The time it takes for the server to
   process the request

-  **Network Latency:** The time it takes for data to travel between
   the client and the server, influenced by factors like distance, netw
   ork congestion, and routing.

**The time to last byte (TTLB)** is a measure of how long it takes for
a web server to send the final byte of data in response to a client's
request. It represents the total duration of the data transfer process,
including the time taken to send the initial byte (TTFB) and the
subsequent bytes.

**Factors Affecting TTLB:**

-  **File Size:** Larger files will naturally take longer to transfer,
   increasing TTLB.

-  **Network Bandwidth:** The available network bandwidth between the
   client and the server affects data transfer speed and, consequently, TTLB.

-  **Network Congestion:** Network congestion can slow down data
   transfer, leading to increased TTLB.

-  **Server Performance:** The server's ability to process therequest
   and send data can also impact TTLB.

A low TTFB affects perceived load times, TTLB affects how quickly users
can access and download objects both could have great impacts on user
experience.

**S3 Availability Checks**
==========================

Install AWS CLI:

.. code::

   apt install awscli

Configure AWS credentials:

.. code::

   aws configure

You can simply check that you have access to s3 with the following
command:

.. code::

   aws --endpoint-url https://s3store2.infocom.kg/ s3 ls

It will show you the list of buckets.

.. _s3-benchmark-1:

**S3 Benchmark**
=================

S3 performance depends on 3 things:

3. Network performances bandwidth/latency

4. File size

5. The number of parallel transfers

Multiple tools are available to check the S3 performances, this article
focuses on `https://github.com/zextras/s3-benchmark <https://github.com/zextras/s3-benchmark>`_

Installation
------------

Installation process for the tool for the S3
benchmark:

.. code::

   wget https://github.com/zextras/s3-benchmark
   mv ./s3-benchmark /usr/local/bin/s3-benchmark
   chmod +x /usr/local/bin/s3-benchmark

Configuration
-------------

Set credentials using a common
`method <https://aws.amazon.com/it/blogs/security/a-new-and-standardized-way-to-manage-credentials-in-the-aws-sdks/>`_

.. code::

   export AWS_ACCESS_KEY_ID=3D'access_key'
   export AWS_SECRET_ACCESS_KEY=3D'access_secret'

Usage
-----

Command to run the benchmark:

.. code::

   s3-benchmark -bucket-name speed-test -endpoint https://your_s3_endpoint \
   -payloads-max 12 -threads-max 6 -threads-min 2 -upload-csv from_$(hostname -f)

Options used:

+-----------------------------------+----------------------------------+
| **Option**                        |                                  |
+===================================+==================================+
| -bucket-name speed-test           | speed-test is the bucket name    |
|                                   | that will be created             |
+-----------------------------------+----------------------------------+
| -endpoint https://your_s3_endpoint| Sets the S3 endpoint to use if   |
|                                   | not Amazon                       |
|                                   |                                  |
|                                   |                                  |
+-----------------------------------+----------------------------------+
| -payloads-max 12                  | The maximum object size to test, |
|                                   | with 1 3D 1 KB, and every        |
|                                   | increment is a double of the     |
|                                   | previous value 12 arrives at 4   |
|                                   | MB                               |
+-----------------------------------+----------------------------------+
| -threads-max 6                    | The maximum number of threads to |
|                                   | use when fetching objects        |
+-----------------------------------+----------------------------------+
| -threads-min 2                    | The minimum number of threads to |
|                                   | use when fetching objects        |
+-----------------------------------+----------------------------------+
| -upload-csv from\_$(hostname      | Uploads the test results to S3   |
| -f)\_$(date +"%m/%d/%Y            | as a CSV file whith the source   |
| %H:%M").csv                       | hostname and time and date of    |
|                                   | execution                        |
+-----------------------------------+----------------------------------+

For a complete list of the usage of the tool run:

.. code::

   s3-benchmark --help

Output examples
---------------

Example 1
~~~~~~~~~

Sample output for a good *LAN* connection (this is a good result for
**primary storage**):

.. figure:: /img/administration/s3_example1.png
   :width: 99%

   Sample benchmarks (LAN connection)


Output description:

As you can see from the output, testing for an object of 2MB:

3. The *average* **TTFB** is between 6 and 10 milliseconds at the
   change from 2 to 6 threads

4. The *average* **TTLB** is between 36 and 105 milliseconds at the
   change from 2 to 6 threads

5. The **Throughput** present is between 111.5 and 111.6 MB/s.

The result of the benchmark is that the tested AWS S3 bucket is
performant enough to be using it for a primary storage.

Example 2
~~~~~~~~~

Sample output for a good *WAN* connection (this is a good result for
**secondary storage**):

.. figure:: /img/administration/s3_example2.png
   :width: 99%

   Sample benchmarks (WAN connection)


Output description:

As you can see from the output, testing for an object of 2MB:

1. The *average* **TTFB** is between 10 and 14 milliseconds at the
   change from 2 to 6 threads

2. The *average* **TTLB** is between 236 and 687 milliseconds at the
   change from 2 to 6 threads

3. The **Throughput** present is 17 MB/s.

The result of the benchmark is that the tested AWS S3 bucket is not
performant enough to be using it for a primary storage. It is good
enough for a secondary storage.

General rule
============

The necessary output of the S3 benchmark of an AWS S3 bucket that could
be used as primary storage has to have the following results:

-  Throughput at least of **100 MB/s**

-  TTFB is on average:

   -  minimal, under **50** milliseconds

   -  **stable**, almost the same with a change of the number of
      threads

-  TTLB is on average:

   -  The TTLB depends from the file size it important that it is stable

   -  **stable**, almost the same with a change of the number of
      threads

Stable values means that connection performances has no bottleneck, the
above values are intended for *each application server*, so every
server accessing the S3 bucket needs a fast and reliable connection to
the Object storage.
