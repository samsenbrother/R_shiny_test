library(dplyr)
shinyServer(function(input, output, session) {
  output$seller <- renderTable({
    infile <- input$seller
  if(is.null(infile))
    return(NULL)
    
  a<-read.csv(infile$datapath)
  return (head(a))
  a
    }, options=list(pageLength=10))
  
  output$seller_ui <- renderUI({
    infile <- input$seller
    if(is.null(infile))
      return(NULL)
    
    tmp<-read.csv(infile$datapath)
    tmp %>% select(name) ->name
    name<-as.matrix(name)
    name<-as.vector(name)
    checkboxGroupInput("sellers","Choose seller",name)
  })

  
})