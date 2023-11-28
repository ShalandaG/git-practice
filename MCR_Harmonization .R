library('vegan')
library('car')
library('dplyr')
library('tidyr')
library(tibble)
library('devtools')
library(lubridate)
library('factoextra')
library('lme4')
library(ggplot2)
library(fuzzySim)
library(readr)


MCRLTER2 <- read_csv("0_raw_data/MCRLTER.csv")
head(MCRLTER2)
View(MCRLTER2)


####Add new column names, rename columns,and select needed columns 
##use tibble to add_columns project, measurement_type, measurement_unit, rename location ->site and add Habitat, rename transect ->subsite, add habitat, add coarse_group, add common group 


MCR <- MCRLTER2 %>% select(Year, Date, Site, Habitat, Transect, Count,Taxonomy,Biomass)

MCRedit <- MCR %>% add_column(project = "MCR", measurment_type = "wet biomass", measurment_unit = "grams", coarse_group ="fish", habitat= "ocean")
head(MCRedit)


MCR2 <- MCRedit %>% mutate(Month = month(Date), Day = day(Date))
head(MCR2)


colorder <- c("project", "Year", "Month", "Day", "Site", "Habitat", "Transect","Count", "measurment_type","Biomass", "measurment_unit","coarse_group", "habitat", "Taxonomy")
MCRupdate <- MCR2[,colorder]


MCRupdate2 <- MCRupdate %>%  unite("subsite", Habitat:Transect,remove = TRUE)



#####################practice getting species abbreviations 

###Mspecode <- (speciescode = spCodes(species, nchar.gen=3, nchar.sp=2, nchar.ssp = 2,sep.species = " ", sep.spcode = " ", verbosity = 2))


###species <- MCRLTER[,c("Taxonomy")]

