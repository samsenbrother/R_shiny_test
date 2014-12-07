# ui.R

shinyUI(fluidPage(
  titlePanel("consusVis"),
  sidebarLayout(
    sidebarPanel(
      p("Create demographic maps with information from the 2010 US Census."),
      br(),
      column(5,
             selectInput("choose panel",label=strong("Choose a variable to display"),
              choices=list("Percent White"=1,"Percent Black"=2,"Percent Hispanic"=3,"Percent Asian"=4),selected=1)
            ),
      column(5,
             sliderInput("slider",label=strong("Range of interest"),
                min=0,max=100,value=c(0,100))      
            )
      ),
    mainPanel("")
    )
))