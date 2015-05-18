library(dplyr)
library(ggplot2)
source('normalize.R')
source('plot.R')
source('score.R')
shinyServer(function(input, output, session) {
  data<-reactive({
    infile <-input$seller
    if(is.null(infile))
      return(NULL)
    tmp<-read.csv(infile$datapath,stringsAsFactor=F)
  })
  
  output$data <- renderTable({
    if(is.null(data()))
      return(NULL)
    data()
  }, options=list(pageLength=10))
  
  output$seller_ui <- renderUI({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    tmp %>% select(name) ->name
    name<-as.matrix(name)
    name<-as.vector(name)
    selectInput("sellers","Choose seller",name)
  })
  
  output$weidu <- renderUI({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    name<-names(tmp)
    name<-name[-c(1,2)]
    selectInput("Dim","Dim select",name)
  })
  
  output$weidu_1 <- renderUI({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    name<-names(tmp)
    name<-name[-c(1,2)]
    selectInput("Dim_1","Dim select",name)
  })
  #根据选择的卖家和维度作图
  
  output$plot <- renderPlot({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    seller <- input$sellers
    dim <- input$Dim_1
    #提取需要的数据到数据框先
    number<-names(tmp) %in% dim
    plotdata<-tmp[,number]
    plotdata<-scale(plotdata)
    plot(plotdata,dnorm(plotdata,mean(plotdata),sd(plotdata)),xlab = dim,ylab = "density")
  })
  
  output$mean <- renderText({
    if(is.null(data()))
      return(NULL)
    a<-"Mean:"
    tmp<-data()
    dim <- input$Dim
    number<-names(tmp) %in% dim
    plotdata<-tmp[,number]
    mean<-round(mean(plotdata),2)
    paste(a,mean)
  })
  
  output$level <- renderText({
    if(is.null(data()))
      return(NULL)
    a<-"排名:"
    b<-"击败了"
    c<-"%的卖家"
    tmp<-data()
    seller <- input$sellers
    tmp_1<-tmp%>%filter(name==seller)
    id<-tmp_1["id"]
    id<-as.vector(as.matrix(id))
    dim <- input$Dim
    number<-names(tmp) %in% dim
    plotdata<-tmp[,number]
    rank<-rank(plotdata)
    rank<-length(plotdata)+1-rank
    rank<-round(rank[id],2)
    rate<-round((1-rank/length(plotdata))*100,2)
    paste(a,rank,b,rate,c)
  })
  
  output$seller_jing1 <- renderUI({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    tmp %>% select(name) ->name
    name<-as.matrix(name)
    name<-as.vector(name)
    selectInput("s_1","选择一个卖家",name)
  })
  
  output$seller_jing2 <- renderUI({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    tmp %>% select(name) ->name
    name<-as.matrix(name)
    name<-as.vector(name)
    selectInput("s_2","选择另一个卖家",name)
  })
  
    output$plot_jing <- renderPlot({
      if(is.null(data()))
        return(NULL)
      tmp<-data()
      tmp<-tmp[-1]
      scale<-as.data.frame(scale(tmp[-1]))
      max=max(scale)
      min=min(scale)
      tmp<-cbind(tmp[1],scale)
      s1<-input$s_1
      s2<-input$s_2
      s<-c(s1,s2)
      tmp %>% filter(name==s[1] | name==s[2]) -> tmp
      names(tmp)[1] <- "group"
      CreateRadialPlot(tmp,grid.min = min,grid.max = max)
    })

  output$table <- renderTable({
    if(is.null(data()))
      return(NULL)
    tmp<-data()
    tmp1<-tmp[-c(1,2)]
    sc<-score(tmp1)
    d<-cbind(tmp[2],sc)
    rank<-rank(d$sc)
    cbind(d,rank)->d
    d%>% mutate(rate=round((1-rank/nrow(tmp))*100,2))->d
    dd<-d$rate
    s1<-input$s_1
    s2<-input$s_2
    s<-c(s1,s2)
    d$rate<-paste("击败",dd,"%",sep = '')
    e<-d %>% filter(name==s[1] | name==s[2])
    names(e)<-c("店铺名","得分","排名","成就")
    e
  })
  
  output$fenbu <- renderPlot({
    if(is.null(data()))
      return(NULL)
    ggplot(d,aes(sc))+geom_bar(aes(color=..x..))+xlab("评分")+guides(color="none")+theme_classic()
  })
  
  
})