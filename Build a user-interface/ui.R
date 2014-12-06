# ui.R

shinyUI(fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel('zhizhi is sb',p('zhizhi is sb',span('zhizhi is sb ',style="color:blue"),br(),strong("zhizhi is sb"),em('zhizhi is sb',style = "color:blue"),code('zhizhi is sb')),code("zhizhi is sb",style="color:blue")),
    mainPanel(
      p("p creates a paragraph of text. Note: this paragraph is followed by br(), which makes a blank line."),
      p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph", style = "font-family: 'times'; font-si16pt"),
      strong("strong() makes bold text."),
      em("em() creates italicized (i.e, emphasized) text."),
      br(),
      code("code displays your text similar to computer code"),
      div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
      br(),
      p("span does the same thing as div, but it works with",
        span("groups of words", style = "color:blue"),
        "that appear inside a paragraph."),
      img(src='bigorb.png',height=400,width=400)
    )
  )
))