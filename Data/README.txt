Title of the dataset:
Open water evaporation of Lake IJssel, scripts and data used for regression analyses in the study 'Evaporation from a large lowland reservoir – observed dynamics and drivers during a warm summer'.

Creators:
Femke A. Jansen (femke.jansen@wur.nl)
Remko Uijlenhoet (R.Uijlenhoet@tudelft.nl)
Cor M.J. Jacobs (cor.jacobs@rivm.nl)
Adriaan J. Teuling (ryan.teuling@wur.nl)


Related publication:
'Evaporation from a large lowland reservoir – observed dynamics and drivers during a warm summer'

Related dataset:
Open water evaporation of Lake IJssel, data used in the study 'Evaporation from a large lowland reservoir – observed dynamics during a warm summer'
(doi: 10.4121/16601675)


Description:
Scripts in the programming language R and accompanying datasets that are used for regression analysis in the study 
'Evaporation from a large lowland reservoir – observed dynamics during a warm summer'. 
The analysis provides insight in which variables can explain open water evaporation of Lake IJssel, the Netherlands, 
measured at two locations for the years 2019 and 2020. There are 4 scripts for each location (i.e. Stavoren and Trintelhaven): 
for (1) the hourly and (2) daily temporal scale, and for analysis based on (3) our own observations (doi: 10.4121/16601675), 
and (4) routinely measured data by the Royal Netherlands Meteorological Institute (KNMI -https://www.knmi.nl/nederland-nu/klimatologie/uurgegevens (last access: 01-11-2021)) 
and the Directorate-General for Public Works and Water Management (Rijkswaterstaat - https://waterinfo.rws.nl/#!/kaart/watertemperatuur/ (last access: 01-11-2021)).
The datasets consist of evaporation data, and five possible explanatory variables: global radiation, wind speed, vertical vapour pressure gradient,
vapour pressure deficit, and water temperature. The datasets of the routinely measured data consist of combined data that is sourced from KNMI (global radiation, 
wind speed, vapour pressure gradient, vapour pressure deficit) and Rijkswaterstaat (water temperature). For more information about the datasets that 
are based on our own observations, have a look at doi:10.4121/16601675 (related dataset). 

Keywords:
Evaporation
Open water evaporation
Regression analysis
Data-driven approach
Lake IJssel
IJsselmeer
Hydrology
Meteorology
Eddy covariance


Spatial coverage:
Lake IJssel, the Netherlands


Temporal coverage:
2019-2020, summer periods (1st of May - 31st of August)


This dataset contains the following files:
Regression_Stavoren_hourly_revised.R
Regression_Stavoren_daily_revised.R
Regression_Stavoren_hourly_routine_revised.R
Regression_Stavoren_daily_routine_revised.R
Regression_Trintelhaven_hourly_revised.R
Regression_Trintelhaven_daily_revised.R
Regression_Trintelhaven_hourly_routine_revised.R
Regression_Trintelhaven_daily_routine_revised.R
Stavoren_hourly_2019_revised.txt
Stavoren_hourly_2020_revised.txt
Stavoren_daily_2019_revised.txt
Stavoren_daily_2020_revised.txt
Stavoren_hourly_2019_routine_revised.txt
Stavoren_hourly_2020_routine_revised.txt
Stavoren_daily_2019_routine_revised.txt
Stavoren_daily_2020_routine_revised.txt
Trintelhaven_hourly_2019_revised.txt
Trintelhaven_hourly_2020_revised.txt
Trintelhaven_daily_2019_revised.txt
Trintelhaven_daily_2020_revised.txt
Trintelhaven_hourly_2019_routine_revised.txt
Trintelhaven_hourly_2020_routine_revised.txt
Trintelhaven_daily_2019_routine_revised.txt
Trintelhaven_daily_2020_routine_revised.txt


Explanation of variables in the datasets (.txt files):
LE		= Latent heat flux [W/m2]
Kin		= Global radiation [W/m2]
u		= Wind speed [m/s]
De		= Vertical vapour pressure gradient [kPa]
VPD		= Vapour pressure gradient [kPa]
Twater		= Water temperature [degree Celsius]
All columns that follow [6:32] are the product of a combination of the abovementioned variables (except for LE) indicated by '_'.

Explanation of the R-scripts can be found in the comments (indicated by #) in the scripts.

Methods, materials and software:
Data was collected using an eddy covariance instrument of the type IRGASON and the data was processed using EddyPro software. 
Tair and RH were measured using HMP155A instruments. 
Routinely measured observations are retrieved from KNMI (KNMI -https://www.knmi.nl/nederland-nu/klimatologie/uurgegevens (last access: 01-11-2021)) 
and Rijkswaterstaat (Rijkswaterstaat - https://waterinfo.rws.nl/#!/kaart/watertemperatuur/ (last access: 01-11-2021)). 
A detailed description of the set-up and methods used can be found in the accompanying study 'Evaporation from a large lowland reservoir – observed dynamics during a warm summer'.


This dataset is published under the CC BY (Attribution) license.
This license allows reusers to distribute, remix, adapt, and build upon the material in any medium or format, so long as attribution is given to the creator.

