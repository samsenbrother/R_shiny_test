shinyUI(fluidPage(
  titlePanel("Test:TO test whether you are my destony or not"),
  sidebarLayout(
    sidebarPanel(
      textInput('name1',label = p('Please Input your name'),value = '你的名字'),
      br(),
      textInput('name2',label = p('Please Input your nickname belongs to ElderSamSen')),
      br(),
      img(src='samsen.JPG',height=200,width=200),
      actionButton('submit',label=strong('测测'))
      
    ),
    mainPanel(
      h1(textOutput('namecheck'),align='center'),
      imageOutput('bobo',height=300,width=300),
      h1(textOutput('birth1')),
      br(),
      imageOutput('birth2',height=300,width=300),
      br()
      
      )
    
  )
  
))