//Invention Rates and Parental Income//

**Set Working Directory 
cd "/Users/lauren/Desktop/Invention Rates/Project"

*load in the data 
use inventionrates.dta

**Rename variables that represent number of students from each parent income quintile
#First quintile students
rename count_pq1 firstq

#Second quintile students
rename count_pq2 secondq

#Third quintile students
rename count_pq3 thirdq

#Fourth quintile students
rename count_pq4 fourthq

#Fifth quintile students
rename count_pq5 fifthq

**Rename variables that represent share of inventors conditional on parent income quintile 
#First quintile inventors
rename inventor_pq1 firstiq

#Second quintile inventors
rename inventor_pq2 secondiq

#Third quintile inventors
rename inventor_pq3 thirdiq

#Fourth quintile inventors
rename inventor_pq4 fourthiq

#Fifthquintile inventors
rename inventor_pq5 fifthiq

**Table 1: Summary Statistics using 4 variables 
sum firstq fifthq fistiq fifthiq

**Figure 1: Bar Graph
graph bar firstq fifthq, 
ytitle("Number of Students")
b1title("First and Fifth Parent Income Quintiles") 
title("Average Number of Students Representing First and Fifth Parent Income Quintiles")

**Figure 2: Scatterplot
twoway scatter fifthq total_patents || lfit fifthq total_patents, lw(0.7) lc(cranberry) title("Share of Inventors Among the Fifth Parent Income Quintile")
xtitle("College Students Among the Fifth Parent Income Quintile") ytitle("Share of Students Granted a Patent") graphregion(color(white) fcolor(white))

**Figure 3: Scatterplot
twoway scatter firstq total_patents || lfit firstq total_patents, lw(0.7) lc(cranberry) title("Share of Inventors Among the First Parent Income Quintile")
xtitle("College Student Among the Fifth Parent Income Quintile") ytitle("Share of Students Granted a Patent") graphregion(color(white) fcolor(white))

**Regression tables
*Install package for outreg2
ssc install outreg2 

**Table 3
regress fifthq total_patents 
outreg2 using myfile, replace ctitle(5th Q)label

regress firstq total_patents
outreg2 using myfile, append ctitle(1st Q) label

//End//









