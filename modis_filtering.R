################################################################
################################################################
################# Filtering MODIS AF ###########################


### Load the packages
library(sf)
library(lubridate)
library(tidyr)
library(tidyverse)
library(readxl)


### Load and process MODIS data 
modis<-st_read("modis/modis_amazon.shp") # Replace by the name of the MODIS file you want to filter 


### Make a column with day, year and month of the differents fires 
modis$year<-year(modis$ACQ_DATE)
modis$month<-month(modis$ACQ_DATE)
modis$day<-yday(modis$ACQ_DATE)

### Filter fire by confidence
modis<-subset(modis,CONFIDENCE>30)
modis<-st_cast(modis,'POINT')




### Function removing observation closer than 1000m in a subset of modist data 

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
        # Need to find how to select the one of interest 
      }
    }}
  return(output_temp)
}


#############################
### Loop the function to filter the data 

output<-data.frame()

### Apply the loop over a years 
for (i in 1:length(unique(modis$year))){
  y<-unique(modis$year)[[i]]
  print(paste(y,"year",sep=" "))
  
  modis1<-subset(modis,year=y)
  
  for (j in 1:length(unique(modis1$day))){
    d<-(unique(modis1$day)[[j]])
    print(d)
    modist<-subset(modis1,day==unique(modis1$day)[[j]])
    output_temp<-modist[j,]
    output_temp<-myfunc(modist)
    output<-rbind(output,output_temp)
    rm(modist)
  }
  
}

### Write the output 
st_write(output,"output.shp")

