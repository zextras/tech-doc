<!--
SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>

SPDX-License-Identifier: CC-BY-NC-SA-4.0
-->

# Description

This repo contains the source code of the Zextras product
documentation, written with [Python
Sphinx](https://www.sphinx-doc.org/en/master/) and publicly available
on https://docs.zextras.com/ web site.

The source files are contained in the `source` directory, which is organised
as follows:

* `carbonio/`, `carbonio-ce/`, and `suite/`: all the documentation
  related to the given products, including all the layout files
  (theme, CSS)
* `common`: files common to all products: CSS and documentation files
  used by both Carbonio and Carbonio CE
* `cli`: Zextras Suite Command Line Reference
* `img`: images used by all products
* `landing`: redirect page to official docs.zextras.com landing page
* `_includes`: source file `include::`d by both Carbonio and Carbonio
  CE
* `LICENSES`: text of licenses that are applied to this source code


# Build Requirements

The documentation is built with the latest version of Sphinx via a
Makefile, therefore the basic requirements are:

- python3
- virtualenv or venv (optional, if you prefer to use a local python
  environment instead of the system-wide python3 installation)
- make
- all python packages listed in the file `requirements.txt`

To install requirements, use e.g.,

```
 pip install -r requirements.txt
```

To build all product's documentation at once and producing the HTML
output, run `./doc_build_all.sh`

This command performs a `make html` in all source sub-folders:

- carbonio
- carbonio-ce
- suite

As a result of compiling the source files you will have static html
files in the output directory (build).

To build only one of the three manuals, run `make html` from within the
product's directory.

You can serve them on a local HTTP server using python's built-in http
server: `python3 -m http.server --directory build 8000`. Choose a port
that is not yes used, then point your browser to **localhost:8000/**
and browse to the documentation.

# Contribute

The public repository contains branches called `release/*` up to the
**23.6**, that contain version-specific documentation. Starting from
version 23.7, the development branch is called **devel**.

We'll be happy to accept contributions, provided they meet the
requirements and follow the guidelines.

## Requirements

Any contribution **must** be in form of Pull Requests (PR) to the
public GitHub repository and must build (`make html`) with the latest
versions of the Python packages required (upgrade them with `pip install
--upgrade -r /requirements.txt` before building).

You must fork the public repository, make the changes you need, and
open a PR against the `devel` branch.

All accepted contributions will be subject to review and if
successful, they will appear on the official documentation.

By submitting a PR, you agree that:

* you are the author and all the material you include in the PR is
  your own work
* your work will be included in documentation and will be subject to
  the same license.

## Guidelines

Please try to adhere to these guidelines as much as possible to speed
up acceptance.

### Unacceptable Changes

PR including any of the following will **not** be accepted.

* changes in CSS, theme, layout, Javascript, and in general any
  changes related to the Zextras corporate identity
* changes in licensing and copyright information (see section License
  and Copyright at the bottom)
* any piece of work containing inappropriate language or material,
  including but not limited to obscenity, profanity, vulgarity,
  derogative or discriminatory terms towards users or organisations
* references to companies other than Zextras
* copyrighted material (images, diagrams, text)
* binary files other than images or diagrams
* changes in terminology, examples, and scenarios used in the
  documentation. However, we'll be happy if you submit your own
  examples and scenarios, that we will review and include if they are
  significant.

### Pull Requests

* Each PR must address one issue at a time and should contain changes
  to one topic **only**. Example: if you submit a work focused on the
  use of Calendar, the PR can not contain references to Chat or to a
  Management Task.
* Open a PR only when you consider it ready for review.
* Make sure the PR is REUSE complaint.
* You can prefix the PR's title like the following for a better
  understanding of your contribution
  * [NEW] a new and original piece of work
  * [BUG] a correction to something wrong (typos, concepts described,
    and so on)
  * [ENH] improvements to an existing piece of work

### Commits and Commit Messages

Each commit should be small and contain only self-contained
changes. Example:

1. You add an introductory paragraph to Mail source file
2. In the same file, but in another paragraph you create a cross
   reference to Files for which you need to add a new label in source
   file.

While your work is almost all within one file, the first change is a
single commit concerning one file, while the second change is a commit
that include both files.

A commit message should be concise and describe clearly the content of
the commit.

### Content

All contributions must be in good English and must use Zextras
terminology consistent with the remainder of the documentation. As we
rely on Sphinx substitutions especially for the name of the modules,
please use them whenever possible.

Avoid large edits in main rst files (i.e., thoose in the `toctree::`s,
use Sphinx's `include::` mechanism instead (see section **Included
Files** below).

### Included files

All included files must be saved under a directory under
`source/_include/`, corresponding to the file where it is
included. Files specific for Carbonio CE must end in **-ce.rst**,
while files for Carbonio in **-cb.rst** (e.g., `intro-ce.rst` and
`intro-cb.rst`).

Included files must not contain a starting header, which must be
written in the files with the `include::` directive. Also, avoid large
use of headings in the included files.

Make included files short and self contained.

Keep a width of at most 70 or 80 columns for the lines.

## License and Copyright

Zextras documentation is released under [CC BY-NC-SA
4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) license and
is [REUSE](https://reuse.software/) compliant. Contribution will be
subject to the same license.

Each non-binary file in the repository needs to contain in its header
the following copyright notice, which must be commented out according
to the file type (.rst example):

    .. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
    ..
    .. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Binary files must have an entry in file `.reuse/dep5`.

The only exception to this rule are [Insignificant
files](https://reuse.software/tutorial/#insignificant-files), which
have a **CC0-1.0** license.
