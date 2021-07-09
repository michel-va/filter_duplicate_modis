################################################################
################################################################



### Load the packages
library(sf)



jobID<-Sys.getenv("PBS_ARRAY_INDEX")
name_file<-paste("modis/modis_",jobID,".shp",sep="")
modis<-st_read(name_file)

### Make a function for looping 

myfunc<-function(modist){
  for(i in 1:nrow(modist)){
    
    if (i==1){                    ### Initialise the dataframe 
      output_temp<-modist[i,] 
    }
    
    else{
      a<-as.numeric(min(st_distance(modist[i,],output_temp))) ### Calculate minimal distance between AF already sorted and the new line 
      
      if(a>1000){                                            ### If no duplicate, we bind the new row 
        output_temp<-rbind(output_temp,modist[i,])        
      }
      
      else{                                                 ### If duplicate, we choose the rows with the highest FRP 
        t<-which.min(st_distance(modist[i,],output_temp))
        
        if(output_temp[t,'FRP'][[1]]>modist[i,"FRP"][[1]]){
        }else{
          output_temp<-output_temp[-t,]                    ### Remove less intense fire 
          output_temp<-rbind(output_temp,modist[i,])
          
        }
        print(i)
        # Need to find how to select the one of interest 
      }
    }}
  return(output_temp)
}


#############################
### Loop the function

output<-data.frame()

### Apply the loop over a years 
for (i in 1:length(unique(modis$day))){
  print(unique(modis$day)[[i]])
  modist<-subset(modis,day==unique(modis$day)[[i]])
  output_temp<-modist[i,]
  output_temp<-myfunc(modist)
  output<-rbind(output,output_temp)
}




path<-paste("output/modis_filtered",jobID,".shp",sep="")


st_write(output,path)



