library(shiny)
shinyServer(function(input, output) {
  output$namecheck<-renderText({
    if(input$submit !=0){
    if(input$name1 == 'bbb' & input$name2 == 'bobo')
      print('IT\'s you!')
    else
      print(paste('NO,not you!!       Wrong:',input$submit,"times"))
    }
  })
 
  output$bobo <- renderImage({
        if(input$submit !=0){
          if(input$name1 == 'bbb' & input$name2 == 'bobo'){
          filename<- normalizePath(file.path('www/bobo.png'))
          list(src=filename)
          }
          else
            filename<- normalizePath(file.path('www/boom.png'))
            list(src=filename)
        }
        else
          filename<- normalizePath(file.path('www/wenhao.png'))
          list(src=filename)
    
  },deleteFile=FALSE)
  
  
 
  
})