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

# -- Project information -----------------------------------------------------

project = 'Zextras Carbonio'
copyright = '2022, The Zextras Team'
author = 'The Zextras Team'

# The full version, including alpha/beta/rc tags
release = '1.0'
version = release

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [ 'sphinx_design', 'sphinx.ext.extlinks',
               'sphinx_copybutton', 'sphinxcontrib.email' ]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_includes', 'common/cli', 'glossary.rst']

rst_prolog = """

.. |product| replace:: Carbonio

""" + open("replace.txt").read()

# -- Configuration of extensions ---------------------------------------------

# extlinks, see
# https://www.sphinx-doc.org/en/master/usage/extensions/extlinks.html
extlinks = {
    'carbonio': ('/carbonio/html/%s', None ),
    'ce': ('/carbonio-ce/html/%s', None ),
    'community': ('https://community.zextras.com/', None)
}

# copybutton, see https://sphinx-copybutton.readthedocs.io/en/latest/
copybutton_prompt_text = r'\$\s|#\s'
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
html_css_files = [ 'css/carbonio.css' ]
html_logo = 'img/logos/carbonio-white.svg'
html_favicon = 'img/favicon.ico'
html_title = project + ' Documentation'
html_theme_options = {
      'analytics_id': 'UA-23692145-1', 
      'analytics_anonymize_ip': False,
#     'sticky_navigation': True,
#     'logo_only': True
}
