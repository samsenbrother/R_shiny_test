score<-function(data){
  quan<-c(0.083195,0.079867,0.02995,0.09817,0.086522,0.081531,0.058236,0.048253,0.03827,0.06822,0.044925,0.048253,0.071547,0.031614,0.054908,0.076539)
  apply(data,1,FUN = function(x) x*quan)->data
  apply(data,2,sum)->score
  return(score)
}









