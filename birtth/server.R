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
            filename<- normalizePath(file.path('www/bobo.JPG'))
            list(src=filename)
          }
          else
            filename<- normalizePath(file.path('www/boom.JPG'))
            list(src=filename)
        }
        else
          filename<- normalizePath(file.path('www/wenhao.JPG'))
          list(src=filename)
    
  },deleteFile=FALSE)
  output$birth1 <- renderText({
        if(input$submit !=0){
          if(input$name1 == 'bbb' & input$name2 == 'bobo')
            print('Happy birthday BoBo!!')
        }
  })
  output$birth2 <- renderImage({
    if(input$submit !=0){
      if(input$name1 == 'bbb' & input$name2 == 'bobo'){
        filename<- normalizePath(file.path('www/birth.JPG'))
        list(src=filename)
      }
      else
        filename<- normalizePath(file.path('www/b.JPG'))
      list(src=filename)
    }
    else
      filename<- normalizePath(file.path('www/a.JPG'))
    list(src=filename)
    
  },deleteFile=FALSE)
  
  
 
  
})