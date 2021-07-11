# filter_duplicate_modis

MODIS relies on two satellites, Aqua and Terra, taking coarse-resolution images of the earth with a relatively good temporal resolution. They differ from Landsat satellites (taking high-resolution images with a bad temporal resolution) and geostationary satellites (taking extremely coarse resolution images with a high temporal resolution). The presence of two satellites and the short revisiting time gives us several opportunities to detect fires every day, but also poses an issue about multiple observations of the same fire. This could end up increasing the weight given to certain fires or over certain days, affecting the quality of future analysis based on this data. 

I have developed an algorithm that removes multiple observations of the same fires for each day. As this issue is common to all analysis based on MODIS AF data, I would like to share this algorithm and preliminary analysis on GitHub so other academics and members of the civil society could use it. I would also be curious to see if the difference in the number of fires observed with and without the filtering is constant through time and space. My suspicion being that fires in a period with lower law enforcement efforts (and thus less incentive to burn small fires is hard to detect) and on agricultural land they tend to be detected more frequently. 

The data shows that the rate of duplication is not the same across time and space. Figures 1 and 2 show the percentage of AF that remain after filtering the data to remove duplications across the years 2003-2019 and also throughout the months of the year. Figure 3 shows that the percentage of AF remaining after filtering the data is also not spatially consistent in the amazon biome. 

![image](https://user-images.githubusercontent.com/84012797/125195171-cb3f8500-e254-11eb-8650-c11281607f49.png)

