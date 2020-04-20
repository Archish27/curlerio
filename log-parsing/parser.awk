NF>2 && NF%2==1{
  if( $5 !="Error" ){ 
    time=substr($5,1,length($5)-2)
  }else{
    time=substr($7,1,length($7)-2)
  }
  if(time+0>max)
  {
    max=time  
  }
}
END{
    print max
}
