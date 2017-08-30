library(shiny)
library(shinydashboard)
library(DT)
ui <- shinyUI(
      fluidPage(
      titlePanel("Complaints BI Screen"),
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("LineofBusiness", "Select LineofBusiness",Dataset1$LineofBusiness,selected = "Select LineofBusiness",selectize = TRUE,multiple = TRUE)),
      div(style="display: inline-block;vertical-align:top; width: 50px;",HTML("<br>")),
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("EntitlementLevel", "Select EntitlementLevel",Dataset1$EntitlementLevel,selected = "Select EntitlementLevel",selectize = TRUE,multiple = TRUE)),
      div(style="display: inline-block;vertical-align:top; width: 50px;",HTML("<br>")),
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("ComplaintCaptureSource", "Select ComplaintSource",Dataset1$ComplaintCaptureSource,selected = "Select ComplaintSource",selectize = TRUE,multiple = TRUE)),
      div(style="display: inline-block;vertical-align:top; width: 50px;",HTML("<br>")),
      div(style="display: inline-block;vertical-align:top; width: 1100px;",selectInput("ClosedNotes","Select ClosedNotes",Dataset1$ClosedNotes1,selected = NULL,selectize = TRUE,multiple = TRUE)),
      br(),
      br(), 
      div(style="display: inline-block;vertical-align:top; width: 300px;",verbatimTextOutput("Counter", placeholder = FALSE)),
      div(style="display: inline-block;vertical-align:top; width: 8px;",HTML("<br>")),
      actionButton("Click", "Click Me"),

      sidebarPanel(radioButtons("filetype", "File type:",choices = c("csv", "tsv")),downloadButton('downloadData', 'Download')),
######  downloadData       
      br(),
      br(),
      br(),
      
     
      uiOutput("dt")
    )
    
   )