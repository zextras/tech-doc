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
      
Feedback Form
-------------

If you would like to help us improve our technical documentation, please fill out this form and share a suggestion on how we could improve this article.

.. raw:: html

   <style type="text/css">
      .ratings {
      list-style-type: none;
      margin: 0;
      padding: 0;
      width: 100%;
      direction: rtl;
      text-align: left;
      }

      .star {
      position: relative;
      line-height: 60px;
      display: inline-block;
      transition: color 0.2s ease;
      color: #ebebeb;
      }

      .star:before {
      content: '\2605';
      width: 60px;
      height: 60px;
      font-size: 60px;
      }

      .star:hover,
      .star.selected,
      .star:hover ~ .star,
      .star.selected ~ .star{
      transition: color 0.8s ease;
      color: black;
      }
   </style>

   <div>
       <ul class="ratings">
         <li id="icon5" class="star"></li>
         <li id="icon4" class="star"></li>
         <li id="icon3" class="star"></li>
         <li id="icon2" class="star"></li>
         <li id="icon1" class="star"></li>
      </ul>

      <script>
      function getPageName(url) {
         var index = url.lastIndexOf("/") + 1;
         var filenameWithExtension = url.substr(index);
         var filename = filenameWithExtension.split(".")[0]; // <-- added this line
         return filename;                                    // <-- added this line
      }

      const icons = document.querySelectorAll('.star');
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
         var star = '.star',
               selected = '.selected';
         
         $(star).on('click', function(){
            $(selected).each(function(){
               $(this).removeClass('selected');
            });
            $(this).addClass('selected');
         });
         
         });
      </script>

   </div>