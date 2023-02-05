Requirements: 
1. R Studio (https://posit.co/products/open-source/rstudio/)

# Evaporation Models
Instructions to run:
1. The R code can be found at Code/Code.Rmd (https://github.com/moazzamalirind/EvaporationModels/blob/main/Code/Code.Rmd).
2. Within the code you just have to change the data source. 
For example: line 108 say "Sta_daily_2019 = ("Data/Stavoren_daily_2019_revised.txt", sep="\t", header=TRUE)". You have to change the source "Data/Stavoren_daily_2019_revised.txt" to location where your data is saved. 
All the required data is available within "Data" folder.  

Tips:   
1.  One easy way is to download the whole repository as Zip (click Code drop down and Download Zip) and save it to your desired loaction. 
2.  Unzip the folder and open file "Evaporation Models.Rproj".
3.  It might be helpful to set wroking directory to the folder where your "Evaporation Models.Rproj" is located. 
4.  You can update working directory in Rstudio environment by clicking Session (locted in the top menu bar) then Set working directory and choose Directory.
5.  Once your directory is set to the folder of "Evaporation Models.Rproj" (check: location will have a code folder). The code is ready to run.
6.  You can run each chunk of the code (gray shaded area) by just clicking the play button loacted at right top corner of the chunk.
    (Portion in the white background and starting with # are comments. Portion with Gray Background without # sign is the code).
7.  There are comments throughout the script describing details about operations and datasets.


##Note: For estimation at any other study locations, it is recommended to use script available in the Generalized_Template folder. Please follow the readme for easy sailing. 

For any further questions, happy to answer at moazzam.rind@wsu.edu.

