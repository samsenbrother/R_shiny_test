library(markdown)

shinyUI(navbarPage(theme = "bootstrap.css",
                   "卖家竞争力情况",
                    
                   tabPanel('参考文档',
                     includeMarkdown('about.md')
                     ),
                   tabPanel("读取数据",
                            sidebarLayout(
                              sidebarPanel(
                                fileInput("seller","卖家数据文件.csv",accept = ".csv"
                                )
                              ),
                              mainPanel(
                                uiOutput('seller_ui'), #卖家选择
                                uiOutput('weidu'), #维度选择
                                textOutput('mean'),#平均值
                                textOutput('level'),#排名
                                plotOutput('summary')
                                
                                
                              )
                            )
                   ),
                   tabPanel("具体数据",
                            tableOutput('data')
                     ),
                   tabPanel('卖家维度对比',
                            uiOutput('weidu_1'), #维度选择
                            plotOutput('plot')      
                            
                     ),
                   tabPanel('卖家竞争力对比',
                            sidebarPanel(uiOutput('seller_jing1'), #卖家选择
                                uiOutput('seller_jing2')
                                
                                
                              
                            ),
                            mainPanel(
                              tableOutput('table'),
                              plotOutput('plot_jing')
                              
                              )
                     ),
                   tabPanel("竞争力总分分布情况",
                            plotOutput("fenbu")
                     
                     )
                   
                     
))