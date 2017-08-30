library(shiny)
library(shinydashboard)
library(DT)
ui <- shinyUI(fluidPage(
      titlePanel("Demo"),
      
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("State", "Select State",Dataset1$State,selected = "Select State",selectize = TRUE,multiple = TRUE)),
      div(style="display: inline-block;vertical-align:top; width: 50px;",HTML("<br>")),
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("Country", "Select Country",Dataset1$Country,selected = "Select Country",selectize = TRUE,multiple = TRUE)),
      div(style="display: inline-block;vertical-align:top; width: 50px;",HTML("<br>")),
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("Device", "Select Device",Dataset1$device,selected = "Select Device",selectize = TRUE,multiple = TRUE)),
      div(style="display: inline-block;vertical-align:top; width: 50px;",HTML("<br>")),
      div(style="display: inline-block;vertical-align:top; width: 200px;",selectInput("Comment","Select Comments",Dataset1$comments1,selected = NULL,selectize = TRUE,multiple = TRUE)),
      
      
      br(),
      br(),
      
      br(),
      br(), 
      div(style="display: inline-block;vertical-align:top; width: 300px;",verbatimTextOutput("Counter", placeholder = FALSE)),
      div(style="display: inline-block;vertical-align:top; width: 8px;",HTML("<br>")),
      actionButton("Click", "Click Me"),
      br(),
      br(),
      br(),
      
      uiOutput("dt")
    ))