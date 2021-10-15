Description
==========
* * *
This repo contains the new Zextras product documentation (docs.zextras.com) generated with Sphinx

The source files (written in REST language) are contained in the 'source' directory

Requirements
==========
* * *
Basic requirements:

- python3
- pip (install with: python3 -m pip install --upgrade pip)

Contained in the file requirements.txt:

- Sphinx
- sphinx-design
- sphinx_rtd_theme
- sphinx_copybutton

To install these items run: pip3 install -r requirements.txt

Usage
=====
* * *
run: ./doc_build_all.sh

This command performs a 'make html' in the source subfolders:

- carbonio
- carbonio-ce
- landing
- suite

As a result of compiling you will have static html files in the output directory (build)
