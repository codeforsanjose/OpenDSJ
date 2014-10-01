#Written by Lynna and Vivek
#See OpenDSJ (v1) for details.

#You can run the below as is to get the comma separate txt file with the info you need

#Choose the cut off date where the amt contributed is for the runoff (not for the primary).
#The contributions given strictly after this date is considered for the runoff 
cutOffDate <- as.Date(as.character("2014-06-05"))  #The date has to be input in YYYY-MM-DD format

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


########### Now, we use "mayors" dataframe to aggregate the contributions for the primary #############

primaryCandidates <- aggregate(Amt1 ~ Zip + ID + TDate, 
                               data = mayors[(mayors$TDate <= cutOffDate),], FUN = sum)

primaryColorBucket <- as.numeric(cut2(primaryCandidates$Amt1, g = 7))

#Color Subs
color <- numeric()
color[1:7] = c('#ffffb2', '#fed976', '#feb24c', '#fd8d3c','#fc4e2a', '#e31a1c',  '#b10026')

newColors <- ifelse(primaryColorBucket==1, color[1],
              ifelse(primaryColorBucket == 2, color[2], 
                     ifelse(primaryColorBucket == 3, color[3], 
                            ifelse(primaryColorBucket == 4, color[4], 
                                   ifelse(primaryColorBucket == 5, color[5], 
                                          ifelse(primaryColorBucket == 6, color[6], 
                                                 color[7]))))))

primaryCandidates[5] <- newColors
colnames(primaryCandidates)[5] <-'color'



#For Nguyen
nguyen <- primaryCandidates[primaryCandidates$ID == 1359805, ] 
nguyen$firstCol <- "primary"
nguyen$secCol <- "Nguyen"
nguyen$ID <- NULL
nguyen <- nguyen[ , c(5, 6, 2, 1, 3, 4)] #Reorder

#For Liccardo
liccardo <- primaryCandidates[primaryCandidates$ID == 1361139, ] 
liccardo$firstCol <- "primary"
liccardo$secCol <- "Liccardo"
liccardo$ID <- NULL
liccardo <- liccardo[ , c(5, 6, 2, 1, 3, 4)] #Reorder

#For Oliverio
oliverio <- primaryCandidates[primaryCandidates$ID == 1362117, ] 
oliverio$firstCol <- "primary"
oliverio$secCol <- "Oliverio"
oliverio$ID <- NULL
oliverio <- oliverio[ , c(5, 6, 2, 1, 3, 4)] #Reorder

#For Cortese
cortese <- primaryCandidates[primaryCandidates$ID == 1362187, ] 
cortese$firstCol <- "primary"
cortese$secCol <- "Cortese"
cortese$ID <- NULL
cortese <- cortese[ , c(5, 6, 2, 1, 3, 4)] #Reorder

#For Herrera
herrera <- primaryCandidates[primaryCandidates$ID == 1362068, ] 
herrera$firstCol <- "primary"
herrera$secCol <- "Herrera"
herrera$ID <- NULL
herrera <- herrera[ , c(5, 6, 2, 1, 3, 4)] #Reorder


#################### Then, for the runoff ####################

runOffCandidates <- aggregate(Amt1 ~ Zip + ID + TDate, 
                               data = mayors[(mayors$TDate > cutOffDate),], FUN = sum)

primaryColorBucket <- numeric()
primaryColorBucket <- as.numeric(cut2(runOffCandidates$Amt1, g = 7))

#Color Subs
#color <- numeric()
#color[1:7] = c('#ffffb2', '#fed976', '#feb24c', '#fd8d3c','#fc4e2a', '#e31a1c',  '#b10026')

newColors <- ifelse(primaryColorBucket==1, color[1],
                    ifelse(primaryColorBucket == 2, color[2], 
                           ifelse(primaryColorBucket == 3, color[3], 
                                  ifelse(primaryColorBucket == 4, color[4], 
                                         ifelse(primaryColorBucket == 5, color[5], 
                                                ifelse(primaryColorBucket == 6, color[6], 
                                                       color[7]))))))

runOffCandidates[5] <- newColors
colnames(runOffCandidates)[5] <-'color'




#For Liccardo
liccardoRunOff <- runOffCandidates[runOffCandidates$ID == 1361139, ] 
liccardoRunOff$firstCol <- "runoff"
liccardoRunOff$secCol <- "Liccardo"
liccardoRunOff$ID <- NULL
liccardoRunOff <- liccardoRunOff[ , c(5, 6, 2, 1, 3, 4)] #Reorder

#For Cortese
corteseRunOff <- primaryCandidates[runOffCandidates$ID == 1362187, ] 
corteseRunOff$firstCol <- "runoff"
corteseRunOff$secCol <- "Cortese"
corteseRunOff$ID <- NULL
corteseRunOff <- corteseRunOff[ , c(5, 6, 2, 1, 3, 4)] #Reorder


#################### Row-bind everything ######################
summaryInfo <- rbind(nguyen, liccardo, oliverio, cortese, herrera, liccardoRunOff, corteseRunOff)


write.table(summaryInfo, "summaryInfo.txt", quote=FALSE, sep="," , row.names=FALSE, col.names=FALSE)

getwd() #find summaryInfo.txt
