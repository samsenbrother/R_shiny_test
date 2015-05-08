library(markdown)

shinyUI(navbarPage("卖家竞争力情况",
                    tabPanel("读取数据",
                             sidebarLayout(
                               sidebarPanel(
                                fileInput("seller","卖家数据文件.csv",accept = ".csv"
                                 )
                               ),
                               mainPanel(
                                 uiOutput('seller_ui')
                               )
                             )
                    )
                   
                     
))