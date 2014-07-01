#Questions

#Questions - Inside and Outside San Jose

#Sam Liccardo mayors fund
sum(subset(mayors, ID == 1361139)$Amt1)
nrow(subset(mayors, ID == 1361139))
#Total = 1244850
sum(subset(mayors, (ID == 1361139 & City == "san jose"))$Amt1)
#563703.8
sum(subset(mayors, (ID == 1361139 & City != "san jose"))$Amt1)
#681146

563703.8/(563703.8 + 681146)
681146/(563703.8 + 681146)
#45% vs 55% in san jose vs out of san jose


#Madison Nguyen [19] Madison Nguyen for Mayor 2014
1359805 Madison Nguyen for Mayor 2014
1359805
sum(subset(mayors, ID == 1359805)$Amt1, na.rm = TRUE)
?sum
sum(subset(mayors, ID == 1359805)$Amt1,  na.rm = TRUE)
#Total = 473498
sum(subset(mayors, (ID == 1359805 & City == "san jose"))$Amt1, na.rm = TRUE)
#268651
sum(subset(mayors, (ID == 1359805 & City != "san jose"))$Amt1, na.rm = TRUE)#681146
#204847,     - There is an NA value in Madison's data
268651/(268651 + 204847)
204847/(268651 + 204847)
#56.7 percent in san jose
#0.4326248 out of San Jose

nrow(subset(mayors, ID == 1359805))

#1362187 Dave Cortese
sum(subset(mayors, ID == 1362187)$Amt1)
#Total = 930001.4
nrow(subset(mayors, ID == 1362187))
3183 contributions
sum(subset(mayors, (ID == 1362187 & City == "san jose"))$Amt1)
#487655.2
sum(subset(mayors, (ID == 1362187 & City != "san jose"))$Amt1)
#442346.2

487655.2/(487655.2 + 442346.2)

442346.2/(487655.2 + 442346.2)

#52.4% vs 47.6% in san jose vs out of san jose


#Pierliugi Oliverio Pierluigi Oliverio for Mayor 2014 
1362117 Pierluigi Oliverio for Mayor 2014
#Oliverio
sum(subset(mayors, ID == 1362117)$Amt1)
#Total = 160768.5
nrow(subset(mayors, ID == 1362117))

a<-sum(subset(mayors, (ID == 1362117 & City == "san jose"))$Amt1)
#114820.5
b<-sum(subset(mayors, (ID == 1362117 & City != "san jose"))$Amt1)
#45948
a/(a+b)
b/(a+b)
#71.4 % inside
#28.5% outside

#Rose Herrera [36] Rose Herrera for Mayor 2014
1362068 Rose Herrera for Mayor 2014
#herrera
sum(subset(mayors, ID == 1362068)$Amt1, na.rm = TRUE)
#Total = 114709.5
nrow(subset(mayors, ID == 1362068))
C<-sum(subset(mayors, (ID == 1362068 & City == "san jose"))$Amt1, na.rm = TRUE)
#55507
D<-sum(subset(mayors, (ID == 1362068 & City != "san jose"))$Amt1, na.rm = TRUE)
#59202.51
C/(C+D)
D/(C+D)
#48.4% INSIDE
#51.6% outside

