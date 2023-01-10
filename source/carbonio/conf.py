# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
#
# SPDX-License-Identifier: CC-BY-NC-SA-4.0

# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
# sys.path.insert(0, os.path.abspath('.'))
import sphinx_rtd_theme
import time

# This approach does not currently work with Docker/Jenkins, so we set only the main doc hub for now

# import git

# # -- Get current branch and set hub's home page accordingly ------------------
# repo = git.Repo(search_parent_directories=True)
# branch = repo.active_branch

# if branch.name == 'pre_release' :
#     hubhome = 'http://zextrasdoc.s3-website-eu-west-1.amazonaws.com/landing/zextras_documentation.html'
# else :
#     hubhome = 'https://docs.zextras.com/landing/zextras_documentation.html'

hubhome = 'https://docs.zextras.com/landing/zextras_documentation.html'

# -- Get current year --------------------------------------------------------
current_year = time.strftime('%Y')

# -- Project information -----------------------------------------------------

project = 'Zextras Carbonio'
copyright = '2022, The Zextras Team'
author = 'The Zextras Team'

# The full version, including alpha/beta/rc tags
release = '23.1.0'
version = release

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [ 'sphinx_design', 'sphinx_copybutton',
               'sphinxcontrib.email' ]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_includes', 'cli', 'glossary.rst', 'common/adminpanel']

rst_prolog = """

.. |product| replace:: Carbonio
.. |storage| replace:: Carbonio Storages

""" + open("replace.txt").read()

# -- Configuration of extensions ---------------------------------------------

# copybutton, see https://sphinx-copybutton.readthedocs.io/en/latest/
copybutton_prompt_text = r'\$\s|#\s|carbonio>\s|zextras\$\s'
copybutton_prompt_is_regexp = True
copybutton_line_continuation_character = "\\"

numfig = True

email_automode = True

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'
html_show_sourcelink = False

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
html_css_files = [ 'css/carbonio.css',
                   "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
                  ]
html_logo = 'img/logos/carbonio-white.svg'
html_favicon = 'img/favicon.ico'
html_title = project + ' Documentation'
html_theme_options = {
    'collapse_navigation': False
}
html_context = { 'hubhome' : '%s' %hubhome }

# -- Options for linkcheck output --------------------------------------------

# list of URLs to ignore
linkcheck_ignore = [ r'.*.example.com(:\d+)?/',
                     'https:\/\/my-saml-provider\.org\/',
                     'https:\/\/notifications.zextras.com\/firebase\/',
                     r'https://mycompany.okta.com/.*',
                     r'../../.*' ]

# there are more options, but at the moment we don't need them. They
# can be found at
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-the-linkcheck-builder
