library(shiny)
library(shinydashboard)
library(DT)


ui <- shinyUI(fluidPage(
  titlePanel("Demo"),
  sidebarLayout(
    sidebarPanel(width=12,height=4,
  
      conditionalPanel(
        'input.dataset === "Book1"',
        fluidRow (column(width=3,uiOutput("State")),
        (column(width=3,uiOutput("Country"))),
        (column(width=3,uiOutput("Device"))),
        (column(width=3,uiOutput("Comments")))
        )
      ),
      conditionalPanel(
        'input.dataset === "Book2"',
        fluidRow(column(width=3,uiOutput("State2")),
        (column(width=3,uiOutput("Country2"))),
        (column(width=3,uiOutput("Device2"))),
        (column(width=3,uiOutput("Comments2")))
        
      )),
      conditionalPanel(
        'input.dataset === "Book3"',
        fluidRow(column(width=3,uiOutput("State3")),
        (column(width=3,uiOutput("Country3"))),
        (column(width=3,uiOutput("Device3"))),
        (column(width=3,uiOutput("Comments3")))
      ))),    
  mainPanel(width=12,
    tabsetPanel(
      id = 'dataset',
      tabPanel("Book1", 
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("Counter1"))),
               div(style="display: inline-block;vertical-align:top; width: 8px;",HTML("<br>")),
               downloadButton("downloadData1", "Click Me"),
               br(),
               br(),
               br(),
               fluidRow(div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt1"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt2"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt3"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt4"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt5"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt6"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt7"))))
               
               ),
      tabPanel("Book2", 
               fluidRow(div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("Counter2"))),
               div(style="display: inline-block;vertical-align:top; width: 8px;",HTML("<br>")),
               downloadButton("downloadData2", "Click Me"),
               br(),
               br(),
               br(),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt21"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt22"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt23"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt24"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt25"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt26"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt27"))))
               ),
      tabPanel("Book3", 
               fluidRow(div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("Counter3"))),
               div(style="display: inline-block;vertical-align:top; width: 8px;",HTML("<br>")),
               downloadButton("downloadData3", "Click Me"),
               br(),
               br(),
               br(),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt31"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt32"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt33"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt34"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt35"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt36"))),
               div(style="display: inline-block;vertical-align:top; width: 300px;",actionLink("Click",verbatimTextOutput("dt37"))))
               
      )
    )
    
   
    
  )
  
  
  
  
  
  
  )  
  
  
))


