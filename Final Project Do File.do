**FINAL PROJECT
*(FINDING THE RELATIONSHIP BETWEEN PARENTAL INCOME AMONG COLLEGE STUDENTS AND INVENTION RATES)

**Set Working Directory 
cd "/Users/laurenirmak/Desktop/ECON 5/Final Project Stata"

*load in data
use inventionrates.dta

**Rename variables that represent number of students from each parent income quintile
#First quintile
rename count_pq1 firstq

#Second quintile
rename count_pq2 secondq

#Third quintile
rename count_pq3 thirdq

#Fourth quintile
rename count_pq4 fourthq

#Fifth quintile 
rename count_pq5 fifthq

**Rename variables that represent share of inventors conditional on parent income quintile 
#First quintile
rename inventor_pq1 firstiq

#Second quintile
rename inventor_pq2 secondiq

#Third quintile
rename inventor_pq3 thirdiq

#Fourth quintile
rename inventor_pq4 fourthiq

#Fifthquintile 
rename inventor_pq5 fifthiq

**Table 1: Summary Statistics
sum firstq fifthq fistiq fifthiq

**Figure 1: Bar Graph
graph bar firstq fifthq, 
ytitle("Number of Students")
b1title("First and Fifth Parent Income Quintiles") 
title("Average Number of Students Representing First and Fifth Parent Income Quintiles")

**Figure 2: Scatterplot
twoway scatter total_patents fifthq || lfit total_patents fifthq
p
**Figure 3: Scatterplot
twoway scatter total_patents firstq || lfit total_patents 

**Regression tables
*Install package for outreg2
ssc install outreg2 

**Table 3
regress fifthq total_patents 
outreg2 using myfile, replace ctitle(5th Q)label

regress firstq total_patents
outreg2 using myfile, append ctitle(1st Q) label

**END









