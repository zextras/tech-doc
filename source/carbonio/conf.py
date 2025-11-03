
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
import time

# This approach does not currently work with Docker/Jenkins, so we set
# only the main doc hub for now
hubhome = 'https://docs.zextras.com/landing/zextras_documentation.html'

# -- Get current year --------------------------------------------------------
current_year = time.strftime('%Y')

# -- Project information -----------------------------------------------------

project = 'Carbonio Administration Guide'
copyright = '2025: ZEXTRAS'
author = 'The Zextras Team'

# this variable is used in the  upgrade procedure, remember to change it together with the release. Since upgrade doesn't discriminate on patch number, we do not need the last cipher.
previous_release = '25.6'


# The full version, including alpha/beta/rc tags
release = '25.9.0'
version = release

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [ 'sphinx_design', 'sphinx_copybutton',
               'sphinxcontrib.email', 'sphinx.ext.extlinks',
               'sphinx_sitemap', 'sphinx_last_updated_by_git' ]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [ '_includes', 'cli', 'playbook',
                     'admincli/administration/delegatedadmin.rst',
                     'common/carbonio' ]

rst_prolog = """
.. |product| replace:: Carbonio
.. |storage| replace:: Carbonio Storage
.. |prev| replace:: :strong:`%s`
.. |current| replace:: :strong:`%s`
""" %(previous_release, release)  + open("replace.txt").read()

# -- Configuration of extensions ---------------------------------------------

# copybutton, see https://sphinx-copybutton.readthedocs.io/en/latest/
copybutton_prompt_text = r'\$\s|#\s|carbonio>\s|zextras\$\s|postgres=#\s'
copybutton_prompt_is_regexp = True
copybutton_line_continuation_character = "\\"
copybutton_only_copy_prompt_lines = True

numfig = True

email_automode = True

extlinks = {'pr': ('https://github.com/zextras/tech-doc/pull/%s',
                   'PR #%s') }

# sphinx-sitemap, sphinx-last-updated-by-git
html_baseurl = 'https://docs.zextras.com/carbonio/html/'
# setting to false due to Jenkins doing shallow clones - see section Caveats at https://github.com/mgeier/sphinx-last-updated-by-git/tree/master
sitemap_show_lastmod = False
# we do not need version or language
sitemap_url_scheme = '{link}'
# this is the default name anyway, adding for reference
sitemap_filename = 'sitemap.xml'

todo_include_todos = False
# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_book_theme'
html_show_sourcelink = False

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
html_css_files = [ 'css/carbonio.css' ]
html_js_files = [ 'js/posthog.js' ]
html_favicon = 'img/favicon_docs.ico'
html_title = project + ' Documentation'
html_last_updated_fmt = ''
templates_path = [ 'common/templates' ]
html_theme_options = {
    'use_download_button': False,
    'repository_url': 'https://github.com/zextras/tech-doc/',
    'repository_branch': 'master',
    'use_repository_button': True,
    'use_issues_button': True,
    'navigation_with_keys': False,
    'extra_footer': '<a href="https://docs.zextras.com/landing/privacy-legal.html" target="_blank">Privacy &amp; Legal</a> ',
    'logo': {
        'image_light': 'carbonio-black.svg',
        'image_dark': 'carbonio-white.svg',
        'text': '%s' %release,
    },
    
    # Add button for surveys at the bottom of the right-hand side menu
    # (local ToC)
    #'secondary_sidebar_items': ['page-toc', 'survey'],

    # Add button for surveys at the bottom of the right-hand side menu
    # (global ToC)
    #'primary_sidebar_end': ['survey'],
}
html_sidebars = { "**": [ 'navbar-logo.html',
			  'zxbrand',
                          'search-button-field.html',
                          'sbt-sidebar-nav.html', 'index.html', 'home.html' ] }

html_context = {
    'hubhome' : '%s' %hubhome,
}

# -- Options for linkcheck output --------------------------------------------

# list of URLs to ignore
linkcheck_ignore = [ r'.*.example.com(:\d+)?/',
                     r'https:\/\/my-saml-provider\.org\/',
                     r'https:\/\/notifications.zextras.com\/firebase\/',
                     r'https:\/\/mycompany.okta.com/.*',
                     r'../../.*' ]

# there are more options, but at the moment we don't need them. They
# can be found at
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-the-linkcheck-builder

# -- Options for latexpdf output ---------------------------------------------

latex_engine = 'lualatex'
sd_fontawesome_latex = True
master_doc = 'index'
pdf_file = 'CarbonioAdminGuide.tex'
pdf_title = 'Administration Guide'
latex_documents = [ [ master_doc, pdf_file, pdf_title, author, 'manual', True ] ]
latex_use_xindy = False
latex_logo = '_static/carbonio-logo.png'

# ----------------------------------------------------------------------------
###
# This custom code is required as a workaround for a build error
# caused by extension sphinx-new-tab-link
###

from sphinx.writers.html import HTMLTranslator
class PatchedHTMLTranslator(HTMLTranslator):
    def starttag(self, node, tagname, *args, **attrs):
        if (
                tagname == "a"
                and "target" not in attrs
                and (
                    "external" in attrs.get("class", "")
                    or "image-reference" in attrs.get("class", "")
                    or "external" in attrs.get("classes", [])
                )
        ):
            attrs["target"] = "_blank"
            attrs["ref"] = "noopener noreferrer"
        return super().starttag(node, tagname, *args, **attrs)


def setup(app):
    app.set_translator("html", PatchedHTMLTranslator)
