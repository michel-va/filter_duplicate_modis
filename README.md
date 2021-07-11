# filter multiple observations of the same fire in MODIS active fire dataset

## Introduction 
MODIS active-fire data rely on observation done by Aqua and Terra satellites detecting thermal anomalities within a 1km radius. Each satellite offer two monitoring opportinities for each day, leading to each fire being potentially detected fours times a day. The short revisiting time and relatively good performance for monitoring fire made MODIS one of the essential tools for monitoring fire and understand their underlying drivers. However, the possibility of detected several times the same fire could biaised count and give mroe weight in the analysis to large fire burning through the day, affecting the quality of analysis building on these data. The short algorithm proposed in this dataset allow to filter this multiples detection, returning only the fire with the highest Fire Radiative Power everyday. Data used for developping the algorithm and the figures are based on MODIS AF in the Brazilian Amazon between 2003 to 2020, but other data could be downloaded from https://firms.modaps.eosdis.nasa.gov/download/. 

## Algorithm 
First, the algorithm is going to select only active fire with a confidence over the observation over 30%. Then a function is created to filtered multiple observation distant of less than 1000m and return only the observation with the highest fire radiative power. Nested loop allow to run this function on subset corresponding to each day over the period of observation. As MODIS dataset could be quite large and take a long time to process, one oculd use parrallisation to use different core for processing each year of the dataset. 


## Quality control 
In the Brazilian Amazon over the 2003 to 2020 period, the algorithm retained approximetaly 73% of the observation. Without detailled analysis, we wanted to see if the proportions of filtered fire were constant across time and space to understand how it could distord further analysis based on these data. 

![image](https://user-images.githubusercontent.com/84012797/125208621-fa291b80-e293-11eb-959d-f810aee3fc46.png)



*Proportions of fire retained by the algorithm over years*

![image](https://user-images.githubusercontent.com/84012797/125208702-6dcb2880-e294-11eb-8514-5936bd32d0f2.png)


*Proportions of fire retained by the algorithm over years*


![image](https://user-images.githubusercontent.com/84012797/125209232-bfc17d80-e297-11eb-9230-8b17f44e836f.png)

*Raster showing the proportions of fires retained across 2003-2020 period in the Brazilian Amazon*

![image](https://user-images.githubusercontent.com/84012797/125209250-da93f200-e297-11eb-823d-003da9c5a949.png)

*Proportions of fire retained according to then umber of fire detection over the year 
## Credit
Repository developped and wrote by Michel Valette and Evangeline Wilby
