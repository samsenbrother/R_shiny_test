shinyUI(fluidPage(
  titlePanel('Test title'),
  sidebarLayout(position = 'right',
    sidebarPanel('sidebarPanel'),
    mainPanel('MainPanel')
    )
))