#ui.R
shinyUI(fluidPage(
  titlePanel(h1("My Shiny App")),
  sidebarLayout(position = "right",
      sidebarPanel(
        h1('Introducing Shiny'),
        p("shiny is a new package from Rstudio that makes it incredible"),
        br(),
        p("For an Introduction and live examples,vist the",strong("Shiny homepage",style="color:blue")),
        br(),
        br(),
        h2("Fetures"),
        p("*Build useful web applications with only a few lines of code-no JavaScript required"),
        p("Shiny applications are automatically that ",strong("spreadsheets")," are live,Outputs change instantly as users modify inputs")
      ),
      mainPanel(
        h2("Installation"),
        p("Shiny is availuble on CRAN,so you can ",br(),"install it in usual way from your R",br(),"console:"),
        code("install.packages('shiny')"),
        br(),
        br(),
        img(src='bigorb.png',height=150,width=150,"Shiny is a product of Rstudio")
        )
    )
))