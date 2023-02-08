## Requirements: 
1. R Studio (https://posit.co/products/open-source/rstudio/)
2. An excel file with atleast following columns: 
  a. LE = latent heat flux (W/m2)
  b. Kin = global radiation (W/m2)
  c. u = wind speed (m/s)
  d. Twater = sub-skin water temperature (C)
  e. Tair		= Air temperature (C)
  f. Relative Humidity (%)
 
 Optional: De = vapour pressure gradient (kpa), VPD = vapour pressure deficit (kpa), and H	= Sensible heat flux [W/m2]
  
 ##Note: You can add or remove information as per your site and models selection. The above mentioned variable are for two obervation locations "Stavoren and Trintelhaven" at Lake Lake Ijssel, Netherlands. Excel file "Data_Netherlands.xlsx" given here has four sheets i.e. summer of 2019 and 2020 for both locations.
  
Instructions to run:
1. The script has text explaining each chuck of the code. However, you are just required to specifiy the Excel file location i.e. on line 111,112,113 and 114 inorder to excute the script.
For example, the given code only specify the file name (""Data_Netherlands.xlsx") instead of file path because my R working directory and file location is same. For help  to set directory refer :http://rfunction.com/archives/1001.  Other option is to specify path of the data file instead of name only. 

For any further questions, happy to answer at moazzam.rind@wsu.edu.

