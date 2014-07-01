str(jmayoral)
summary(jmayoral$ID)
jmayoral$ID
#98101 is negative.  lol. Two refunds happended in 2013

jmayoral$ID <- as.character(jmayoral$ID)

AllMayoralContributions <- aggregate(Amt1 ~ Zip, data = jmayoral, FUN=sum)
write.csv(AllMayoralContributions, file = "AllMayoralContributionsByZip.csv")

#1359805 Madison Nguyen for Mayor 2014
#1362117 Pierluigi Oliverio for Mayor 2014
#1362068 Rose Herrera for Mayor 2014
#1361139 Neighbors for Sam Liccardo for Mayor 2014
#1362187 Dave Cortese for Mayor 2014
a <- subset(jmayoral, ID == c(1359805))
b <- subset(jmayoral, ID == c(1362117))
c <- subset(jmayoral, ID == c(1362068))
d <- subset(jmayoral, ID == c(1361139))
e <- subset(jmayoral, ID == c(1362187))
str(a)
AMayoralContributions <- aggregate(Amt1 ~ Zip, data = a, FUN=sum)
BMayoralContributions <- aggregate(Amt1 ~ Zip, data = b, FUN=sum)
CMayoralContributions <- aggregate(Amt1 ~ Zip, data = c, FUN=sum)
DMayoralContributions <- aggregate(Amt1 ~ Zip, data = d, FUN=sum)
EMayoralContributions <- aggregate(Amt1 ~ Zip, data = e, FUN=sum)

write.csv(AMayoralContributions, file = "NguyenTotalContributionsByZip.csv")
write.csv(BMayoralContributions, file = "OliverioTotalContributionsByZip.csv")
write.csv(CMayoralContributions, file = "HerreraTotalContributionsByZip.csv")
write.csv(DMayoralContributions, file = "LiccardoTotalContributionsByZip.csv")
write.csv(EMayoralContributions, file = "CorteseTotalContributionsByZip.csv")
?aggregate
xtabs()
xtabs()
