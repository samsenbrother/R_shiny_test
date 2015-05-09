library(markdown)

shinyUI(navbarPage("卖家竞争力情况",
                    tabPanel("读取数据",
                             sidebarLayout(
                               sidebarPanel(
                                fileInput("seller","卖家数据文件.csv",accept = ".csv"
                                 )
                               ),
                               mainPanel(
                                 uiOutput('seller_ui'), #卖家选择
                                 uiOutput('weidu'), #维度选择
                                 plotOutput('summary')
                              )
                             )
                    ),
                   tabPanel("具体数据",
                            tableOutput('data')
                     ),
                   tabPanel('卖家维度对比',
                            plotOutput('plot')      
                            
                     )
                   
                     
))