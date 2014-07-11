http://nf4.netfile.com/pub2/(X(1)S(jjctzwtjarjdqegnmv34v5oo))/Default.aspx?aid=CSJ&AspxAutoDetectCookieSupport=1

#install.packages("zipcode")
library(zipcode)
library(plyr)

setwd("/Users/Vivek/Dropbox/opendisclosure")
#Mac
A.Contributions.Table.1 <- read.csv("~/Dropbox/opendisclosure/City Data/efile_CSJ_2014 2/A-Contributions-Table 1.csv", stringsAsFactors=FALSE)
efile_newest_CSJ_2013_A_contributions <- read.csv("~/Dropbox/opendisclosure/City Data/2013_CSJ/efile_newest_CSJ_2013_A_contributions.csv", stringsAsFactors=FALSE)


#PC
A.Contributions.Table.1 <- read.csv("C:/Dropbox/opendisclosure/efile_CSJ_2014 2/A-Contributions-Table 1.csv")
efile_newest_CSJ_2013_A_contributions <- read.csv("C:/Dropbox/opendisclosure/2013_CSJ/efile_newest_CSJ_2013_A_contributions.csv")

#View(A.Contributions.Table.1)
#View(efile_newest_CSJ_2013_A_contributions)
mayor2013<-efile_newest_CSJ_2013_A_contributions
mayor2014 <- A.Contributions.Table.1

str(mayor2013)
#25445 obs

str(mayor2014)
#Both have 75 variables
#12240 Obs
combo <- data.frame(stringsAsFactors=FALSE)
combo <- rbind(mayor2013, mayor2014)

str(combo)
#Combo has 37685 observations, 75 variables
#25445+12240
#37685

combo$Tran_City <-as.factor(tolower(combo$Tran_City))
levels(combo$Tran_City)
#662 levels
#There are Tran_City categories that is out of place: "" (empty), "94116", "n/a"
#"sf" and "san francisco" should be combinded, but we are only interested in "San Jose" and "Not San Jose"
#so we'll only update "san joe", "san jose", "san  jose", "sj" and "san josr" to be combinded.
levels(combo$Tran_City) <- sub("^san joe$", "san jose", levels(combo$Tran_City))
levels(combo$Tran_City) <- sub("^san josr", "san jose", levels(combo$Tran_City))
levels(combo$Tran_City) <- sub("^san  jose", "san jose", levels(combo$Tran_City))
levels(combo$Tran_City) <- sub("^sj", "san jose", levels(combo$Tran_City))


#Need to take care of case where "95132-"
#Which doesn't get cleaned to 95132 but returns an error
#Though 95132-2110 is cleaned to 95132
combo$Tran_Zip4
combo$Tran_Zip4 <- as.character(combo$Tran_Zip4)

#This part can be slow
#for(i in 1:nrow(combo)) {
for(i in 1:37000) {
  if(!is.na(combo$Tran_Zip4[i]) && nchar(combo$Tran_Zip4[i]) >= 6)
  {
    if(substr(combo$Tran_Zip4[i],6, 6) == "-") {
      combo$Tran_Zip4[i] <- substr(combo$Tran_Zip4[i],1, 5)
    }
  }
}


combo$Tran_Zip4 <- clean.zipcodes(combo$Tran_Zip4)


combo$Tran_Date <- as.Date(as.character(combo$Tran_Date), "%m/%d/%Y")

combo$Rpt_Date <- as.Date(as.character(combo$Rpt_Date), "%m/%d/%Y")

combo$From_Date <- as.Date(as.character(combo$From_Date), "%m/%d/%Y")

somemayors <- data.frame(combo$Filer_NamL, combo$Filer_ID, combo$Rpt_Date, combo$From_Date, combo$Tran_Date, combo$Tran_ID, combo$Tran_NamL, combo$Tran_Zip4, combo$Tran_City, combo$Tran_State, combo$Tran_Amt1)

str(somemayors)
mayors <- rename(somemayors, c("combo.Filer_NamL"="Cands", "combo.Filer_ID"="ID", "combo.Rpt_Date"="RDate", "combo.From_Date" = "FDate", "combo.Tran_Date"="TDate",  "combo.Tran_ID" = "TranID","combo.Tran_NamL" = "TranName",
                              "combo.Tran_Zip4"="Zip", "combo.Tran_City"="City", "combo.Tran_State"="State", "combo.Tran_Amt1"="Amt1")) 


#sum(subset(mayors, Filer_ID == 1362117)$Amt1)
#############################################################
#SAN JOSE = san jose = SAN JOSE.  hmm.  data is messy.
#MILPITAS
#dO i CARE?
#made it all loser case.
str(mayors)

hist(as.numeric(mayors$ID))
hist(as.numeric(mayors$Cands))
#There are 54 different IDs with 57 different names.
unique(mayors$Cands)
unique(mayors$ID)

#We only care about 5 mayors?
#Madison Nguyen [19] Madison Nguyen for Mayor 2014
1359805 Madison Nguyen for Mayor 2014
1359805
sum(subset(mayors, ID == 1359805)$Amt1, na.rm = TRUE)
#473498,     - There is an NA value in Madison's data
#Dave Cortese
1362187 Dave Cortese for Mayor 2014
sum(subset(mayors, ID == 1362187)$Amt1)
#930001.4
#The rest of the PAC money has gone to support Santa Clara County Supervisor Dave Cortese. His mayoral bid has gotten a $245,000 boost from local unions such as police officers and firefighters. Included in the tally are $50,000 from the city's two casinos, forbidden by San Jose law from donating directly to candidates. That's on top of the $567,000 in direct contributions Cortese has received, much of which also came from unions.
#Which pac supports Cortese?
#South Bay Labor AFL-CIO Labor Council Committee on Political Education: $162,658 as of Wednesday

#South Bay Labor Council PAC

#Sam Licardo CITIZENS FOR A SAFE & STRONG SAN JOSE, SUPPORTING LICCARDO FOR MAYOR 2014  
1361139 Neighbors for Sam Liccardo for Mayor 2014
sum(subset(mayors, ID == 1361139)$Amt1)
#1,244,850 for Neighbors
#That's on top of the nearly $800,000 Liccardo had already raised in direct contributions -- largely from businesses -- giving him significantly more money than any other candidate.



1366242 CITIZENS FOR A SAFE & STRONG SAN JOSE, SUPPORTING LICCARDO FOR MAYOR 2014
sum(subset(mayors, ID == 1366242)$Amt1)
#228,000 dollars for Citizens
#http://www.mercurynews.com/bay-area-news/ci_25867723/pacs-leave-big-imprint-san-jose-mayors-race
#A PAC backing Councilman Sam Liccardo has received nearly $240,000 from a group of local CEOs and other business leaders -- many from outside San Jose. 

#Pierliugi Oliverio Pierluigi Oliverio for Mayor 2014 
1362117 Pierluigi Oliverio for Mayor 2014
sum(subset(mayors, ID == 1362117)$Amt1)
#Rose Herrera [36] Rose Herrera for Mayor 2014
1362068 Rose Herrera for Mayor 2014

#Firefighters?
#743393

#820668  San Jose Silicon Valley Chamber of Commerce Political Action Committee (ChamberPAC)
sum(subset(mayors, ID == 820668)$Amt1)
#783123.8

#744711  South Bay AFL-CIO Labor Council Committee on Political Education Sponsored by South Bay AFL-CIO Labor Council
sum(subset(mayors, ID == 744711)$Amt1)
#306362.9

#http://www.mercurynews.com/bay-area-news/ci_25867723/pacs-leave-big-imprint-san-jose-mayors-race
#Supporting Dave Cortese
#South Bay Labor AFL-CIO Labor Council Committee on Political Education: $162,658 as of Wednesday
#San Jose Firefighters, IAFF Local 230 PAC: $36,067 as of May 17
#San Jose Police Officers Association PAC: $31,776 as of May 9
#Santa Clara County Government Attorneys Association PAC: $9,389 as of May 9
#Association of Retired San Jose Police Officers and Firefighters PAC: $5,856 as of May 17
#Total: $245,746


sum(subset(mayors, TranName == "Casino M8trix")$Amt1)
#12500 from Casino M8trix
sum(sub2$Amt1)



sum(subset(mayors, ID == 743393)$Amt1)
# 190742.8
#Firefighters raised 190742


?subset
str(sub)

??tables

summary(mayors$Zip)
summary(mayors$City)
?tolower

#lets ignore Pac money for now.





head(mayors$City)
#
str(mayors)


summary(mayors$City)


#1359805 Madison Nguyen for Mayor 2014
#1362117 Pierluigi Oliverio for Mayor 2014
#1362068 Rose Herrera for Mayor 2014
#1361139 Neighbors for Sam Liccardo for Mayor 2014
#1362187 Dave Cortese for Mayor 2014
a <- subset(mayors, ID == c(1359805))
b <- subset(mayors, ID == c(1362117))
c <- subset(mayors, ID == c(1362068))
d <- subset(mayors, ID == c(1361139))
e <- subset(mayors, ID == c(1362187))
JustMayoralCampaignsNoPacs <- rbind(a, b,c,d,e)
#str(JustMayoralCampaignsNoPacs)
sum(JustMayoralCampaignsNoPacs$Amt1, na.rm = TRUE)
#2,450,329
#2923827
2923827-2450329
473498
setwd("/Users/Vivek/Dropbox/opendisclosure")
?write.table
write.csv(JustMayoralCampaignsNoPacs, file = "ContributionsToMayoral.csv")
?sum
jmayoral <- JustMayoralCampaignsNoPacs
#Just Mayoral ~
jmayoral$ID <- as.character(jmayoral$ID)
aggregate(Amt1 ~ Cands, data = jmayoral, FUN=sum)
str(jmayoral)
summary(jmayoral$ID)
jmayoral$ID
