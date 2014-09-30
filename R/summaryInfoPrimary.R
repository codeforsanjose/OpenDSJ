#You can run the below as is to get the comma separate txt file with the info you need

library(zipcode)
library(plyr)

A.Contributions.Table.1 <- read.csv("~/Dropbox/opendisclosure/City Data/2014_CSJ/A-Contributions-Table 1.csv", stringsAsFactors=FALSE)
efile_newest_CSJ_2013_A_contributions <- read.csv("~/Dropbox/opendisclosure/City Data/2013_CSJ/efile_newest_CSJ_2013_A_contributions.csv", stringsAsFactors=FALSE)

#View(A.Contributions.Table.1)
#View(efile_newest_CSJ_2013_A_contributions)
mayor2013<-efile_newest_CSJ_2013_A_contributions
mayor2014 <- A.Contributions.Table.1

combo <- data.frame(stringsAsFactors=FALSE)
combo <- rbind(mayor2013, mayor2014)

#cleaning zipcodes
combo$Tran_Zip4
combo$Tran_Zip4 <- as.character(combo$Tran_Zip4)

#Need to take care of case where "95132-"
#clean.zipcodes doesn't take care of cases with "-" at the end.  Instead, it returns NA's
#Though 95132-2110 is cleaned to 95132
for(i in 1:nrow(combo)) {                 #takes a few mins
  if(nchar(combo$Tran_Zip4[i]) == 6)    #looking for cases only when zipcode is 6 char long
  {
    combo$Tran_Zip4[i] <- gsub("-.*","",combo$Tran_Zip4[i])
  }
}
combo$Tran_Zip4 <- clean.zipcodes(combo$Tran_Zip4)

#cleaning dates
#something is wrong with dates in df mayor2014
combo$Tran_Date <- as.Date(as.character(combo$Tran_Date), "%m/%d/%Y")

combo$Rpt_Date <- as.Date(as.character(combo$Rpt_Date), "%m/%d/%Y")

combo$From_Date <- as.Date(as.character(combo$From_Date), "%m/%d/%Y")

somemayors <- data.frame(combo$Filer_NamL, combo$Filer_ID, combo$Rpt_Date, combo$From_Date, combo$Tran_Date, combo$Tran_ID, combo$Tran_NamL, combo$Tran_Zip4, combo$Tran_City, combo$Tran_State, combo$Tran_Amt1)

str(somemayors)
mayors <- rename(somemayors, c("combo.Filer_NamL"="Cands", "combo.Filer_ID"="ID", "combo.Rpt_Date"="RDate", "combo.From_Date" = "FDate", "combo.Tran_Date"="TDate",  "combo.Tran_ID" = "TranID","combo.Tran_NamL" = "TranName",
                               "combo.Tran_Zip4"="Zip", "combo.Tran_City"="City", "combo.Tran_State"="State", "combo.Tran_Amt1"="Amt1")) 

allMayorsByZip <- aggregate(Amt1 ~ Zip + ID, data = mayors, FUN = sum)

#For Nguyen
nguyen <- allMayorsByZip[allMayorsByZip$ID == 1359805, ] 
nguyen$firstCol <- "primary"
nguyen$secCol <- "Nguyen"
nguyen$ID <- NULL
nguyen <- nguyen[ , c(3, 4, 1, 2)] #Reorder

#For Liccardo
liccardo <- allMayorsByZip[allMayorsByZip$ID == 1361139, ] 
liccardo$firstCol <- "primary"
liccardo$secCol <- "Liccardo"
liccardo$ID <- NULL
liccardo <- liccardo[ , c(3, 4, 1, 2)] #Reorder

#For Oliverio
oliverio <- allMayorsByZip[allMayorsByZip$ID == 1362117, ] 
oliverio$firstCol <- "primary"
oliverio$secCol <- "Oliverio"
oliverio$ID <- NULL
oliverio <- oliverio[ , c(3, 4, 1, 2)] #Reorder

#For Cortese
cortese <- allMayorsByZip[allMayorsByZip$ID == 1362187, ] 
cortese$firstCol <- "primary"
cortese$secCol <- "Cortese"
cortese$ID <- NULL
cortese <- cortese[ , c(3, 4, 1, 2)] #Reorder

#For Herrera
herrera <- allMayorsByZip[allMayorsByZip$ID == 1362068, ] 
herrera$firstCol <- "primary"
herrera$secCol <- "Herrera"
herrera$ID <- NULL
herrera <- herrera[ , c(3, 4, 1, 2)] #Reorder

summaryInfoPrimary <- rbind(nguyen, liccardo, oliverio, cortese, herrera)

write.table(summaryInfoPrimary, "summaryInfoPrimary.txt", quote=FALSE, sep="," , row.names=FALSE, col.names=FALSE)

getwd() #find summaryInfoPrimary.txt
