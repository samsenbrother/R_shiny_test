library(dplyr)
library(ggplot2)
source('normalize.R')
shinyServer(function(input, output, session) {
  data<-reactive({
    input$seller
  })
  
  output$data <- renderTable({
    infile <- data()
  if(is.null(infile))
    return(NULL)
    
  a<-read.csv(infile$datapath)
  a
    }, options=list(pageLength=10))
  
  output$seller_ui <- renderUI({
    infile <- data()
    if(is.null(infile))
      return(NULL)
    
    tmp<-read.csv(infile$datapath)
    tmp %>% select(name) ->name
    name<-as.matrix(name)
    name<-as.vector(name)
    selectInput("sellers","Choose seller",name)
  })
  
  output$weidu <- renderUI({
    infile <- data()
    if(is.null(infile))
      return(NULL)
    tmp<-read.csv(infile$datapath)
    name<-names(tmp)
    name<-name[-c(1,2)]
    selectInput("Dim","Dim select",name)
  })
  #根据选择的卖家和维度作图
  output$plot <- renderPlot({
    infile <- data()
    if(is.null(infile))
      return(NULL)
    tmp<-read.csv(infile$datapath)
    seller <- input$sellers
    dim <- input$Dim
    #提取需要的数据到数据框先
    number<-names(tmp) %in% dim
    plotdata<-tmp[,number]
    plotdata<-scale(plotdata)
    as.data.frame(plotdata)->plotdata
    q<-ggplot(plotdata,aes(x = eval(dim)))
    q+geom_density()+theme_light()
  })
  

  
})