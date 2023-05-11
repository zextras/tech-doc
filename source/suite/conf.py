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
current_year = time.strftime('%Y')

hubhome = 'https://docs.zextras.com/landing/zextras_documentation.html'

# -- Project information -----------------------------------------------------

project = 'Zextras Suite'
copyright = '2022: ZEXTRAS, All rights reserved'
author = 'The Zextras Team'

# The full version, including alpha/beta/rc tags
release = '3.17.0'

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [ 'sphinx_design', 'sphinx_copybutton' ]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [ '00-includes', 'cli/*/', 'changelogs/3.1.*', 'glossary.rst', 'common/carbonio', 'credentialmanagement.rst' ]

rst_prolog = """

.. |product| replace:: Suite

""" + open("replace.txt").read()

# -- Configuration of extension ----------------------------------------------
# Enable cross referencing for figure, tables, sections, and code snippets

numfig = True

# copybutton, see https://sphinx-copybutton.readthedocs.io/en/latest/
copybutton_prompt_text = r'\$ |\#'
copybutton_prompt_is_regexp = True


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'
html_show_sourcelink = False
html_favicon = 'img/favicon.ico'
html_title = 'Welcome to %s %s Documentation' %(project, release)
html_short_title = '%s %s Documentation' %(project, release)
html_context = {
    'doctitle' : html_title
}

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
html_css_files = [ 'css/suite.css', 'css/common.css',
                   'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/fontawesome.min.css'
                  ]
html_logo = 'img/logos/suite-white.svg'

html_theme_options= {
    'style_nav_header_background': 'var(--zx-color-magma)',
    'style_external_links': True,
    'collapse_navigation': False
}
html_context = { 'hubhome' : '%s' %hubhome }

# -- Options for linkcheck output --------------------------------------------

# list of URLs to ignore
linkcheck_ignore = [ r'.*.example.com(:\d+)?.*',
                     'https:\/\/my-saml-provider\.org\/',
                     'https:\/\/notifications.zextras.com\/firebase\/',
                     r'https://support.zextras.com/',
                     r'https://mycompany.okta.com/.*',
                     r'../../.*' ]

# cli commands contain quite a lot of broken urls for several reasons
# - since they are all example URLS, we ignore them.
linkcheck_exclude_documents = [ r'(.*\/)?cli\/.*' ]

# there are more options, but at the moment we don't need them. They
# can be found at
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-the-linkcheck-builder
