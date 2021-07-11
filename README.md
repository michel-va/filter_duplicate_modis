# filter multiple observations of the same fire in MODIS active fire dataset

## introduction 
MODIS active-fire data rely on observation done by Aqua and Terra satellites detecting thermal anomalities within a 1km radius. Each satellite offer two monitoring opportinities for each day, leading to each fire being potentially detected fours times a day. The short revisiting time and relatively good performance for monitoring fire made MODIS one of the essential tools for monitoring fire and understand their underlying drivers. However, the possibility of detected several times the same fire could biaised count and give mroe weight in the analysis to large fire burning through the day, affecting the quality of analysis building on these data. The short algorithm proposed in this dataset allow to filter this multiples detection, returning only the fire with the highest Fire Radiative Power everyday. Data used for developping the algorithm and the figures are based on MODIS AF in the Brazilian Amazon between 2003 to 2020, but other data could be downloaded from https://firms.modaps.eosdis.nasa.gov/download/. 

## Algorithm 
The algorithm is creating separate list for each day of the dataset. For each day, it will check for each fire if any other fire is located less than 1km away. If there is two fires located less than 1km away (precision of MODIS data), it will retain only the fire with the highest fire radiative power. 


## Quality control 
The data shows that the rate of duplication is not the same across time and space. Figures 1 and 2 show the percentage of AF that remain after filtering the data to remove duplications across the years 2003-2019 and also throughout the months of the year. Figure 3 shows that the percentage of AF remaining after filtering the data is also not spatially consistent in the amazon biome. 

![image](https://user-images.githubusercontent.com/84012797/125195171-cb3f8500-e254-11eb-8650-c11281607f49.png)


## Credit
Repository developped and wrote by Michel Valette and Evangeline Wilby
