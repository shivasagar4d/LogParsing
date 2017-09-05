my_choices <- names(Book1)[!names(Book1)  %in% c("State", "Country" ,"device", "Plant", "date",   "Id" ,"name", "comments1", "comments2", "car")]

server = shinyServer(function(input,output){

  global <- reactiveValues(refresh = FALSE)
  
  
  
  output$State = renderUI({
    selectInput("State", "Select State:",Book1[,1] ,selectize = TRUE,multiple = T) 
  })
  
  output$Country = renderUI({
    selectInput("Country", "Select Country:",Book1[,2],selectize = TRUE,multiple = T)
  })
  
  output$Device = renderUI({
    selectInput("Device", "Select Device:",Book1[,3],selectize = TRUE,multiple = T)
  })
  
  output$Comments = renderUI({
    selectInput("Comment", "Select Comments:",Book1[,8],selectize = TRUE,multiple = T)
  })
  output$button1=renderUI({
    selectInput("button1","Select Keyword:",c(paste(colnames(Book1[11]),sum(R1()$keyword_1)),
                                              paste(colnames(Book1[12]),sum(R1()$keyword_2)),
                                              paste(colnames(Book1[13]),sum(R1()$keyword_3)),
                                              paste(colnames(Book1[14]),sum(R1()$keyword_4)),
                                              paste(colnames(Book1[15]),sum(R1()$keyword_5)),
                                              paste(colnames(Book1[16]),sum(R1()$keyword_6)),
                                              paste(colnames(Book1[17]),sum(R1()$keyword_7))),selectize = T)
  })
  
  output$button2=renderUI({
    selectizeInput("button1","Select Keyword", choices= my_choices)
  })
  
  output$State2 = renderUI({
    selectInput("State2", "Select State:",Book2[,1] ,selectize = TRUE,multiple = T) 
  })
  
  output$Country2 = renderUI({
    selectInput("Country2", "Select Country:",Book2[,2],selectize = TRUE,multiple = T)
  })
  
  output$Device2 = renderUI({
    selectInput("Device2", "Select Device:",Book2[,3],selectize = TRUE,multiple = T)
  })
  
  output$Comments2 = renderUI({
    selectInput("Comment2", "Select Comments:",Book2[,8],selectize = TRUE,multiple = T)
  })
  output$State3 = renderUI({
    selectInput("State3", "Select State:",Book3[,1] ,selectize = TRUE,multiple = T) 
  })
  
  output$Country3 = renderUI({
    selectInput("Country3", "Select Country:",Book3[,2],selectize = TRUE,multiple = T)
  })
  
  output$Device3 = renderUI({
    selectInput("Device3", "Select Device:",Book3[,3],selectize = TRUE,multiple = T)
  })
  
  output$Comments3 = renderUI({
    selectInput("Comment3", "Select Comments:",Book3[,8],selectize = TRUE,multiple = T)
  })
  
  
  output$Counter1 = renderText(
    {
      output$Clicked = renderText(0)
      isolate(global$refresh <- FALSE)
      filter = Book1$State%in%input$State &
        Book1$Country%in%input$Country &
        Book1$device%in%input$Device &
        Book1$comments1%in%input$Comment 
      DataFilter1 = paste("Total Number of Records",nrow(R1()))
                                                                
    }
  )
  
  output$Counter2 = renderText(
    {
      output$Clicked2 = renderText(0)
      isolate(global$refresh <- FALSE)
      filter2 = Book2$State%in%input$State2 &
        Book2$Country%in%input$Country2 &
        Book2$device%in%input$Device2 &
        Book2$comments1%in%input$Comment2 
      DataFilter2 = paste("Total Number of Records",nrow(R2()))
      
    }
  )
  
  output$Counter3 = renderText(
    {
      output$Clicked3 = renderText(0)
      isolate(global$refresh <- FALSE)
      filter3 = Book3$State%in%input$State3 &
        Book3$Country%in%input$Country3 &
        Book3$device%in%input$Device3 &
        Book3$comments1%in%input$Comment3 
      DataFilter3 = paste("Total Number of Records",nrow(R3()))
      
    }
  )
  
  
  
  R1<- reactive(subset(Book1,(Book1$State%in%input$State &
                               Book1$Country%in%input$Country &
                               Book1$device%in%input$Device &
                               Book1$comments1%in%input$Comment)))
  R2<- reactive(subset(Book2,(Book2$State%in%input$State2 &
                                Book2$Country%in%input$Country2 &
                                Book2$device%in%input$Device2 &
                                Book2$comments1%in%input$Comment2)))
  R3<- reactive(subset(Book3,(Book3$State%in%input$State3 &
                                Book3$Country%in%input$Country3 &
                                Book3$device%in%input$Device3 &
                                Book3$comments1%in%input$Comment3)))
                                                                                
  output$dt1 <- renderText({paste("Number of keyword_1:",sum(R1()$keyword_1))})
  output$dt2 <- renderText({paste("Number of keyword_2:",sum(R1()$keyword_2))})
  output$dt3 <- renderText({paste("Number of keyword_3:",sum(R1()$keyword_3))})
  output$dt4 <- renderText({paste("Number of keyword_4:",sum(R1()$keyword_4))})
  output$dt5 <- renderText({paste("Number of keyword_5:",sum(R1()$keyword_5))})
  output$dt6 <- renderText({paste("Number of keyword_6:",sum(R1()$keyword_6))})
  output$dt7 <- renderText({paste("Number of keyword_7:",sum(R1()$keyword_7))})
  
  output$dt21 <- renderText({paste("Number of keyword_1:",sum(R2()$keyword_1))})
  output$dt22 <- renderText({paste("Number of keyword_2:",sum(R2()$keyword_2))})
  output$dt23 <- renderText({paste("Number of keyword_3:",sum(R2()$keyword_3))})
  output$dt24 <- renderText({paste("Number of keyword_4:",sum(R2()$keyword_4))})
  output$dt25 <- renderText({paste("Number of keyword_5:",sum(R2()$keyword_5))})
  output$dt26 <- renderText({paste("Number of keyword_6:",sum(R2()$keyword_6))})
  output$dt27 <- renderText({paste("Number of keyword_7:",sum(R2()$keyword_7))})
  
  output$dt31 <- renderText({paste("Number of keyword_1:",sum(R3()$keyword_1))})
  output$dt32 <- renderText({paste("Number of keyword_2:",sum(R3()$keyword_2))})
  output$dt33 <- renderText({paste("Number of keyword_3:",sum(R3()$keyword_3))})
  output$dt34 <- renderText({paste("Number of keyword_4:",sum(R3()$keyword_4))})
  output$dt35 <- renderText({paste("Number of keyword_5:",sum(R3()$keyword_5))})
  output$dt36 <- renderText({paste("Number of keyword_6:",sum(R3()$keyword_6))})
  output$dt37 <- renderText({paste("Number of keyword_7:",sum(R3()$keyword_7))})
  
  
  
  output$mytable1 <- renderDataTable({
    Book1[input$button1, ]
  })
  
  R22<-reactive(subset(Book2,(comments1==input$Comment2)))
  output$mytable2 <- renderDataTable({
    isolate({
      input$Comment2
    })
    R22()
  })
  R33<-reactive(subset(Book3,(comments1==input$Comment3)))
  output$mytable3 <- renderDataTable({
    R33()
  })
  myout1 = reactive({
    filter1 = Book1$State%in%input$State &
      Book1$Country%in%input$Country &
      Book1$device%in%input$Device &
      Book1$comments1%in%input$Comment
    DataFilter1 = subset(Book1,filter1)
  })
  
  myout2 = reactive({
    filter2 = Book2$State%in%input$State2 &
      Book2$Country%in%input$Country2 &
      Book2$device%in%input$Device2 &
      Book2$comments1%in%input$Comment2
    DataFilter2 = subset(Book2,filter2)
  })
  myout3 = reactive({
    filter3 = Book3$State%in%input$State3 &
      Book3$Country%in%input$Country3 &
      Book3$device%in%input$Device3 &
      Book3$comments1%in%input$Comment3
    DataFilter3 = subset(Book3,filter3)
  })
  
  output$downloadData1 <- downloadHandler(
    filename=function() {
      paste('data-', Sys.Date(), '.csv', sep='')
    },
    content = function(file) {
      write.csv(R1(),file)
    },
    contentType = "text/plain"
  )
  output$downloadData2 <- downloadHandler(
    filename=function() {
      paste('data-', Sys.Date(), '.csv', sep='')
    },
    content = function(file) {
      write.csv(R2(),file)
    },
    contentType = "text/plain"
  )
  output$downloadData3 <- downloadHandler(
    filename=function() {
      paste('data-', Sys.Date(), '.csv', sep='')
    },
    content = function(file) {
      write.csv(R3(),file)
    },
    contentType = "text/plain"
  )
  
  
  
})

