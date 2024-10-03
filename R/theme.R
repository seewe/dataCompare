### ----------------------------------------------------------------------------
### Define theme of all components of the app
### ----------------------------------------------------------------------------

theme_function <- function(primary = "#6D6855",
                           accent = "#B2AF98",
                           secondary = "#BD8301",
                           dark_theme = TRUE) {
  
  dashboardthemes::shinyDashboardThemeDIY(
    # general
      appFontFamily = "Helvetica"
      ,appFontColor = ifelse(dark_theme, "#649191", "#05050a")
      ,primaryFontColor = ifelse(dark_theme, "#f2f2f7", "#05050a")
      ,infoFontColor = "#696969"
      ,successFontColor = "#696969"
      ,warningFontColor = "#696969"
      ,dangerFontColor = "#696969"
      ,bodyBackColor = ifelse(dark_theme, "#272729", "#F8F8F8")
    
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
      ,sidebarTabTextColor = "#696969"
      ,sidebarTabTextSize = 14
      ,sidebarTabBorderStyle = "none none none solid"
      ,sidebarTabBorderColor = "transparent"
      ,sidebarTabBorderWidth = 5
      ,sidebarTabBackColorSelected = ifelse(dark_theme, "#272729", "#F8F8F8")
      ,sidebarTabTextColorSelected = "#369c9c"
      ,sidebarTabRadiusSelected = "10px 0px 0px 10px"
      ,sidebarTabBackColorHover = primary
      ,sidebarTabTextColorHover = "#000"
      ,sidebarTabBorderStyleHover = "solid none solid none"
      ,sidebarTabBorderColorHover = "#272729"
      ,sidebarTabBorderWidthHover = 2
      ,sidebarTabRadiusHover = "10px 0px 0px 10px"
      
    #header
      ,logoBackColor = "#374a4a" #ifelse(dark_theme, "#2a3636", "#F8F8F8")
      ,headerButtonBackColor = ifelse(dark_theme, "#2a3636", "#F8F8F8")
      ,headerButtonIconColor = "white"
      ,headerButtonBackColorHover = primary
      ,headerButtonIconColorHover = "white"
      ,headerBackColor = ifelse(dark_theme, "#2a3636", "#F8F8F8")
      ,headerBoxShadowColor = primary
      ,headerBoxShadowSize = "0px 3px 5px"
    
    ### boxes
      ,boxBackColor = ifelse(dark_theme, "#0a0a0a", "white")
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
    
    ### footer
      # ,footBackColor = ifelse(dark_theme, "#2a3636", "#F8F8F8")
    
    
    )
}
