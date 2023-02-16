.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-api:

API for |product|
=================

|zx| makes available to developers a couple of APIs to interact with
the current version (|release|) of |product| components. To read their
documentation, follow the URLS:

* `Carbonio API <../../apidoc/api-reference/index.html>`_ is used
  to interact via SOAP with the main functions of |product|

* `Carbonio Files blob <../../apidoc/files_blob/index.html>`_, for
  managing the uploading, downloading of BLOB files and links to them

* `Carbonio Files metadata <../../apidoc/files_meta/index.html>`_
  metadata API

Third-party API
===============

Most of the software integrated in |product| exposes its own API to
allow for programmatic access to their functionalities. This is the
case of **clamd**, the protocol used by ClamAV. However, clamd defines
also potentially dangerous commands like ``shutdown``, that should
never be exposed. The solution is therefore to use a different
approach, for example using a docker image that acts as a proxy
towards clamd's interface, like for example
https://hub.docker.com/r/benzino77/clamav-rest-api (see also the
related `documentation
<https://github.com/benzino77/clamav-rest-api>`_). This approach has
however not yet been thoroughly tested.
