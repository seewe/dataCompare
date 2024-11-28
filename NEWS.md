# dataCompare 1.0.5

* Fixed bug which violates the CRAN Policy's  
    - “Packages should not write in the user’s home filespace (including  
  clipboards), nor anywhere else on the file system apart from the R  
  session’s temporary directory (or during installation in the location  
  pointed to by TMPDIR: and such usage should be cleaned up).”  

# dataCompare 1.0.4

* add spinner on all interactive output of the shiny app  
* add an inline code to perform the comparison and build the html report  
* change how to describe variables loaded in the upload input fields  
* increase the maximum file size from the default (5 Mb) to 50 Mb  

# dataCompare 1.0.3

* fix the module which print the comparator report in the shiny app.  

# dataCompare 1.0.2

* fix an absolute link in the mod_comp_report.R file.  

# dataCompare 1.0.1

* remove all `mod_...` functions used in the previous version.  
* add a new section (tab) where users can create their html comparisons report.  