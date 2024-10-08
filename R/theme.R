###-----------------------------------------------------------------------------
###  The raw theming function
###-----------------------------------------------------------------------------

shinyDashboardThemeDIY <- function (appFontFamily, appFontColor, logoBackColor, bodyBackColor, 
          headerButtonBackColor, headerButtonIconColor, headerButtonBackColorHover, 
          headerButtonIconColorHover, headerBackColor, headerBoxShadowColor, 
          headerBoxShadowSize, sidebarBackColor, sidebarPadding, sidebarShadowRadius, 
          sidebarShadowColor, sidebarMenuBackColor, sidebarMenuPadding, 
          sidebarMenuBorderRadius, sidebarUserTextColor, sidebarSearchBackColor, 
          sidebarSearchIconColor, sidebarSearchBorderColor, sidebarTabTextColor, 
          sidebarTabTextSize, sidebarTabBorderStyle, sidebarTabBorderColor, 
          sidebarTabBorderWidth, sidebarTabBackColorSelected, sidebarTabTextColorSelected, 
          sidebarTabRadiusSelected, sidebarTabTextColorHover, sidebarTabBackColorHover, 
          sidebarTabBorderStyleHover, sidebarTabBorderColorHover, 
          sidebarTabBorderWidthHover, sidebarTabRadiusHover, boxBackColor, 
          boxBorderRadius, boxShadowSize, boxShadowColor, boxTitleSize, 
          boxDefaultColor, boxPrimaryColor, boxSuccessColor, boxWarningColor, 
          boxDangerColor, tabBoxTabColor, tabBoxTabTextSize, tabBoxTabTextColor, 
          tabBoxTabTextColorSelected, tabBoxBackColor, tabBoxHighlightColor, 
          tabBoxBorderRadius, buttonBackColor, buttonTextColor, buttonBorderColor, 
          buttonBorderRadius, buttonBackColorHover, buttonTextColorHover, 
          buttonBorderColorHover, buttonHeight = "auto", buttonPadding = "6px 12px", 
          textboxBackColor, textboxBorderColor, textboxBorderRadius, 
          textboxBackColorSelect, textboxBorderColorSelect, textboxHeight = "auto", 
          textboxPadding = "6px 12px", tableBackColor, tableBorderColor, 
          tableBorderTopSize, tableBorderRowSize, primaryFontColor = "auto", 
          successFontColor = "auto", warningFontColor = "auto", dangerFontColor = "auto", 
          infoFontColor = "auto", boxInfoColor = "auto") 
{
  cssCode <- paste0("\n    /* font */\n    body, label, input, button, select, box,\n    .h1, .h2, .h3, .h4, .h5, h1, h2, h3, h4, h5 {\n      font-family: \"", 
                    appFontFamily, "\";\n      color: ", appFontColor, ";\n    }\n\n    /* font: fix for h6 */\n    /* messes up sidebar user section if included above */\n    .h6, h6 {\n      font-family: \"", 
                    appFontFamily, "\";\n    }\n\n    /* sidebar: logo */\n    .skin-blue .main-header .logo {\n      background: ", 
                    logoBackColor, ";\n    }\n\n    /* sidebar: logo hover */\n    .skin-blue .main-header .logo:hover {\n      background: ", 
                    logoBackColor, ";\n    }\n\n    /* sidebar: collapse button  */\n    .skin-blue .main-header .navbar .sidebar-toggle {\n      background: ", 
                    headerButtonBackColor, ";\n      color:", headerButtonIconColor, 
                    ";\n    }\n\n    /* sidebar: collapse button hover */\n    .skin-blue .main-header .navbar .sidebar-toggle:hover {\n      background: ", 
                    headerButtonBackColorHover, ";\n      color:", headerButtonIconColorHover, 
                    ";\n    }\n\n    /* header */\n    .skin-blue .main-header .navbar {\n      background: ", 
                    headerBackColor, ";\n      box-shadow: ", headerBoxShadowSize, 
                    " ", headerBoxShadowColor, ";\n    }\n\n    /* sidebar*/\n    .skin-blue .main-sidebar {\n      background: ", 
                    sidebarBackColor, ";\n      box-shadow: ", sidebarShadowRadius, 
                    " ", sidebarShadowColor, ";\n      padding-left: ", 
                    sidebarPadding, "px;\n      padding-right: ", sidebarPadding, 
                    "px;\n      /* padding-top: 60px; */\n    }\n\n    /* sidebar menu */\n    .main-sidebar .user-panel, .sidebar-menu, .sidebar-menu>li.header {\n      white-space: nowrap;\n      background: ", 
                    sidebarMenuBackColor, ";\n      padding: ", sidebarMenuPadding, 
                    "px;\n      border-radius: ", sidebarMenuBorderRadius, 
                    "px;\n    }\n\n    /* fix for user panel */\n    .user-panel>.info>p, .skin-blue .user-panel>.info {\n      color: ", 
                    sidebarUserTextColor, ";\n      font-size: 12px;\n      font-weight: normal;\n    }\n    section.sidebar .user-panel {\n      padding: 10px;\n    }\n\n    /* sidebar: tabs */\n    .skin-blue .main-sidebar .sidebar .sidebar-menu a {\n      color: ", 
                    sidebarTabTextColor, ";\n      font-size: ", sidebarTabTextSize, 
                    "px;\n      border-style: ", sidebarTabBorderStyle, 
                    ";\n      border-color: ", sidebarTabBorderColor, ";\n      border-width: ", 
                    sidebarTabBorderWidth, "px;\n    }\n\n    /* sidebar: tab selected */\n    .skin-blue .main-sidebar .sidebar .sidebar-menu .active > a {\n      color: ", 
                    sidebarTabTextColorSelected, ";\n      font-size: ", 
                    sidebarTabTextSize, "px;\n      border-radius: ", sidebarTabRadiusSelected, 
                    ";\n      border-style: ", sidebarTabBorderStyleHover, 
                    ";\n      border-color: ", sidebarTabBorderColorHover, 
                    ";\n      border-width: ", sidebarTabBorderWidthHover, 
                    "px;\n    }\n    .skin-blue .sidebar-menu > li:hover > a,\n    .skin-blue .sidebar-menu > li.active > a {\n      color: ", 
                    sidebarTabTextColorSelected, ";\n      background: ", 
                    sidebarTabBackColorSelected, ";\n      border-radius: ", 
                    sidebarTabRadiusHover, ";\n    }\n\n    /* sidebar: tab hovered */\n    .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover {\n      background: ", 
                    sidebarTabBackColorHover, ";\n      color: ", sidebarTabTextColorHover, 
                    ";\n      font-size: ", sidebarTabTextSize, "px;\n      border-style: ", 
                    sidebarTabBorderStyleHover, ";\n      border-color: ", 
                    sidebarTabBorderColorHover, ";\n      border-width: ", 
                    sidebarTabBorderWidthHover, "px;\n      border-radius: ", 
                    sidebarTabRadiusHover, ";\n    }\n\n    /* sidebar: subtab */\n    .skin-blue .sidebar-menu > li > .treeview-menu {\n      margin: 0px;\n      background: ", 
                    sidebarMenuBackColor, ";\n    }\n    .skin-blue .treeview-menu > li > a {\n      background: ", 
                    sidebarMenuBackColor, ";\n    }\n    /* sidebar: subtab selected */\n    .skin-blue .treeview-menu > li.active > a,\n    .skin-blue .treeview-menu > li > a:hover {\n      background: ", 
                    sidebarTabBackColorSelected, ";\n    }\n\n    /* sidebar: search text area */\n    .skin-blue .sidebar-form input[type=text] {\n      background: ", 
                    sidebarSearchBackColor, ";\n      color: ", appFontColor, 
                    ";\n      border-radius: ", textboxBorderRadius, "px 0px 0px ", 
                    textboxBorderRadius, "px;\n      border-color: ", sidebarSearchBorderColor, 
                    ";\n      border-style: solid none solid solid;\n    }\n\n    /* sidebar: search button */\n    .skin-blue .input-group-btn > .btn {\n      background: ", 
                    sidebarSearchBackColor, ";\n      color: ", sidebarSearchIconColor, 
                    ";\n      border-radius: 0px ", textboxBorderRadius, 
                    "px ", textboxBorderRadius, "px 0px;\n      border-style: solid solid solid none;\n      border-color: ", 
                    sidebarSearchBorderColor, ";\n    }\n\n    /* sidebar form */\n    .skin-blue .sidebar-form {\n      border-radius: 0px;\n      border: 0px none rgb(255,255,255);\n      margin: 10px;\n    }\n\n    /* body */\n    .content-wrapper, .right-side {\n      background: ", 
                    bodyBackColor, ";\n    }\n\n    /* box */\n    .box {\n      background: ", 
                    boxBackColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n      box-shadow: ", boxShadowSize, " ", boxShadowColor, 
                    ";\n    }\n\n    /* box: title */\n    .box-header .box-title {\n      font-size: ", 
                    boxTitleSize, "px;\n    }\n\n    /* tabbox: title */\n    .nav-tabs-custom>.nav-tabs>li.header {\n      color: ", 
                    appFontColor, ";\n      font-size: ", boxTitleSize, 
                    "px;\n    }\n\n    /* tabbox: tab color */\n    .nav-tabs-custom, .nav-tabs-custom .nav-tabs li.active:hover a,\n    .nav-tabs-custom .nav-tabs li.active a {\n      background: ", 
                    tabBoxTabColor, ";\n      color: ", appFontColor, ";\n      border-radius: ", 
                    boxBorderRadius, "px;\n    }\n\n    .nav-tabs-custom {\n      box-shadow: ", 
                    boxShadowSize, " ", boxShadowColor, ";\n    }\n\n    /* tabbox: active tab bg */\n    .nav-tabs-custom>.nav-tabs>li.active {\n      border-radius: ", 
                    tabBoxBorderRadius, "px;\n      border-top-color: ", 
                    tabBoxHighlightColor, ";\n      # box-shadow: ", boxShadowSize, 
                    " ", boxShadowColor, ";\n    }\n\n    /* tabbox: font color */\n    .nav-tabs-custom>.nav-tabs>li.active:hover>a, .nav-tabs-custom>.nav-tabs>li.active>a {\n      border-bottom-color: ", 
                    tabBoxTabColor, ";\n      border-top-color: ", tabBoxHighlightColor, 
                    ";\n      border-right-color: ", tabBoxHighlightColor, 
                    ";\n      border-left-color: ", tabBoxHighlightColor, 
                    ";\n      color: ", tabBoxTabTextColorSelected, ";\n      font-size: ", 
                    tabBoxTabTextSize, "px;\n      border-radius: ", tabBoxBorderRadius, 
                    "px;\n    }\n\n    /* tabbox: inactive tabs background */\n    .nav-tabs-custom>.nav-tabs>li>a {\n      color: ", 
                    tabBoxTabTextColor, ";\n      font-size: ", tabBoxTabTextSize, 
                    "px;\n    }\n\n    /* tabbox: top area back color */\n    .nav-tabs-custom, .nav-tabs-custom>.tab-content, .nav-tabs-custom>.nav-tabs {\n      border-bottom-color: ", 
                    tabBoxHighlightColor, ";\n      background: ", tabBoxBackColor, 
                    ";\n    }\n\n    /* tabbox: top area rounded corners */\n    .nav-tabs-custom>.nav-tabs {\n      margin: 0;\n      border-radius: ", 
                    tabBoxBorderRadius, "px;\n    }\n\n    /* infobox */\n    .info-box {\n      background: ", 
                    boxBackColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n      box-shadow: ", boxShadowSize, " ", boxShadowColor, 
                    ";\n    }\n\n    /* valuebox */\n    .small-box {\n      border-radius: ", 
                    boxBorderRadius, "px;\n      box-shadow: ", boxShadowSize, 
                    " ", boxShadowColor, ";\n    }\n\n    /* valuebox: main font color */\n    .small-box h3, .small-box p {\n      color: rgb(255,255,255)\n    }\n\n    /* box: default color */\n    .box.box-solid>.box-header, .box>.box-header {\n      color: ", 
                    appFontColor, ";\n    }\n    .box.box-solid>.box-header {\n      border-radius: ", 
                    boxBorderRadius, "px;\n    }\n    .box.box-solid, .box {\n      border-radius: ", 
                    boxBorderRadius, "px;\n      border-top-color: ", boxDefaultColor, 
                    ";\n    }\n\n    /* box: info color */\n    .box.box-solid.box-info>.box-header h3, .box.box-info>.box-header h3 {\n      color: ", 
                    infoFontColor, ";\n    }\n    .box.box-solid.box-info>.box-header {\n      background: ", 
                    boxInfoColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n    .box.box-solid.box-info, .box.box-info {\n      border-color: ", 
                    boxInfoColor, ";\n      border-left-color: ", boxInfoColor, 
                    ";\n      border-right-color: ", boxInfoColor, ";\n      border-top-color: ", 
                    boxInfoColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n\n    /* box: primary color */\n    .box.box-solid.box-primary>.box-header h3, .box.box-primary>.box-header h3 {\n      color: ", 
                    primaryFontColor, ";\n    }\n    .box.box-solid.box-primary>.box-header {\n      background: ", 
                    boxPrimaryColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n    .box.box-solid.box-primary, .box.box-primary {\n      border-color: ", 
                    boxPrimaryColor, ";\n      border-left-color: ", boxPrimaryColor, 
                    ";\n      border-right-color: ", boxPrimaryColor, ";\n      border-top-color: ", 
                    boxPrimaryColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n\n    /* box: success color */\n    .box.box-solid.box-success>.box-header h3, .box.box-success>.box-header h3 {\n      color: ", 
                    successFontColor, ";\n    }\n    .box.box-solid.box-success>.box-header {\n      background: ", 
                    boxSuccessColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n    .box.box-solid.box-success, .box.box-success {\n      border-color: ", 
                    boxSuccessColor, ";\n      border-left-color: ", boxSuccessColor, 
                    ";\n      border-right-color: ", boxSuccessColor, ";\n      border-top-color: ", 
                    boxSuccessColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n\n    /* box: warning color */\n    .box.box-solid.box-warning>.box-header h3, .box.box-warning>.box-header h3 {\n      color: ", 
                    warningFontColor, ";\n    }\n    .box.box-solid.box-warning>.box-header {\n      background: ", 
                    boxWarningColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n    .box.box-solid.box-warning, .box.box-warning {\n      border-color: ", 
                    boxWarningColor, ";\n      border-left-color: ", boxWarningColor, 
                    ";\n      border-right-color: ", boxWarningColor, ";\n      border-top-color: ", 
                    boxWarningColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n\n    /* box: danger color */\n    .box.box-solid.box-danger>.box-header h3, .box.box-danger>.box-header h3 {\n      color: ", 
                    dangerFontColor, ";\n    }\n    .box.box-solid.box-danger>.box-header {\n      background: ", 
                    boxDangerColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n    .box.box-solid.box-danger, .box.box-danger {\n      border-color: ", 
                    boxDangerColor, ";\n      border-left-color: ", boxDangerColor, 
                    ";\n      border-right-color: ", boxDangerColor, ";\n      border-top-color: ", 
                    boxDangerColor, ";\n      border-radius: ", boxBorderRadius, 
                    "px;\n    }\n\n    /* button */\n    .btn-default {\n      background: ", 
                    buttonBackColor, ";\n      color: ", buttonTextColor, 
                    ";\n      border-color: ", buttonBorderColor, ";\n      border-radius: ", 
                    buttonBorderRadius, "px;\n      height: ", buttonHeight, 
                    "px;\n      padding: ", buttonPadding, ";\n    }\n\n    /* button: hover */\n    .btn-default:hover {\n      background: ", 
                    buttonBackColorHover, ";\n      color: ", buttonTextColorHover, 
                    ";\n      border-color: ", buttonBorderColorHover, ";\n    }\n\n    /* button: focus */\n    .btn-default:focus, .action-button:focus {\n      background: ", 
                    buttonBackColor, ";\n      color: ", buttonTextColor, 
                    ";\n      border-color: ", buttonBorderColor, ";\n    }\n\n    /* button: active */\n    .btn-default:active, .action-button:active {\n      background: ", 
                    buttonBackColor, ";\n      color: ", buttonTextColor, 
                    ";\n      border-color: ", buttonBorderColor, ";\n    }\n\n    /* button: visited */\n    .btn-default:visited {\n      background: ", 
                    buttonBackColor, ";\n      color: ", buttonTextColor, 
                    ";\n      border-color: ", buttonBorderColor, ";\n    }\n\n    /* textbox */\n    .form-control, .selectize-input, .selectize-control.single .selectize-input {\n      background: ", 
                    textboxBackColor, ";\n      color: ", appFontColor, 
                    ";\n      border-color: ", textboxBorderColor, ";\n      border-radius: ", 
                    textboxBorderRadius, "px;\n      height: ", textboxHeight, 
                    "px;\n      min-height: ", textboxHeight, "px;\n      padding: ", 
                    textboxPadding, ";\n    }\n\n    /* textbox: selected */\n    .form-control:focus, .selectize-input.focus {\n      color: ", 
                    appFontColor, ";\n      background: ", textboxBackColorSelect, 
                    ";\n      border-color: ", textboxBorderColorSelect, 
                    ";\n      -webkit-box-shadow: inset 0px 0px 0px, 0px 0px 0px;\n      box-shadow: inset 0px 0px 0px, 0px 0px 0px;\n    }\n\n    /* multi-row selectize input */\n    .selectize-control.multi .selectize-input.has-items {\n      height: auto;\n    }\n\n    /* verbatim text output */\n    .qt pre, .qt code {\n      font-family: ", 
                    appFontFamily, " !important;\n    }\n    pre {\n      color: ", 
                    appFontColor, ";\n      background-color: ", textboxBackColor, 
                    ";\n      border: 1px solid ", textboxBorderColor, ";\n      border-radius: ", 
                    textboxBorderRadius, "px;\n    }\n\n    /* drop-down menu */\n    .selectize-dropdown, .selectize-dropdown.form-control {\n      background: ", 
                    textboxBackColor, ";\n      border-radius: 4px;\n    }\n\n    /* table */\n    .table {\n      background: ", 
                    tableBackColor, ";\n      border-radius: ", textboxBorderRadius, 
                    "px;\n    }\n\n    /* table: row border color*/\n    .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td,\n    .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {\n      border-top: ", 
                    tableBorderRowSize, "px solid ", tableBorderColor, ";\n    }\n\n    /* table: top border color*/\n    .table>thead>tr>th {\n      border-bottom: ", 
                    tableBorderTopSize, "px solid ", tableBorderColor, ";\n    }\n\n    /* table: hover row */\n    .table-hover>tbody>tr:hover {\n    background-color: ", 
                    tableBorderColor, ";\n    }\n\n    /* table: stripe row */\n    .table-striped>tbody>tr:nth-of-type(odd) {\n      background-color: ", 
                    tableBorderColor, ";\n    }\n\n    /* table: body colour */\n    table.dataTable tbody tr {\n      background-color: ", 
                    tableBackColor, " !important;\n    }\n\n    /* table: text and footer border colour */\n    table.dataTable {\n      color: ", 
                    appFontColor, " !important;\n      border: 0px !important;\n    }\n\n    /* datatable: selected row */\n    table.dataTable tr.selected td, table.dataTable td.selected {\n      background-color: ", 
                    boxSuccessColor, " !important;\n      color: rgb(0,0,0) !important;\n    }\n\n    /* datatable: hover row */\n    table.dataTable tr.hover td, table.dataTable td.hover {\n      background-color: ", 
                    tableBorderColor, " !important;\n    }\n    table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {\n      background-color: ", 
                    tableBorderColor, " !important;\n    }\n    table.dataTable.row-border tbody th, table.dataTable.row-border tbody td,\n    table.dataTable.display tbody th, table.dataTable.display tbody td {\n      border-top: 1px solid ", 
                    tableBorderColor, " !important;\n    }\n\n    /* datatable: stripe row */\n    table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd {\n      background-color: ", 
                    tableBorderColor, " !important;\n    }\n\n    /* datatable: page control */\n    .dataTables_wrapper .dataTables_paginate .paginate_button {\n      color: ", 
                    appFontColor, " !important;\n    }\n\n    /* datatable: table info */\n    .dataTables_wrapper .dataTables_paginate .paginate_button.disabled,\n    .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover,\n    .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {\n      color: ", 
                    appFontColor, " !important;\n    }\n    .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,\n    .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,\n    .dataTables_wrapper .dataTables_paginate {\n      color: ", 
                    appFontColor, " !important;\n    }\n    .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter,\n    .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing,\n    .dataTables_wrapper .dataTables_paginate {\n      color: ", 
                    appFontColor, " !important;\n    }\n\n    /* datatable search box */\n    .dataTables_wrapper .dataTables_filter input {\n      background-color: ", 
                    textboxBackColor, ";\n      border: 1px solid ", textboxBorderColor, 
                    ";\n      border-radius: ", textboxBorderRadius, "px;\n    }\n\n    /* notification and progress bar */\n    .progress-bar {\n      background-color: ", 
                    boxSuccessColor, ";\n    }\n    .shiny-notification {\n      height: 80px;\n      font-family: ", 
                    appFontFamily, ";\n      font-size: 15px;\n      border-radius: 10px;\n      margin-left: -450px !important;\n    }\n\n    /* horizontal divider line */\n    hr {\n      border-top: 1px solid rgb(215,215,215);\n    }\n\n    /* modal */\n    .modal-body {\n      background-color: ", 
                    boxBackColor, ";\n    }\n\n    .modal-footer {\n      background-color: ", 
                    boxBackColor, ";\n    }\n\n    .modal-header {\n      background-color: ", 
                    boxBackColor, ";\n    }\n\n    ")
  cssCode <- gsub(pattern = "\n", replacement = "", x = cssCode)
  cssCode <- gsub(pattern = "[[:space:]]{2,3}", replacement = "", 
                  x = cssCode)
  htmlCode <- htmltools::tags$head(htmltools::tags$style(htmltools::HTML(text = cssCode)))
  return(htmlCode)
}



### ----------------------------------------------------------------------------
### Define theme of all components of the app
### ----------------------------------------------------------------------------

theme_function <- function(primary = "#6D6855", dark_theme = TRUE) {
  
  shinyDashboardThemeDIY(
    # general
    appFontFamily = "Helvetica"
    ,appFontColor = ifelse(dark_theme, "#272729", "#05050a")
    ,primaryFontColor = ifelse(dark_theme, "#f2f2f7", "#05050a")
    ,infoFontColor = "#696969"
    ,successFontColor = "#696969"
    ,warningFontColor = "#696969"
    ,dangerFontColor = "#696969"
    ,bodyBackColor = ifelse(dark_theme, "#05050a", "#F8F8F8")
    
    #sidebar
    ,sidebarBackColor = ifelse(dark_theme, "#2a3636", "#F8F8F8")
    ,sidebarPadding = 0
    ,sidebarMenuBackColor = "transparent"
    ,sidebarMenuPadding = 0
    ,sidebarMenuBorderRadius = 5
    ,sidebarShadowRadius = "0px 0px 0px"
    ,sidebarShadowColor = "#aaaaaa"
    ,sidebarUserTextColor = "#696969"
    ,sidebarSearchBackColor = "rgb(55,72,80)"
    ,sidebarSearchIconColor = "rgb(153,153,153)"
    ,sidebarSearchBorderColor = "rgb(55,72,80)"
    ,sidebarTabTextColor = "#649191"
    ,sidebarTabTextSize = 14
    ,sidebarTabBorderStyle = "none none none solid"
    ,sidebarTabBorderColor = "transparent"
    ,sidebarTabBorderWidth = 5
    ,sidebarTabBackColorSelected = ifelse(dark_theme, "#05050a", "#F8F8F8")
    ,sidebarTabTextColorSelected = "#369c9c"
    ,sidebarTabRadiusSelected = "10px 0px 0px 10px"
    ,sidebarTabBackColorHover = primary
    ,sidebarTabTextColorHover = "#F8F8F8"
    ,sidebarTabBorderStyleHover = "solid none solid none"
    ,sidebarTabBorderColorHover = "#272729"
    ,sidebarTabBorderWidthHover = 2
    ,sidebarTabRadiusHover = "10px 0px 0px 10px"
    
    #header
    ,logoBackColor = "#374a4a"
    ,headerButtonBackColor = ifelse(dark_theme, "#2a3636", "#F8F8F8")
    ,headerButtonIconColor = "white"
    ,headerButtonBackColorHover = primary
    ,headerButtonIconColorHover = "white"
    ,headerBackColor = ifelse(dark_theme, "#2a3636", "#F8F8F8")
    ,headerBoxShadowColor = primary
    ,headerBoxShadowSize = "0px 3px 5px"
    
    ### boxes
    ,boxBackColor = ifelse(dark_theme, "#F8F8F8", "white")
    ,boxBorderRadius = 5
    ,boxShadowSize = "6px 6px 10px"
    ,boxShadowColor = paste0(primary,"30")
    ,boxTitleSize = 20
    ,boxDefaultColor = ifelse(dark_theme, "white", "#0a0a0a")
    ,boxPrimaryColor = ifelse(dark_theme, "white", "#0a0a0a")
    ,boxInfoColor = ifelse(dark_theme, "rgb(99, 109, 125)", "rgb(210,214,220)")
    ,boxSuccessColor = ifelse(dark_theme, "rgb(64, 102, 96,1)", "rgba(0,255,213,1)")
    ,boxWarningColor = "rgb(244,156,104)"
    ,boxDangerColor = "rgb(255,88,55)"
    ,tabBoxTabColor = "white"
    ,tabBoxTabTextSize = 12
    ,tabBoxTabTextColor = "#696969"
    ,tabBoxTabTextColorSelected = primary
    ,tabBoxBackColor = "white"
    ,tabBoxHighlightColor = primary
    ,tabBoxBorderRadius = 0
    
    ### inputs
    ,buttonBackColor = "rgb(245,245,245)"
    ,buttonTextColor = "rgb(0,0,0)"
    ,buttonBorderColor = "rgb(200,200,200)"
    ,buttonBorderRadius = 5
    ,buttonBackColorHover = "rgb(235,235,235)"
    ,buttonTextColorHover = "rgb(100,100,100)"
    ,buttonBorderColorHover = "rgb(200,200,200)"
    ,textboxBackColor = "rgb(255,255,255)"
    ,textboxBorderColor = "rgb(200,200,200)"
    ,textboxBorderRadius = 5
    ,textboxBackColorSelect = "rgb(245,245,245)"
    ,textboxBorderColorSelect = "rgb(200,200,200)"
    
    ### tables
    ,tableBackColor = NA
    ,tableBorderColor = NA
    ,tableBorderTopSize = 1
    ,tableBorderRowSize = 1
    
  )
  
}

