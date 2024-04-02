.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. Zextras Carbonio documentation master file, created by
   sphinx-quickstart on Thu Aug 26 11:06:34 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

********************************************
 Welcome to |carbonio| Documentation!
********************************************

This is the documentation of |carbonio|, the fully private digital
workplace.

The content is organised in multiple parts:

Introduction
  Useful and generic information about |product|.
  
Release
  List of issues fixed in the current release of |product| and
  directions to carry out the upgrade

Install
  Information on |product| and its architecture, installation and
  upgrade instructions, security tips
  
Admin by GUI
  |product| administration using the |adminui|
  
Admin by CLI
  Administration of |product| from the command line: management tasks
  and some advanced usage for |mesh|
  
User Guides
  Everyday's usage of |product|, including its use on the dedicated
  mobile Apps
  
Develop
   Links to API reference

If you are looking for |ce|'s documentation, please refer to its
`dedicated page <../../carbonio-ce/html/index.html>`_.

.. grid:: 1 2 2 3
   :gutter: 3


   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2

         basics/general

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2

         release/toc

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2

         install/toc

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2

         postinstall/toc

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2

         adminpanel/toc

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2
         :includehidden:

         admincli/toc

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 2

         usage/toc

   .. grid-item-card::
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5

      .. toctree::
         :maxdepth: 1

         develop/toc

   .. grid-item-card::
      :columns: 12 12 6 6

      .. toctree::
         :maxdepth: 1

         glossary
      
.. raw:: html

        <section id="feedback-form">
        <h4>Was this page helpul?<a class="headerlink" href="#feedback-form" title="Permalink to this heading">#</a>
        </h4>
        <style type="text/css">
           .ratings {
             display: inline-block;
             width: 100%;
             margin-top: 40px;
             padding-top: 40px;
             text-align: center;
           }
           .like {
             display: inline-block;
             color: rgb(87, 154, 202);
             cursor: pointer;
             margin: 10px;
           }
        
           .dislike {
             display: inline-block;
             color: rgb(87, 154, 202);
             cursor: pointer;
             margin: 10px;
           }

           .dislike:hover,
           .like:hover {
             color: black;
             transition: all .2s ease-in-out;
             transform: scale(1.1);
           }

           .dislike:active,
           .like:active {
             display: inline-block;
             color: rgb(87, 154, 202);
             transition: all .2s ease-in-out;
             transform: scale(2.1);
           }

        </style>

        <div class="rating">
          <!-- Thumbs up -->
          <div id="icon1" class="like grow">
            <i class="fa fa-thumbs-up fa-3x" aria-hidden="true"></i>
          </div>
          <!-- Thumbs down -->
          <div id="icon0" class="dislike grow">
            <i class="fa fa-thumbs-down fa-3x" aria-hidden="true"></i>
          </div>

           <script>
           function getPageName(url) {
              var index = url.lastIndexOf("/") + 1;
              var filenameWithExtension = url.substr(index);
              var filename = filenameWithExtension.split(".")[0]; // <-- added this line
              return filename;                                    // <-- added this line
           }

           const icons = document.querySelectorAll('.like,.dislike');
           const iconURL = window.location.href; // Get the last digit of the ID (icon#)
           const iconPageName = getPageName(iconURL);
           icons.forEach(icon => {
              icon.addEventListener('click', () => {
                 const iconId = icon.id.slice(-1); // Get the last digit of the ID (icon#)

                 const url = `https://analytics.zextras.tools/matomo.php?idsite=4&rec=1&url=${iconURL}&e_c=vote&e_n=${iconPageName}&e_v=${iconId}`;
                 fetch(url)
                 .then(response => response.text())
                 .then(data => {
                    console.log("GET request to", url, "successful. Response:", data);
                    // You can further process the response data here (optional)
                 })
                 .catch(error => console.error("GET request failed:", error));
              });
           });
           $(function (){
              var like = '.like',
                    selected = '.active';

              $(like).on('click', function(){
                 $(selected).each(function(){
                    $(this).removeClass('active');
                 });
                 $(this).addClass('active');
              });

              });
           </script>

        </div>
