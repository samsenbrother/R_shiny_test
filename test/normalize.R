#数据标准化函数
sdprocess <- function(dataframe){
  data<-as.data.frame(scale(dataframe))
}