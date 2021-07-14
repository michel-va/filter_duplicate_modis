# Filter multiple observations of the same fire in MODIS active fire dataset

## Introduction 
MODIS active-fire data rely on observation done by Aqua and Terra satellites detecting thermal anomalies within a 1km radius. Each satellite offers two monitoring opportunities for each day, leading to each fire being potentially detected fours times a day. The short revisiting time and relatively good performance for monitoring fire made MODIS one of the essential tools for monitoring fire and understand its underlying drivers. However, the possibility of detected several times the same fire could biased count and give more weight in the analysis to large fire burning throughout the day, affecting the quality of analysis building on these data. The short algorithm proposed in this dataset allows filtering this multiples detection, returning only the fire with the highest Fire Radiative Power every day. Data used for developing the algorithm and the figures are based on MODIS AF in the Brazilian Amazon between 2003 to 2020, but other data could be downloaded from https://firms.modaps.eosdis.nasa.gov/download/. 

## Algorithm 
First, the algorithm is going to select only active fire with confidence of over 30%. Then a function is created to filtered multiple observations distant of less than 1000m and return only the observation with the highest fire radiative power. Nested loops allow running this function on subsets corresponding to each day over the period of observation. As MODIS dataset could be quite large and take a long time to process, one could use parallelisation to use different cores for processing each year of the dataset. 

## Quality control 
In the Brazilian Amazon over the 2003 to 2020 period, the algorithm retained approximately 78% of the observation. Without detailed analysis, we wanted to see if the proportions of filtered fire were constant across time and space to understand how it could distort further analysis based on these data. It seems that the percentage of fire filtered by the algorithm vary among years and months, with the lowest proportions of fires retained over years with many fires. When mapping the percentage of fire retained, we can see that the south-eastern border of the Amazon (with frequent agricultural fires) tend to have lower proportions of fires retained. 

![image](https://user-images.githubusercontent.com/84012797/125208621-fa291b80-e293-11eb-959d-f810aee3fc46.png)

*Proportions of fire retained by the algorithm over years*

![image](https://user-images.githubusercontent.com/84012797/125208702-6dcb2880-e294-11eb-8514-5936bd32d0f2.png)

*Proportions of fire retained by the algorithm over years*

![image](https://user-images.githubusercontent.com/84012797/125209250-da93f200-e297-11eb-823d-003da9c5a949.png)

*Proportions of fire retained according to then umber of fire detection over the year* 

![image](https://user-images.githubusercontent.com/84012797/125209232-bfc17d80-e297-11eb-9230-8b17f44e836f.png)

*Raster showing the proportions of fires retained across 2003-2020 period in the Brazilian Amazon*

## Credit
Repository developped and wrote by Michel Valette and Evangeline Wilby
